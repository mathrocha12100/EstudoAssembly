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
    msg db "Digite seu nome: ",  LF, NULL
    msg_length equ $-msg
    
; section de variaveis
section .bss
    name resb 1

section .text

global _start

_start:
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, msg
    mov edx, msg_length
    int SYS_CALL
    
    mov eax, SYS_READ
    mov ebx, STD_IN
    mov ecx, name
    mov edx, 0xA
    
    int SYS_CALL
    
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, name
    mov edx, 0xA
    
    int SYS_CALL

    mov eax, SYS_EXIT
    mov ebx, RET_EXIT
    int SYS_CALL
