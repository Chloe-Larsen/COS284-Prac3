section .text
global weighted_rating

weighted_rating:
    pxor xmm0, xmm0
    pxor xmm1, xmm1
    test rsi, rsi
    jle .done
    mov rcx, rsi
.loop
    movsd xmm2, [rdi + 8]
    movsxd r8, dword [rdi + 16]
    cvtsi2sd xmm3, r8
    mulsd xmm2, xmm3
    addsd xmm0, xmm2
    addsd xmm1, xmm3
    add rdi, 24
    dec rcx
    jnz .loop
    divsd xmm0, xmm1
.done
    ret