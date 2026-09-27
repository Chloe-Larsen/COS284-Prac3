section .text
global total_pages

total_pages:
    xor eax, eax
    test rsi, rsi
    jle .done
    mov rcx, rsi
.loop
    movsxd r8, dword [rdi + 16]
    add rax, r8
    add rdi, 24
    dec rcx
    jnz .loop
.done
    ret