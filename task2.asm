extern	printf		; Scan three variables a, b,and c. Print the value of 2a + 3b + c
extern	scanf		

SECTION .data		

a:	dq	0
b:	dq	0	
c:	dq	0
r:	dq	0

enter:	db "Enter three numbers: ",0
out_fmt:	db "%ld", 10, 0	
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
	
	
        mov rax, 0
	mov rdi, in_fmt
	mov rsi, b
	call scanf

        mov rax, 0
	mov rdi, in_fmt
	mov rsi, c
	call scanf	
	
	mov	rax,[a]
    imul rax, rax, 2
	mov	rbx,[b]
    imul rbx, rbx, 3		
	add	rax,rbx
    mov rbx, 0
    mov rbx,[c]
    add rax,rbx
	mov	[r],rax		
	mov	rdi,out_fmt		
	mov	rsi,[r]                  
	mov	rax,0		
        call    printf		

	pop	rbp		

	mov	rax,0		
	ret			