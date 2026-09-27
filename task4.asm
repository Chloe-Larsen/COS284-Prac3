section .text
global best_book

best_book:
    mov rax, rdi ; best = books[0]
    movsd xmm0, [rdi + 8] ; best rating = books[0].rating
    mov rcx, 1 ; i = 1
    cmp rcx, rsi 
    jge .done ; if n <= 1, end
.loop
    mov r8, rcx 
    imul r8, 24 
    lea rdx, [rdi + r8] ; books[i]
    movsd xmm1, [rdx + 8] ; books[i].rating
    comisd xmm1, xmm0 ; cmp books[i].rating and best.rating
    jbe .next ;skip
    movsd xmm0, xmm1 ; best_rating = books[i].rating
    mov rax, rdx ; best = books[i]
.next:
    inc rcx ; i++
    cmp rcx, rsi ; i < n
    jl .loop
.done
    ret ; go back to main