extern	printf		
extern	scanf		

SECTION .data		

a:	dq	0
b:	dq	0
c:	dq	0	
r:  	dq  	0

enter:	db "Enter three numbers: ",0
out_fmt:	db "Maximum: %ld", 10, 0	
out_fmt_2:	db "%s",10,0
in_fmt:		db "%ld",0
SECTION .text

global main		
main:				
        push rbp	
        
        mov rax,0
        mov rdi,out_fmt_2
        mov rsi,enter
        call printf
        
        mov rax, 0
	mov rdi, in_fmt
	mov rsi, a
	call scanf
	
        mov rax, 0
	mov rdi, in_fmt
	mov rsi, b
	call scanf

	mov rax, 0
	mov rdi, in_fmt
	mov rsi, c
	call scanf

	mov rax, [a]
	mov rbx, [b]
	cmp rax, rbx
	jg more_a_b
	mov rax, rbx
	
	more_a_b:
	mov rbx, [c]
	cmp rax, rbx
	jg more_a_c
	mov rax, rbx
	
	more_a_c:
	mov [r], rax	
	mov rdi, out_fmt		
	mov rsi, [r]                          
	mov rax, 0		
        call printf		

	pop rbp		

	mov rax, 0		
	ret 					
