transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+/home/guchimo/Documentos/TP1/AdC-Lab1/src {/home/guchimo/Documentos/TP1/AdC-Lab1/src/writeback.sv}
vlog -sv -work work +incdir+/home/guchimo/Documentos/TP1/AdC-Lab1/src {/home/guchimo/Documentos/TP1/AdC-Lab1/src/sl2.sv}
vlog -sv -work work +incdir+/home/guchimo/Documentos/TP1/AdC-Lab1/src {/home/guchimo/Documentos/TP1/AdC-Lab1/src/signext.sv}
vlog -sv -work work +incdir+/home/guchimo/Documentos/TP1/AdC-Lab1/src {/home/guchimo/Documentos/TP1/AdC-Lab1/src/regfile.sv}
vlog -sv -work work +incdir+/home/guchimo/Documentos/TP1/AdC-Lab1/src {/home/guchimo/Documentos/TP1/AdC-Lab1/src/processor_arm.sv}
vlog -sv -work work +incdir+/home/guchimo/Documentos/TP1/AdC-Lab1/src {/home/guchimo/Documentos/TP1/AdC-Lab1/src/mux2.sv}
vlog -sv -work work +incdir+/home/guchimo/Documentos/TP1/AdC-Lab1/src {/home/guchimo/Documentos/TP1/AdC-Lab1/src/memory.sv}
vlog -sv -work work +incdir+/home/guchimo/Documentos/TP1/AdC-Lab1/src {/home/guchimo/Documentos/TP1/AdC-Lab1/src/maindec.sv}
vlog -sv -work work +incdir+/home/guchimo/Documentos/TP1/AdC-Lab1/src {/home/guchimo/Documentos/TP1/AdC-Lab1/src/imem.sv}
vlog -sv -work work +incdir+/home/guchimo/Documentos/TP1/AdC-Lab1/src {/home/guchimo/Documentos/TP1/AdC-Lab1/src/flopr.sv}
vlog -sv -work work +incdir+/home/guchimo/Documentos/TP1/AdC-Lab1/src {/home/guchimo/Documentos/TP1/AdC-Lab1/src/fetch.sv}
vlog -sv -work work +incdir+/home/guchimo/Documentos/TP1/AdC-Lab1/src {/home/guchimo/Documentos/TP1/AdC-Lab1/src/execute.sv}
vlog -sv -work work +incdir+/home/guchimo/Documentos/TP1/AdC-Lab1/src {/home/guchimo/Documentos/TP1/AdC-Lab1/src/decode.sv}
vlog -sv -work work +incdir+/home/guchimo/Documentos/TP1/AdC-Lab1/src {/home/guchimo/Documentos/TP1/AdC-Lab1/src/datapath.sv}
vlog -sv -work work +incdir+/home/guchimo/Documentos/TP1/AdC-Lab1/src {/home/guchimo/Documentos/TP1/AdC-Lab1/src/controller.sv}
vlog -sv -work work +incdir+/home/guchimo/Documentos/TP1/AdC-Lab1/src {/home/guchimo/Documentos/TP1/AdC-Lab1/src/aludec.sv}
vlog -sv -work work +incdir+/home/guchimo/Documentos/TP1/AdC-Lab1/src {/home/guchimo/Documentos/TP1/AdC-Lab1/src/alu.sv}
vlog -sv -work work +incdir+/home/guchimo/Documentos/TP1/AdC-Lab1/src {/home/guchimo/Documentos/TP1/AdC-Lab1/src/adder.sv}
vcom -93 -work work {/home/guchimo/Documentos/TP1/AdC-Lab1/src/dmem.vhd}

vlog -sv -work work +incdir+/home/guchimo/Documentos/TP1/AdC-Lab1/src {/home/guchimo/Documentos/TP1/AdC-Lab1/src/processor_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  processor_tb

add wave *
view structure
view signals
run -all
