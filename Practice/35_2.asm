;Write a NASM program that reads two integers, calls a function max_of_two, and prints the larger number.

extern printf
extern scanf

SECTION .data
a: dq 0
b: dq 0
r: dq 0

enter: db "Enter two numbers: ", 0
out_fmt: db "Max: %ld", 10, 0
out_fmt_2: db "%s", 10, 0
in_fmt: db "%d", 0
SECTION .text

global main
main:
    push rbp

    mov rax, 0
    mov rdi, out_fmt_2
    mov rsi, enter
    call printf

    mov rax, 0
    mov rdi, in_fmt
    mov rsi, a
    call scanf

    mov rax, 0
    mov rdi, in_fmt
    mov rsi, b
    call scanf
    
    call max_of_two

    mov rax, 0
    pop rbp
    ret

max_of_two:
    mov rax, [a]
    mov rbx, [b]
    cmp rax, rbx
    jg more_a_b
    mov rax, rbx

more_a_b:
    mov [r], rax
    mov rdi, out_fmt
    mov rsi, [r]
    mov rax, 0
    call printf

    mov rax, 0
    ret

