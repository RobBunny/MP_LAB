extern	printf		
extern	scanf		

SECTION .data		

a:	dq	0	
r:  	dq  	0

enter:	db "Enter a number: ",0
prime: db "Prime number", 10,0
not_prime: db "Not prime number", 10,0	
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
	
	mov rax, [a]
	cmp rax, 0
	je notprime
	cmp rax, 1
	je notprime
	cmp rax, 2
	je primey 
	
	mov r8, rax
	mov rcx, 2
	loop:
	
	mov r9, rcx
	imul r9, rcx
	cmp r9, [a]
	jg primey
	 
	cqo
	idiv rcx
	cmp rdx, 0
	je notprime
	
	mov rax, r8
	inc rcx
	jmp loop
		
	notprime:
	mov rdi, out_fmt_2		
	mov rsi, not_prime                 
	mov rax, 0		
        call printf
        
        pop rbp
        
        mov rax, 0
        ret
        
        primey:		
	mov rdi, out_fmt_2		
	mov rsi, prime                 
	mov rax, 0		
        call printf
        
	pop rbp		

	mov rax, 0		
	ret
