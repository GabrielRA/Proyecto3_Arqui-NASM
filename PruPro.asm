%include "io.mac"

.DATA
	MAX_SIZE 	EQU 	100
	mensagge1 	dw	'Ingrese el largo de la cadena 1: '
	mensagge2	dw	'Ingrese el largo de la cadena 2: '
	mensagge3	dw	'Los valores deben ser unicamente en mayuscula'
	mensagge4	dw 	'Ingrese un valor '
	msgDone		dw	'All is done'
	msgError		dw	'Error'

.UDATA
	Cadena1 	resb 	MAX_SIZE
	Cadena2 	resb 	MAX_SIZE
	temp	resb		1

.CODE
	.STARTUP
	PutStr mensagge1
	nwln
	GetInt CX
	Sub ESI,ESI
Msg1_Loop:
	PutStr mensagge4
	nwln
	GetCh AL
	mov [Cadena1+ESI], AL
	inc ESI
	nwln
	loop Msg1_Loop
	PutStr mensagge2
	nwln
	GetInt CX
	Sub ESI,ESI
Msg2_Loop:
	PutStr mensagge4
	nwln
	GetCh AL
	mov [Cadena1+ESI], AL
	inc ESI
	nwln
	loop Msg2_Loop
	sub EAX, EAX
	sub EDX, EDX
	RDTSC
	PutInt AX
	nwln
	mov DX,0
	mov Bl, 4;44
	PutInt BX
	IDiv Bl
	;PutInt AX
	.EXIT
	