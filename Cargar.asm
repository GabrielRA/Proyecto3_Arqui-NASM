;Programa para Cargar un Archivo.
;Autor: Gabriel Ramírez
;ITCR
;Ingeniería en Computación.
%include "io.mac"
	
.DATA
MensajeConfirmacion 	dw	'Archivo Leído. '

.UDATA
BUFFLEN equ 4176      ; Tiene el largo del buffer maximo
Buffer: resb BUFFLEN  ; Guarda los caracteres ingresados

LINELEN equ 80            ; Tiene el largo maximo de las lineas

Expresion : resb LINELEN  ; Guarda la expresion
Linea: resb LINELEN     ; Guarda una hilera

.CODE

Cargar:
	push eax
	push ebx
	push ecx
	push edx
	
	mov eax, 3        ; llamada al sistema funcion de lectura
	mov ebx, 0        ;  File Descriptor: entrada estandar
	mov ecx, Buffer   ; ecx apunta a la direccion de Buffer
	mov edx,BUFFLEN   ; tiene el largo de Buffer
	int 80h           ; llamada al kernel sys_read
	
	mov ebp, eax	  ;Guarda el largo de lo leido en ebp
	
	pop edx
	pop ecx
	pop ebx
	pop eax	
	ret
	
        .STARTUP
inicio:
	nop
;--------------------------------------------------------------------------------------------------------------
;Leer el archivo	
;--------------------------------------------------------------------------------------------------------------
Leer:
	call Cargar      ;Llama a el procedimiento que carga los datos del archivo
	cmp ebp, 0       ; Compara si EOF
	PutStr MensajeConfirmacion
	je done
		
done:                        ; otherwise, terminate program
        .EXIT
