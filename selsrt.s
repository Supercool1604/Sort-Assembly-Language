ldr r0,=arr              @array base address
mov r12,#4
mov r8,r0

mov r2,#7                @ storing n ( len )
mov r10,#6                @storing n-1
mov r8,r0
mov r3, #0               @ initialising i
@mov r4,#1               @ initialising j = 1
cmp r3,r2                @ comparing i with n-1
BNE LOOP                 @ if not equal then loop
BEQ exit                 @ else exit

LOOP:
  add r4,r3,#1              
  
  ldr r5,[r8]            @ initialising minimum value as [r8]  
  cmp r3,r10             @ comparing i with n-1
  BNE LOOP2              @ if not equal then inner loop
  BEQ exit               @ else exit
LOOP2: 
  cmp r4,r2              @ comoparing j with n-1
  BNE condn              @ if not equal then condn
  BEQ tempex               @ if equal go to outer loop
  condn:                 
    
   mul r11, r4, r12
   ldr r6,[r0,r11]       @ loading j+1th element  and r0 := r0 + 4
   cmp r6,r5             @ comparing elements  
   BLT cn                @ if jth > j+1th then cn
   BGE cn3
    cn:
      mov r5,r6
      add  r14,r0,r11
 @     str r5,[r8]        @ storing jth in loc j+1
 @     sub r7,r8,#4
 @     str r6,[r7]        @ storing j+1th in loc j
  cn3:
   add r4,r4,#1          @ incrementing j 
   cmp r4,r2             
   BEQ tempex
   BNE LOOP2   
tempex:
  ldr r1,[r8]
  str r5,[r8]
  str r1,[r14]
  add r8,r8,#4
  ldr r5,[r8]
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
 arr: .word 6,3,4,1,5,2,7
 .end





