ARMGNU ?= aarch64-linux-gnu

AOPS = --warn --fatal-warnings

SRC = main

all : $(SRC).list

clean :
	rm -f $(SRC).o
	rm -f $(SRC).list
	rm -f $(SRC).elf

$(SRC).o : $(SRC).s
	$(ARMGNU)-as $(AOPS) $(SRC).s -o $(SRC).o


$(SRC).list: memmap $(SRC).o
	$(ARMGNU)-ld $(SRC).o -T memmap -o $(SRC).elf
	$(ARMGNU)-objdump -Dz $(SRC).elf > $(SRC).list

