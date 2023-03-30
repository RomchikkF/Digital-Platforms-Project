asect  0x00

    ldi r0, ball
	ld r0, r1
	if 
		ldi r0, obj
		ld r0, r2
		cmp r2, r1
	is le
		if 
			inc r0
			inc r0
			ld r0, r0
			add r0, r2
			cmp r0, r1
		is ge
			if 
				ldi r0, ball
				inc r0
				ld r0, r1
				ldi r0, obj
				inc r0
				ld r0, r2
				if 
					cmp r1, r2
				is le
					ldi r3, -1
				else
					ldi r3, 1
				fi
				ldi r0, velocity
				inc r0
				ld r0, r0
				add r0, r1
				if 
					cmp r1, r2
				is le
					ldi r2, -1
				else
					ldi r2, 1
				fi
				cmp r2, r3
			is eq
				ldi r3, 1
			else
				ldi r3, 0
			fi
		fi
	fi
# =================================
    ldi r0, c    # Loads the address of your result into r0 for the robot
    st r0, r3
	halt         # Brings execution to a halt

# =================================

INPUTS>
ball:
	dc 5, 10
velocity:
	dc 1, 10
obj: 
	dc 3, 15, 10
ENDINPUTS>

c:
  ds 1
end

