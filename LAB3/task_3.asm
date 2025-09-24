extern    printf        
extern    scanf        

SECTION .data        
n:          dq 0                ; The input number
out_fmt:    db "%ld", 10, 0    ; Format to print a number + newline
in_fmt:     db "%ld", 0        ; Format to read a number

SECTION .text
global main        

main:
    push    rbp
    mov     rbp, rsp

    ; Read input number n
    mov     rdi, in_fmt
    mov     rsi, n
    xor     rax, rax        ; Clear rax for variadic call
    call    scanf

    mov     rax, [n]        ; Load n
    mov     rsi, 1          ; Counter i = 1

divisor_loop:
    cmp     rsi, rax        ; if i > n, exit loop
    ja      end_loop

    mov     rdx, 0          ; Clear rdx for div (since rdx:rax)
    mov     r8, rsi         ; divisor i
    mov     rax, [n]        ; dividend n
    div     r8              ; rax = n / i, rdx = n % i

    cmp     rdx, 0
    jne     skip_print

    mov     rdi, out_fmt
    mov     rsi, rsi        ; i (loop counter)
    xor     rax, rax        ; clear rax for variadic call
    call    printf

skip_print:
    inc     rsi
    jmp     divisor_loop

end_loop:
    mov     rax, 0
    pop     rbp
    ret
