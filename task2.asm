section .text
global average_rating

average_rating:
    pxor xmm0, xmm0
    test rsi, rsi
    jle .done
    mov rcx, rsi
.loop
    addsd xmm0, [rdi + 8]    
    add rdi, 24
    dec rcx
    jnz .loop
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
.done
    ret