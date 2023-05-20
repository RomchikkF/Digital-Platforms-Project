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
	do 		# Begin the keyboard read loop
		ld r0,r1 	# Load r1 from data memory, which includes
				 	# the I/O address space
	tst r1
	until ne 	# Drop out of the loop when r1 is not zero
	
	st r0, r2 #store 0 in field "ready"
	inc r0
	st r0, r2 #store 0 in collision
	ld r0, r1	#load ball x
	inc r0
	ld r0, r2	#load wall x
	if 
		cmp r2, r1
	is le
	then
		inc r0	#load wall size
		ld r0, r3
		add r3, r2
		if 
			cmp r1, r2
		is ls
		then
			inc r0 		#load ball y
			ld r0, r1
			inc r0 
			ld r0, r2   #load wall y
			if 
				cmp r1, r2 
			is eq
			then
				ldi r1, 1
				br finish
			fi		
			inc r0
			ld r0, r3 #load ball vy
			add r2, r3
			if
				cmp r1, r2 
			is ls
			then
				if 
					cmp r1, r3
				is ge
				then
					ldi r1, 1
				else
					ldi r1, 0
				fi
				br finish
			else
				if 
					cmp r1, r3
				is le
				then
					ldi r1, 1
				else
					ldi r1, 0
				fi
				br finish
			fi
		fi
	fi
	ldi r1, 0
finish:
	ldi r0, IOReg
	inc r0
	st r0, r1 # store collision
	dec r0
	ldi r1, 1
	st r0, r1 #store 1 in ready
	br read 		# Go back to the start of the read loop
end	