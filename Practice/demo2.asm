extern	printf		
extern	scanf		

SECTION .data		

a:	dq	0
b:	dq	0	
c:	dq	0
r:  dq  0

enter:	db "Enter three numbers: ",0
out_fmt:	db "2*%ld + 3*%ld + %ld = %ld", 10, 0	
out_fmt_2:	db "%s",10,0
in_fmt:		db "%ld",0
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
	
        mov rax, 0
	mov rdi, in_fmt
	mov rsi, b
	call scanf

        mov rax, 0
	mov rdi, in_fmt
	mov rsi, c
	call scanf	
	
	mov rax, [a]
        imul rax, 2
	mov rbx, rax
        mov rax, [b]
        imul rax, 3 		
	add rax, rbx
        add rax, [c]
	mov [r], rax		
	mov rdi, out_fmt		
	mov rsi, [a]         
	mov rdx, [b]        
	mov rcx, [c]
        mov r8, [r]         
	mov rax, 0		
        call printf		

	pop rbp		

	mov rax, 0		
	    ret			
