section .text
global best_book

best_book:
    mov rax, rdi
    movsd xmm0, [rdi + 8]
    mov rcx, 1
    cmp rcx, rsi
    jge .done
.loop
    mov r8, rcx
    imul r8, 24
    lea rdx, [rdi + r8]
    movsd xmm1, [rdx + 8]
    comisd xmm1, xmm0
    jbe .next
    movsd xmm0, xmm1
    mov rax, rdx
.next:
    inc rcx
    cmp rcx, rsi
    jl .loop
.done
    ret