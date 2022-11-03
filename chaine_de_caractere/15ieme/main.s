.data
string:
.asciz "My favourite number is FIFTEEN!\n"


.text
.globl main

main : 
push %ebp
mov %esp,%ebp
push %ebx

#votre code
CLD
lea string, %esi
lea string, %edi
movl $14, %ecx
rep movsb

popl %ebx
popl %ebp
ret
