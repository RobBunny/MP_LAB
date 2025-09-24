;Task 3:
;Scan a variable n. Print all divisors of n.

extern printf
extern scanf

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
    push rbp
    mov rbp, rsp

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
    mov rax, [a]
    cmp rbx, rax
    jg end

    xor rdx, rdx
    div rbx
    cmp rdx, 0
    je divisor
    inc rbx
    jmp loop_start

divisor:
    mov	[b],rbx	
    mov	rdi,out_fmt		
    mov	rsi,[b]                  
    mov	rax,0
    call printf
    inc rbx
    jmp loop_start

end:
    pop rbp
    mov rax, 0
    ret

section .note.GNU-stack noalloc noexec nowrite progbits
