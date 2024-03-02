<<<<<<< HEAD
$MOD51 
org 00h 
mov dptr,#0B00h 
mov r2,#1000h
mov r1,#33h
test:
mov a,r1 
movx @dptr,a 
movx a,@dptr
xrl a,#33h
jnz error 
inc dptr 
djnz r2,test 
error:
=======
$MOD51 
org 00h 
mov dptr,#0B00h 
mov r2,#1000h
mov r1,#33h
test:
mov a,r1 
movx @dptr,a 
movx a,@dptr
xrl a,#33h
jnz error 
inc dptr 
djnz r2,test 
error:
>>>>>>> Л3 и практики
END