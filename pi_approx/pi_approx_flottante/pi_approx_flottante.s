.data
i:             
.float  0       # i
iteration:
.int 50         # Nombre d'itérations
x:
.float 2       
y:
.float 1
signe1:
.float 1
signe2:
.float -1
pie:             # Valeur du ratio de pie initial
.float 0
cte: 
.float 1
multiplicateur:
.float 4
.text
.globl pi_approx_flottante

pi_approx_flottante:

push %ebp       # Prologue
mov %esp,%ebp
push %ebx

#votre code
movl iteration, %ecx
movl $2, %ebx
movl $0, %eax
calcul:

flds y
flds i
faddp

flds x
fmulp

flds y
fsubrp

verificationpaire:
pushl %eax
movl $0, %edx
divl %ebx
cmp $0, %edx
je addition
jne soustraction

boucle:
popl %eax
addl $1, %eax
loop calcul
jmp fin

addition:
flds signe1
fdivp
flds pie
faddp
fstps pie

flds i
flds cte
faddp
fstps i

jmp boucle

soustraction:
flds signe2
fdivp
flds pie
faddp
fstps pie

flds i
flds cte
faddp
fstps i

jmp boucle

fin:

pop %ebx
pop %ebp
ret
