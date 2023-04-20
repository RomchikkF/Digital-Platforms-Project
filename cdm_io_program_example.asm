	asect 0xf1
IOReg: # Gives the address 0xf3 the symbolic name IOReg
	asect 0xf0
stack: # Gives the address 0xf0 the symbolic name stack
	asect 0x00
start:
	ldi r0,stack
	stsp r0 	# Sets the initial value of SP to 0xf0
	ldi r0, IOReg 	# Load the address of the keyboard and display in r0
readkbd:
	do 		# Begin the keyboard read loop
		ld r0,r1 	# Load r1 from data memory, which includes
				 	# the I/O address space
				 	# Now bits 0..6 of r1 encode the last char typed,
					# and bit 7 indicates the keyboard status
	tst r1 		# The N flag is taken from bit 7 of the register
	until pl 	# Drop out of the loop when the N flag is 0
			# and now r1 contains the ASCII code of the last char
	st r0,r1 		# Display the hex of the ASCII code
	
	br readkbd 		# Go back to the start of the keyboard read loop
end	