section .text
global weighted_rating

weighted_rating:
    pxor xmm0, xmm0 ; numerator
    pxor xmm1, xmm1 ; denominator
    test rsi, rsi
    jle .done
    mov rcx, rsi ; rcx = counter = n
.loop
    movsd xmm2, [rdi + 8] ; books[i].rating
    movsxd r8, dword [rdi + 16] ; books[i].pages
    cvtsi2sd xmm3, r8 ; pages as a double
    mulsd xmm2, xmm3 ; rating * pages
    addsd xmm0, xmm2 ; n += rating * pages
    addsd xmm1, xmm3 ; d += pages
    add rdi, 24 ; books++
    dec rcx ; counter --
    jnz .loop
    divsd xmm0, xmm1 ; result = numerator / denominator
.done
    ret ; go back to main