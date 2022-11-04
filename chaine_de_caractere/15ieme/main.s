.data
string:
.asciz "My favourite number is FIFTEEN!\n"
resultat:
.asciz "" 


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


fin: #basee sur exemple offert par Mahfoud via discord
movb %al, resultat
push $resultat
call printf
addl $0x04, %esp

popl %ebx
popl %ebp
ret
