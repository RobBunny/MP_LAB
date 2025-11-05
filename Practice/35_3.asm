;Write a NASM program that reads a string, reverses it using a function reverse_str, and prints the reversed string.

extern printf
extern scanf

SECTION .data        
int_in_fmt: db "%ld",0
int_out_fmt: db "%ld",10,0
int: dq 0
out_str_fmt: db "%s",10,0
in_str_fmt:     db "%s",0

SECTION .bss
str: resb 100
arr: resq 100
s: resb 100

SECTION .text
    
global main
main:

    push rbp
    call scan_str
    mov rsi,str
    mov rdi,s
    call str_copy
    mov rsi,s
    call reverse_str
    mov rax, 0
    pop rbp
    ret
    
scan_str:
    push rdx
    push rcx
    push rax
    push rdi
    push rsi
    mov rax, 0
    mov rdi, in_str_fmt
    mov rsi, str
    call scanf
    pop rsi
    pop rdi
    pop rax
    pop rcx
    pop rdx
    ret

str_len:
    push rax
    push rsi
    mov rcx,0
    lop_str_len:
        mov al,[rsi]
        cmp al,0
        je dne_str_len
        add rsi,1
        add rcx,1
        jmp lop_str_len
    dne_str_len:
    pop rsi
    pop rax
    ret

str_copy:
    push rcx
    push rsi
    push rdi
    push rax
    call str_len
    lop_str_copy:
        cmp rcx,0
        jl dne_str_copy
        mov al,[rsi]
        mov [rdi],al
        add rsi,1
        add rdi,1
        sub rcx,1
        jmp lop_str_copy
   
    dne_str_copy:
    pop rax
    pop rdi
    pop rsi
    pop rcx
    ret

print_str:
    push rdx
    push rcx
    push rax
    push rdi
    push rsi
    mov rdi,out_str_fmt                
    mov rax,0        
    call printf
    pop rsi
    pop rdi
    pop rax
    pop rcx
    pop rdx    
    ret

reverse_str:
    mov rdx, 0
    call str_len
    dec rcx
lop:
    cmp rdx, rcx
    jge fin

    add rsi, rcx
    mov al, [rsi]
    sub rsi, rcx

    add rsi, rdx
    mov ah, [rsi]
    sub rsi, rdx

    add rsi, rcx
    mov [rsi], ah
    sub rsi, rcx

    add rsi, rdx
    mov [rsi], al
    sub rsi, rdx

    inc rdx
    dec rcx
    jmp lop
fin:
    mov rsi, s
    call print_str
    ret
