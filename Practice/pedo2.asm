;Sample Problem and Solution

;Problem: Times Table

Solution:

extern    printf        
extern    scanf        

SECTION .data        
cnt:    dq    0    
c:    dq    0
sum:    dq    0
out_fmt:    db "%ld", 10, 0    
in_fmt:        db "%ld",0

SECTION .bss
arr: resq 11

SECTION .text
global main        
main:                
    push    rbp                    
   
    mov rdi,in_fmt
    mov rsi,c
    call scanf        ;scan a int
    mov r8, 1
    
loop:
    mov rax,[c]
    imul rax, r8
    add r8, 1 
   
    mov rcx,[cnt]
    mov [arr+8*rcx],rax    ;save to arr
   
    add rcx,1
    mov [cnt],rcx        ;increment counter
   
    cmp rcx,10
    jnz loop
   
    mov rax,0
    mov [cnt],rax
   
    ;mov rdi,out_fmt        ;print sum
    ;mov rsi,[sum]
    ;mov rax,0
    ;    call printf

print:                ;print arr
    mov rcx,[cnt]
    mov rcx,[arr+8*rcx]
   
    mov rdi,out_fmt
    mov rsi,rcx
   
    mov rax,0
       call printf
   
    mov rcx,[cnt]
    add rcx,1
    mov [cnt],rcx
   
    cmp rcx,10
    jnz print

   
    pop    rbp        

    mov    rax,0        
    ret
