extern	printf		
extern	scanf		

SECTION .data		

a:	dq	0
b:	dq	0	
r:  	dq  	0

enter:	db "Enter two numbers: ",0
out_fmt:	db "GCD of %ld and %ld is %ld", 10, 0	
out_fmt_2:	db "%s",10,0
in_fmt:		db "%d",0
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
	
	call gcd_baby
		
	mov rdi, out_fmt		
	mov rsi, [a]         
	mov rdx, [b]
	mov rcx, [r]                 
	mov rax, 0		
        call printf		

	pop rbp		

	mov rax, 0		
	ret 					

gcd_baby:
	mov rax, [a]
	mov rbx, [b]
	loop:
	cmp rbx, 0
	je en
	mov r8, rbx
	cqo
        idiv rbx
	mov rax, r8
	mov rbx, rdx
	jmp loop
	en:
	mov [r], rax
	ret
