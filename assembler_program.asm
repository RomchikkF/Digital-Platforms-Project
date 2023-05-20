	asect 0xf1
IOReg: # Gives the address 0xf1 the symbolic name IOReg
	asect 0xf0
stack: # Gives the address 0xf0 the symbolic name stack
	asect 0x00
start:
	ldi r0,stack
	stsp r0 	# Sets the initial value of SP to 0xf0
read:
	ldi r0, IOReg 	# Load the address of the input and display in r0
	clr r1	#clear registers
	clr r2
	clr r3
	do 		# Begin the keyboard read loop
		ld r0,r1 	# Load r1 from data memory, which includes
				 	# the I/O address space
	tst r1
	until ne 	# Drop out of the loop when r1 is not zero
	st r0, r2 #set ready to 0
	inc r0
	ld r0, r1 # type
	inc r0
	ld r0, r2 # x
	inc r0
	ld r0, r3 # y
	inc r0
	if 
		tst r1
	is eq
	then
		ld r0, r1 # size
		dec r0
		dec r0
		dec r0
		while 
			tst r1
		stays ne # type = 0
			st r0, r2
			inc r0
			st r0, r3
			inc r0
			st r0, r1
			inc r2
			dec r1
			dec r0
			dec r0
		wend
		
		dec r0
		ldi r1, 1
		st r0, r1 #set ready to 1
		br read 		# Go back to the start of the read loop
	fi
	dec r1
	if
		tst r1
	is eq
	then
		ld r0, r1 # size
		dec r0
		dec r0
		dec r0
		while 
			tst r1
		stays ne # type = 3
			st r0, r2
			inc r0
			st r0, r3
			inc r0
			st r0, r1
			inc r3
			dec r1
			dec r0
			dec r0
		wend
		
		dec r0
		ldi r1, 1
		st r0, r1 #set ready to 1
		br read 		# Go back to the start of the read loop
	fi
	dec r1
	if
		tst r1
	is eq
	then
		ld r0, r1 # size
		dec r0
		dec r0
		dec r0
		while 
			tst r1
		stays ne # type = 3
			st r0, r2
			inc r0
			st r0, r3
			inc r0
			st r0, r1
			inc r2
			inc r3
			dec r1
			dec r0
			dec r0
		wend
		
		dec r0
		ldi r1, 1
		st r0, r1 #set ready to 1
		br read 		# Go back to the start of the read loop
	fi
	dec r1
	if
		tst r1
	is eq
	then
		ld r0, r1 # size
		dec r0
		dec r0
		dec r0
		while 
			tst r1
		stays ne # type = 3
			st r0, r2
			inc r0
			st r0, r3
			inc r0
			st r0, r1
			inc r2
			dec r3
			dec r1
			dec r0
			dec r0
		wend
		
		dec r0
		ldi r1, 1
		st r0, r1 #set ready to 1
		br read 		# Go back to the start of the read loop
	fi
end	