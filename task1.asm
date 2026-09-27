section .text
global total_pages

total_pages:
    xor eax, eax ; sum = 0
    test rsi, rsi
    jle .done
    mov rcx, rsi ; rcx = counter = n
.loop
    movsxd r8, dword [rdi + 16] ; books[i] pages
    add rax, r8 ; sum
    add rdi, 24 ; books++
    dec rcx ; counter --
    jnz .loop ; id counter != 0
.done
    ret ; go back to main