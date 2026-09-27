section .text
global count_above

count_above:
    xor eax, eax
    test rsi, rsi
    jle .done
    mov rcx, rsi
.loop
    movsd xmm1, [rdi + 8]
    comisd xmm1, xmm0
    jbe .skip
    inc rax
.skip
    add rdi, 24
    dec rcx
    jnz .loop
.done
    ret