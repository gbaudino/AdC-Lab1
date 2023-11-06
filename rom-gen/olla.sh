#! /bin/bash

# Autor: Bruno Castellano

PROG="${0##*/}"

function usage() {
	echo "$PROG: Opcode Loader for LEGv8 Architecture"
	echo -e "Usage:\n\t$PROG [options] <input file>"
	echo -e "Options:"
	echo -e "\t-h\t\t\tShow this help"
	echo -e "\t-o <output file>\tOutput file"
	echo -e "\t-m <mem file>\t\t.sv file in which an array-based memory is implemented"
	echo -e "\t-l <load path>\t\tPath to <output file> relative to <mem file>"
	echo -e "\t-t\t\t\tKeep temporary files"
	exit $1
}

while getopts "ho:m:l:t" opt; do
	case $opt in
		h)
			usage 0
			;;
		o)
			output="$PWD/$OPTARG"
			;;
		m)
			memfile="$PWD/$OPTARG"
			;;
		l)
			loadpath="$PWD/$OPTARG"
			;;
		t)
			keeptmp='t'
			;;
		\?)
			echo "Invalid option: -$OPTARG" >&2
			exit 1
			;;
		:)
			echo "Option -$OPTARG requires an argument." >&2
			exit 1
			;;
	esac
done

[ -n "${!OPTIND}" ] || usage 1
input="$PWD/${!OPTIND}"

# use <input> with changed ext as output as default
output="${output:-${input//.s/.txt}}"

if [ -d "$output" ]; then
	output="$output/${input##*/}"
	output="${output%.*}.txt"
fi

echo "$PROG: compiling: $input -> $output"
make --quiet --directory="${0%/*}" SRCFILE=$input || exit 1

grep -E '^\s+[[:digit:]]*' < ${input//.s/.list} |
	awk '{print $2}' |
	# Evil, stupid hack because we don't support normal nops
	sed "s/d503201f/8b1f03ff/g" > $output # Replace nop with add xzr, xzr, xzr

if [ -z "$keeptmp" ]; then
	echo "$PROG: cleaning temporary files"
	make --quiet --directory="${0%/*}" clean SRCFILE=$input
fi

if [ -n "$memfile" ]; then
	if [ -n "$loadpath" ] || [ -d "${memfile%/*}/progs" ]; then
		echo "$PROG: loading $output into memory at $memfile"
		loadpath="${loadpath:-progs/${output##*/}}"
		sedpattern='readmemh(.*,'
		sedreplace="readmemh(\"${loadpath//\//\\\/}\","
		grep 'initial $readmemh(.*)' $memfile > /dev/null
		if [ $? -ne 0 ]; then
			echo "$PROG: warning: could not find memory load in $memfile"
			echo -e "\tConsider adding the following line to your memory file:"
			echo -e '\tinitial $readmemh(, <mem_array>);'
			echo -e "\tand rerunning this script."
			exit 1
		fi
		sed -i "s/$sedpattern/$sedreplace/" $memfile
	else
		echo "$PROG: error: the directory ${memfile%/*}/progs does not exist"
		echo "	Please create it, add a symlink to yor programs directory"
		echo "	(ln -s /path/to/your/programs ${memfile%/*}/progs)"
		echo "	or specify a load path with -l"
		exit 1
	fi
fi
