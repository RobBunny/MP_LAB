extern	printf       ; Scan a variable x. Print the value of the sum of the numbers from 1 to x. You may assume x is a positive integer.x
extern	scanf		

SECTION .data		

a:	dq	0
b:	dq	0	

enter:	db "Enter number: ",0
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
	
	mov	rax,[a]
    mov rbx, rax
	add rax, 1		
	imul rax,rbx
    mov rbx,2
    xor rdx,rdx
    idiv rbx
	mov	[b],rax		
	mov	rdi,out_fmt		
	mov	rsi,[b]                  
	mov	rax,0		
        call    printf		

	pop	rbp		

	mov	rax,0		
	ret	