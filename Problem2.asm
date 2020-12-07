#Jeffrey Ciferno
#ASUID:1217664240
#ASU Email: jmcifern@asu.edu

.data
string : .asciiz "The result of updateSum is "
array: .word 1,2,3,4,5
limit: .word 5

.text
main :

   li $t1,0 #y 
   li $t7,1 #subtraction for ble
   la $t0,array   #loads array  
   la $t5,limit   #loads array limit
   j print   #jumps to print
   
squareFunction: #loop

   lw $t3, 0($t0) #load word
   addi $t0,$t0, 4 #iterate pointer
   mul $t4, $t3, $t3 #x=x*x
   add $t1, $t1, $t4 #y = y + x

print:
   sub $t6,$t5,$t7 #shifts array limit by 1 to prevent last variable double count
   ble $t0,$t6,squareFunction #branches on less than equal set array limit, calls looping function
   
   li $v0,4    #allows for print string
   la $a0,string
   syscall
   
   li $v0,1 #allows for print int
   move $a0, $t1 #moves y into a0 for print
   syscall
   
   li $v0,10 #EXIT
   syscall  
