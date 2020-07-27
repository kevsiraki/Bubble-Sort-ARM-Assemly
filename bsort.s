@Kevin Siraki
.data
.balign 4
format: .asciz "%d\n" 
first: .asciz "first array\n"
second: .asciz "second array\n"
ary: 	.int 5, 2, 13, 45, 7, 6, 28, 9
values:	.int 99,32,6,87,1,42,8,300,111,3
.text
.global main
.extern printf
.extern scanf
.equ false, 0
.equ true, 1
sort:	push {ip, lr} 
do: 	mov r6,#false
	mov r7,#0
	mov r8,#1 
	for:	cmp r8,r5
	bge endfor
	ldr r2,[r4,r7,lsl #2]
	ldr r3,[r4,r8,lsl #2]
	cmp r2,r3
	ble endif
	mov r1,r2
	mov r2,r3
	mov r3,r1
	mov r6,#true
	str r2,[r4,r7,lsl#2]
	str r3,[r4,r8,lsl#2] 
endif:	add r7,#1
	add r8,#1
	b for 
endfor:	cmp r6,#true
	beq do
	pop {ip,pc}
main:  push {ip,lr}
      	ldr r0, =first
	bl printf
	ldr r4, =ary
      	mov r5, #8
      	bl sort
     	 mov r7, #0 
pfor:	ldr r0, =format
	ldr r1, [r4, r7, lsl #2]
      	bl printf
      	add r7, #1
      	cmp r7,r5
      	blt pfor
@second array
 	ldr r0, =second
        bl printf
	ldr r4, =values
	mov r5, #10
	bl sort
       mov r7, #0
vfor:   ldr r0, =format
        ldr r1, [r4, r7, lsl #2]
        bl printf
        add r7, #1
        cmp r7,r5
        blt vfor

	 pop {ip, pc}
