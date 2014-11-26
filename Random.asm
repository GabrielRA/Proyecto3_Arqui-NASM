;Binary equivalent of characters   BINCHAR.ASM
;
;        Objective: To print the binary equivalent of
;                   ASCII character code.
;            Input: Requests a character from keyboard.
;           Output: Prints the ASCII code of the
;                   input character in binary.
%include "io.mac"
	
.DATA

.CODE
        .STARTUP
inicio:
		;[EDX: EAX]
		  
		xor eax, eax
		rdtsc
		
		mov cx, 0003h 		
		and ax, cx
		
		;Llamada a la macro.
		PutInt ax
		nwln
        
done:                        ; otherwise, terminate program
        .EXIT
