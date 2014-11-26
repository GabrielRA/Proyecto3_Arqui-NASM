;Programa para Generar número Random
;Modificado: Gabriel Ramírez
;Ingeniería en Computación.
;ITCR
%include "io.mac"

.DATA
	MAX_SIZE 	EQU 	100
	mensagge1 	dw	'Ingrese el largo de la cadena 1: '
	mensagge2	dw	'Ingrese el largo de la cadena 2: '

.UDATA
	Cadena1 	resb 	MAX_SIZE
	Cadena2 	resb 	MAX_SIZE

.CODE
random:
	xor eax, eax
	rdtsc			;Obtiene la hora. [EDX : EAX].	
	mov bx, 0003h 		
	and ax, bx
	ret


	
	.STARTUP
	PutStr mensagge1
	nwln
	GetInt CX
	Sub ESI,ESI
	
Msg1_Loop:
	Call random
	cmp ax, 0
	jz insertaA
	cmp ax, 1
	jz insertaC
	cmp ax, 2
	jz insertaG
	cmp ax, 3
	jz insertaT
	mov [Cadena1+ESI], ax
	inc ESI
	nwln
	loop Msg1_Loop
	
	PutStr mensagge2
	nwln
	GetInt CX
	Sub ESI,ESI

Msg2_Loop:
	Call random
	mov [Cadena1+ESI], AL
	inc ESI
	nwln
	loop Msg2_Loop
	
	
insertaA:
	xor eax, eax
	mov al, 41h 	;Para poner una A.
	ret
insertaC:
	xor eax, eax
	mov al, 43h		;Para poner una C.
	ret
insertaT:
	xor eax, eax
	mov al, 54h		;Para poner una T.
	ret
insertaG:
	xor eax, eax
	mov al, 47h		;Para poner una G.
	ret
	
	
	.EXIT
	

	
