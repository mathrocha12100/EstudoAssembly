segment .data
    LF equ 0xA ; basicamente quebra de linha
    NULL equ 0xD ; Ponteiro pro final da string
    SYS_CALL equ 0x80 ; Envia informacao ao SO
    ; EAX
    SYS_EXIT equ 0x1 ; Operacao pra finalizar o programa
    SYS_WRITE equ 0x4 ; Operacao de escrita console.log do baguio
    SYS_READ equ 0x3 ; Operacao de entrada de dados
    ; EBX
    RET_EXIT equ 0x0 ; Operacao realizada com sucesso
    STD_IN equ 0x0 ; Entrada padrao
    STD_OUT equ 0x1 ; saida padrao

section .data
    x dd 50 ; dd = define double word / dw = define word (char) / db define double world (int, short) / dq define quad world (8 bytes) / dt define ten word
    y dd 10
    msg1 db 'X maior que y', LF, NULL
    msg1_length equ $-msg1
    
    msg2 db 'Y maior que x', LF, NULL
    msg2_length equ $-msg2
section .text

global _start

_start:
    mov eax, dword[x]
    mov ebx, dword[y] 
    
    ; if do assembly
    
    cmp eax, ebx ; EAX >= EBX
    ; salto condicional
    jge greater
    ; j = jump 
    ; je = / jg > / jge >= / jl < / jle <= / jne !=
    ; salto incondiocional jmp
    mov ecx, msg2
    mov edx, msg2_length
    
    jmp final
  

greater:
    mov ecx, msg1
    mov edx, msg1_length
final:
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    int SYS_CALL
    
    mov eax, SYS_EXIT
    xor ebx, ebx;mov ebx, RET_EXIT ; AND / OR / XOR
    int SYS_CALL