;Task 2:
;Scan a variable n. Print the multiplication table of n (from 1 to 10).

extern	printf		
extern	scanf		

SECTION .data		

a:	dd	0
b:	dd	0	

enter:	db "Enter a number: ",0
enter_2: db "Not Prime",0
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

        mov rbx, 1
    loop_start:

        mov rax,[a]
        imul rax, rbx 		
	    mov	[b],rax	
	    mov	rdi,out_fmt		
        mov	rsi,[b]                  
	    mov	rax,0
        call    printf

        inc rbx
        cmp rbx,11
        jne loop_start
        jmp end	

    end:
	    pop	rbp		

	    mov	rax,0		
	    ret				
    
;rcx keno use hoy na bujhtesina
