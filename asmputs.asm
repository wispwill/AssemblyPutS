;Laura Josuweit
;asm version of puts
;2016-12-4
;
; expects:
;       RDI: address of ASCIIZ string
; returns:
;       nothing
;uses:
;rax for syscalls
;rdi for syscall (stdout)
;rsi address of char being printed
;rdx just to hold 1 for string length

global asmputs

section .data
	NL db 0x0a;newline to put at the end of puts function

section .text
asmputs:
.start:
	push rbp
	mov rbp, rsp; stack frame
	
	mov rsi, rdi;put string in rsi for printing
	cmp BYTE [rsi], 0x00;check for null
	je .done;if null, jump to finish
.prtchar:	
	mov rax, 1;printing
	mov rdi, 1;to stdout
	;rsi already has the char address
	mov rdx, 1; printing one character
	syscall;print one character
	
	inc rsi;move to the next character
	
	cmp BYTE [rsi], 0x00;check for null
	je .done;if null, jump to finish
	jmp .prtchar
.done:
	mov rax, 1;printing
	mov rdi, 1;to stdout
	mov rsi, NL;putting a newline
	mov rdx, 1; printing one character
	syscall;print one character
	
	mov rax, 0;successful
	leave
	ret
