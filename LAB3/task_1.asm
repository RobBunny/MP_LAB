;Task 1:
;Scan a variable n. Print the reverse of the number.(Example: 123 → 321)

extern	printf		
extern	scanf		

SECTION .data		

a:	dq	0	
b:  dq  0

enter:	db "Enter a number: ",0
out_fmt:	db "%d", 10, 0
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
	
	mov rax,[a]
        mov rbx,0
    loop_start:

        xor rdx,rdx
        mov rcx,10
        div rcx
        imul rbx, 10
        add rbx, rdx
	cmp rax, 0
        je finish
        jmp loop_start

    finish:
	mov [b],rbx	
	mov rdi,out_fmt		
	mov rsi,[b]                  
	mov rax,0		
        call printf
        jmp end		

    end:
	    pop	rbp		

	    mov	rax,0		
	    ret				
