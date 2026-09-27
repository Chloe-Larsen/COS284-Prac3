section .text
global count_above

count_above:
    xor eax, eax ; count = 0
    test rsi, rsi
    jle .done ; n is not valid
    mov rcx, rsi ; rcx = counter = n
.loop
    movsd xmm1, [rdi + 8] ; books[i].rating
    comisd xmm1, xmm0 ; cmp rating vs threshold
    jbe .skip ; if less skip 
    inc rax ; count as above
.skip
    add rdi, 24 ; books++
    dec rcx ; counter --
    jnz .loop ; while counter != 0
.done
    ret ; go back to main