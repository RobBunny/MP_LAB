extern	printf		
extern	scanf		

SECTION .data		

a:	dq	0
b:	dq	0	
c:	dq	0
r:  	dq  	0

enter:	db "Enter a number: ",0
out_fmt:	db "Sum of numbers from 1 to %ld is %ld", 10, 0	
out_fmt_2:	db "%s",10,0
in_fmt:		db "%d",0
SECTION .text

global main		
main:				
        push    rbp	
        
        mov rax,0
        mov rdi,out_fmt_2
        mov rsi,enter
        call printf
        
        mov rax, 0
	mov rdi, in_fmt
	mov rsi, a
	call scanf	
	
	mov rax, [a]
	add rax, 1
	mov rbx, [a]
        imul rax, rbx
        mov rbx, 2
        idiv rbx
	mov [r], rax
		
	mov rdi, out_fmt		
	mov rsi, [a]         
	mov rdx, [r]                 
	mov rax, 0		
        call printf		

	pop rbp		

	mov rax, 0		
	ret			
