;Task 2:
;Scan a variable x. Print if it is prime or not.

extern	printf		
extern	scanf		

SECTION .data		

a:	dq	0
b:	dq	0	

enter:	db "Enter a number: ",0
enter_2: db "Not Prime",0
enter_3: db "Prime",0
out_fmt:	db "%s", 10, 0	
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
	
	mov	rbx,[a]
    cmp rbx, 2
    jl finish_2
    cmp rbx, 2
    je finish
    mov rax, rbx
    sub rbx, 1
    mov rcx, 2
loop_start:

    cmp rcx, rbx 
    je finish
    xor rdx,rdx
    div rcx
	cmp rdx, 0
    je finish_2
    inc rcx
    jmp loop_start

finish_2:		
	mov	rdi,out_fmt		
	mov	rsi,enter_2              
	mov	rax,0		
        call    printf
    jmp end

finish:
	mov	[b],rax		
	mov	rdi,out_fmt		
	mov	rsi,enter_3                  
	mov	rax,0		
        call    printf		

end:
	pop	rbp		

	mov	rax,0		
	ret				