#Jeffrey Ciferno
#ASUID:1217664240
#ASU Email: jmcifern@asu.edu

.data
string : .asciiz "AbCdEfGhIjKlMnOpQrStUvWxYz"
.text
main :

   la $t0,string   #loads string
converter:      
   lb $t2,0($t0)   #load character from string
   beqz $t2,end   #if string is empty
   bge $t2,'A',upperCase   #if character greater than or equal to A
   bge $t2,'a',lowerCase   #if character greater than or equal to a
   j iterate       #Catch for non alphabet letters or null var

iterate:	     #Iterates though string by 1
   add $t0,$t0,1
   j converter

upperCase:       #check if current letter is less than or equal to Z
   ble $t2,'Z',upperCaseShift   #change to lower case

lowerCase:       #check if current letter  is less than or equal to z
   ble $t2,'z',lowerCaseShift   #change to upper case 

upperCaseShift:    # if upper case add 32 to character and continue
   addi $t2,$t2,32 #addition
   sb $t2,0($t0) #setting byte to new value
   j iterate #returns to iterater

lowerCaseShift:    # if lower case subtract 32 to character and continue
   subi $t2,$t2,32 #subtraction
   sb $t2,0($t0) #setting byte to new value
   j iterate #returns to iterater

end:           #prints the string upon ending
   li $v0,4    #allows for print string
   la $a0,string
   syscall
   li $v0,10 #EXIT
   syscall  
  
