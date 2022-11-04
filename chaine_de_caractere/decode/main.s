.data
string1:
.asciz  "AazZWgFh tuvJKLYZHj" # Le message à decoder AazZWgFF donne une lettre ASCII, tuvJKLYZH donne l'autre. 
resultat:
.asciz ""

.text
.globl main

main : 
push %ebp
mov %esp,%ebp
push %ebx

#Votre code ici
CLD
movl $0, %eax
mov $string1, %esi
lodsb

calcul:

#centaines
movl $100, %ebx
movl $0, %edx
divl %ebx
addb %al, resultat

#dizaines et unitees
movl %edx, %eax
movl $10, %ebx
movl $0, %edx
divl %ebx
addb %al, resultat
addb %dl, resultat
lodsb

#verification si espace ou fin de string
cmp $0, %eax
je fin

cmp $0x20, %eax
jne calcul

#print du premier charactere
push $resultat
call printf
addl $4, %esp
movb $0, resultat
lodsb
jmp calcul



fin:
#print du deuxieme charactere
push $resultat
call printf
addl $4, %esp

pop %ebx
pop %ebp
ret
