#Jeffrey Ciferno
#ASUID:1217664240
#ASU Email: jmcifern@asu.edu

.data
string : .asciiz "The computed result is "
array: .word 5,4,3,2,1
.text
main :

   li $a3,0 #y 
   la $a0,array   #loads array
   li $a1, 1 #increment
   jal loop #loop call
   j print   #jumps to exit

loop: #loop
   subi $sp, $sp 8 #sp initilization
   sw $ra, 0($sp) #return address
   bne $a0, 100000000, rec #calls rec if $a0 is not equal to a giant number
   lw $ra, 0($sp) #loads return address
   addi $sp, $sp, 8 #sp deinitilization
   jr $ra #return

rec:
   lw $t1, 0($a0) #load 1st word (5)
   beq $t1,1,print #breaks when the last element of the array is equal to 1
   mul $t2, $a1, 4 #addressing
   add $t2, $a0, $t2 #convert current address to next address
   lw $t2, 0($t2) #loads converted value
   sub $t3, $t1,$t2 #subrtracts 1st and 2nd word
   add $a3, $a3, $t3 #adds the result form subtract to main counter
   addi $a0, $a0, 4 #iterate pointer array 
   jal loop #recursive return
print:

   li $v0,4    #allows for print string
   la $a0,string
   syscall

   li $v0,1 #allows for print int
   move $a0, $a3 #moves y into a0 for print
   syscall

   li $v0,10 #EXIT
   syscall









