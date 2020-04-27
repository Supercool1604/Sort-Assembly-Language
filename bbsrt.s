ldr r0,=arr              @array base address

mov r8,r0

mov r2,#6                @ storing n-1 ( len-1)
mov r3, #0               @ initialising i
mov r4,#0                @ initialising j = 0
cmp r3,r2                @ comparing i with n-1
BNE LOOP                 @ if not equal then loop
BEQ exit                 @ else exit

LOOP:
  mov r4,#0
  mov r8,r0
  cmp r3,r2              @ comparing i with n-1
  BNE LOOP2              @ if not equal then inner loop
  BEQ exit               @ else exit
LOOP2: 
  cmp r4,r2              @ comoparing j with n-1
  BNE condn              @ if not equal then condn
  BEQ LOOP               @ if equal fo to outer loop
  condn:                 
   ldr r5,[r8]           @ loading jth element  
   ldr r6,[r8,#4]!       @ loading j+1th element  and r0 := r0 + 4
   cmp r6,r5             @ comparing elements  
   BLT cn                @ if jth > j+1th then cn
   BGE cn3
    cn:
      str r5,[r8]        @ storing jth in loc j+1
      sub r7,r8,#4
      str r6,[r7]        @ storing j+1th in loc j
  cn3:
   add r4,r4,#1          @ incrementing j 
   cmp r4,r2             
   BEQ tempex
   BNE LOOP2   
tempex:
  add r3,r3,#1
  cmp r3,r2
  BEQ exit
  BNE LOOP

exit:
  ldr r9 , [r0]
  ldr r2 , [r0,#4]
  ldr r3 , [r0,#8]
  ldr r4 , [r0,#12]
  ldr r5 , [r0,#16]
  ldr r6 , [r0,#20]
  ldr r7 , [r0,#24]
  

.data
 arr: .word 5,8,2,6,1,7,2
 .end





