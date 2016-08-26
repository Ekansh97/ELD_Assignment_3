AVR = avr-gcc
G = -g
J = -j
BR = 57600
C = -c
O = -o
avro = avr-objcopy
avrd = avrdude
ATM = "-mmcu=atmega328p"

complete : compile code clean
code : blinkLED.hex
	sudo $(avrd) -p atmega328p -b $(BR) -P "/dev/tty.usbserial-AE01EEVS" $(C) arduino -U flash:w:blinkLED.hex -F
compile : blinkLED.c
	$(AVR) $(G) -Os $(ATM) $(C) blinkLED.c
	$(AVR) $(G) $(ATM) $(O) blinkLED.elf blinkLED.o
	$(avro) $(J) .text $(J) .data -O ihex blinkLED.elf blinkLED.hex
clean :
	rm -rf *.elf *.o	
