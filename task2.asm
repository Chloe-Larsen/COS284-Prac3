section .text
global average_rating

average_rating:
    pxor xmm0, xmm0 ; sum = 0
    test rsi, rsi 
    jle .done   ; n is not valid
    mov rcx, rsi ; rcx = counter = n
.loop
    addsd xmm0, [rdi + 8]    ; sum += books.rating
    add rdi, 24 ; books++
    dec rcx
    jnz .loop ; while counter != 0
    cvtsi2sd xmm1, rsi ; xmm1 <- double n
    divsd xmm0, xmm1 ; sum/xmm1
.done
    ret ; go back to main