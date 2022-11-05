.data
total:
.int 

.text
.globl pi_approx_entiere

pi_approx_entiere:

push %ebp
mov %esp,%ebp
push %ebx

# VOTRE CODE #
movl 12(%esp), %ecx

sommeCalcul:
movl %ecx, %eax
addl $1, %eax
movl $2, %ebx
mull %ebx
subl $1, %eax
movl %eax, %ebx
movl $4, %eax
divl %ebx

pushl %eax
movl %ecx, %eax
movl $0, %edx
movl $2, %ebx
divl %ebx


cmp $0, %edx
jnz soustraction
jz addition

addition:
popl %eax
addl %eax, total
jmp continue

soustraction:
popl %eax
subl %eax, total
jmp continue

continue:
loop sommeCalcul

movl %ecx, %eax
addl $1, %eax
movl $2, %ebx
mull %ebx
subl $1, %eax
movl %eax, %ebx
movl $4, %eax
divl %ebx
addl %eax, total

movl total, %eax


pop %ebx
pop %ebp
ret
