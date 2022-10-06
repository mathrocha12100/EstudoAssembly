section .data


section .text

global _start

_start:

    mov eax, 0x4 ; 0x4 significa que eu vou dar pra ele alguma coisa na saida padrao
    mov ebx, 0x1 ; saida padrao
    mov ecx, msg ; essa eh a msg
    mov edx, tam ; esse eh o tamanho
    int 0x80
 

    mov eax, 0x1 ; S.O estou termiandno o programa
    mov ebx, 0x0 ; S.O o valor de retorno e 0
    
    int 0x80
