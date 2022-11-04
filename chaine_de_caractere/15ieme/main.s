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
mov $string, %esi
lodsb
add $13, %esi

cmpb $0x41, (%esi)
jb fin

cmpb $0x5a, (%esi)
jnb testMinuscule

jmp Alphabet

testMinuscule:
cmpb $0x61, (%esi)
jb fin
cmpb $0x7a, (%esi)
jnb fin

Alphabet:
lodsb
jmp fin


fin:
popl %ebx
popl %ebp
ret
