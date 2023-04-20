	asect 0xf1
IOReg: # Gives the address 0xf3 the symbolic name IOReg
	asect 0xf0
stack: # Gives the address 0xf0 the symbolic name stack
	asect 0x00
start:
	ldi r0,stack
	stsp r0 	# Sets the initial value of SP to 0xf0
	ldi r0, IOReg 	# Load the address of the keyboard and display in r0
read:
	do 		# Begin the keyboard read loop
		ld r0,r1 	# Load r1 from data memory, which includes
				 	# the I/O address space
	tst r1
	until ne 	# Drop out of the loop when r1 not zero
	inc r0
	ld r0, r2
	inc r0
	ld r0, r3
	add r2, r3
	
	ldi r0, IOReg
	st r0, r1
	inc r0
	st r0, r3
	dec r0
	br read 		# Go back to the start of the keyboard read loop
end	