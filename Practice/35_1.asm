;Write a NASM program that takes two integers as input, passes them to a function sum, and prints their sum.

extern printf
extern scanf

SECTION .data
a: dq 0
b: dq 0
r: dq 0

enter: db "Enter two numbers: ", 0
out_fmt: db "Sum: %ld", 10, 0
out_fmt_2: db "%s", 10, 0
in_fmt: db "%ld", 0
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
    
    call summation

    mov rax, 0
    pop rbp
    ret

summation:
    mov rax, [a]
    add rax, [b]
    mov [r], rax
    mov rdi, out_fmt
    mov rsi, [r]
    mov rax, 0
    call printf
    
    mov rax, 0
    ret

