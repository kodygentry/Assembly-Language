###############################################################################
# Title: Assign02P3                   Author: Cody Blakeney
# Class: CS 2318-001, Fall 2016       Submitted: <date>
###############################################################################
# Program: MIPS tranlation of a given C++ program
###############################################################################
# Pseudocode description: supplied a2p2_SampSoln.cpp
###############################################################################

#include <iostream>
#using namespace std;

#int a1[12],
#    a2[12],
#    a3[12];
#char einStr[]    = "Enter integer #";
#char moStr[]     = "Max of ";
#char ieStr[]     = " ints entered...";
#char emiStr[]    = "Enter more ints? (n or N = no, others = yes) ";
#char begA1Str[]  = "beginning a1: ";
#char procA1Str[] = "processed a1: ";
#char commA2Str[] = "          a2: ";
#char commA3Str[] = "          a3: ";
#char dacStr[]    = "Do another case? (n or N = no, others = yes) ";
#char dlStr[]     = "================================";
#char byeStr[]    = "bye...";

                  .data
a1:               .space 48 
a2:               .space 48
a3:               .space 48
einStr:           .asciiz "Enter integer #"
moStr:            .asciiz "Max of "
ieStr:            .asciiz " ints entered..."
emiStr:           .asciiz "Enter more ints? (n or N = no, others = yes) "
begA1Str:         .asciiz "beginning a1: "
procA1Str:        .asciiz "processed a1: "
commA2Str:        .asciiz "          a2: "
commA3Str:        .asciiz "          a3: "
dacStr:           .asciiz "Do another case? (n or N = no, others = yes) "
dlStr:            .asciiz "================================"
byeStr:           .asciiz "bye..."
         

#int main()
#{
                  .text
                  .globl main
main:

########################################
# Register Usage
########################################
# $t0: used1
# $t1: used2
# $t2: used3
# $t3: hopPtr1
# $t4: hopPtr2
# $t5: hopPtr21
# $t6: hopPtr3
# $t7: endPtr1
# $t8: endPtr2
# $t9: endPtr3
# $v0: short lived variable as commented locally
# $v1: reply
# $a0: short lived variable as commented locally
# $a1: target
# $a2: total
# $a3: mean

########################################
               #char reply;
               #int used1,
                   #used2,
                   #used3,
                   #target,
                   #total,
                   #mean,
                   #*hopPtr1,
                   #*hopPtr2,
                   #*hopPtr21,
                   #*hopPtr3,
                   #*endPtr1,
                   #*endPtr2,
                   #*endPtr3;

               #cout << endl;
               #reply = 'y';
                  li $v1, 'y'           # set reply to 'y'
                  
                  
               
#               //while (reply != 'n' && reply != 'N')
#               goto WTest1;
                  j WTest1              # go to WTest1
begW1:#//       {
                  
                  
#                  used1 = 0;
#                  used2 = 0;
#                  used3 = 0;

                  addi $t0, $zero, 0    # load 0 into used1, used2, used3
                  addi $t1, $zero, 0
                  addi $t2, $zero, 0
                  
#                  hopPtr1 = a1;

                  la $t3, a1            # load address of a1 into hopPtr1
                  
#                  //while (reply != 'n' && reply != 'N')
#                  goto WTest2;
                  j WTest2
begW2:#//          {
#                     cout << einStr;
                  li $v0, 4             # output prompt to enter int
                  la $a0, einStr 
                  syscall                

#                     cout << (used1 + 1);

                  addi $a0, $t0, 1      # output used1 + 1
                  li $v0, 1
                  syscall

#                     cout << ':' << ' ';
                  li $a0, ':'
                  li $v0, 11
                  syscall
                  li $a0, ' '
                  syscall

#                     cin >> *hopPtr1;
                  li $v0, 5
                  syscall               # read in int and store at
                  sw $v0, 0($t3)        # address of hopPtr1

#                     ++used1;
                  addi $t0, $t0, 1      # increase used1 by 1

#                     ++hopPtr1;
                  addi $t3, $t3, 4      # increase hopPtr1 by 1 address

#                     //if (used1 < 12)
#                     if (used1 >= 12) goto else1;

                  li $a0, 12            # load 12 into temp address
                  bge $t0, $a0 else1    # if used1 >= 12 jump to else1
begI1:#//             {
#                        cout << emiStr;
                  li $v0, 4
                  la $a0, emiStr        # load and print emiStr
                  syscall

#                        cin >> reply;
                  li $v0, 12            # load instruction to read char
                  syscall
                  move $v1, $v0         # move intput into reply
                  li $a0, '\n'
                  li $v0, 11
                  syscall

#                     goto endI1;
                  j endI1
#//                   }
else1:#//             else
#//                   {
#                        cout << moStr << 12 << ieStr << endl;
                  li $v0, 4
                  la $a0, moStr         # load and print moStr
                  syscall
                  li $v0, 1             # load instruction to print int
                  li $a0, 12            # load int 12 into temp
                  syscall               # print
                  li $v0, 4         
                  la $a0, ieStr         # load and print ieStr
                  syscall
                  li $a0, '\n'
                  li $v0, 11            # print newline char
                  syscall

#                        reply = 'n';
                  li $v1, 'n'           #set reply to 'n'

endI1:#//             }
WTest2:#//         }
#                  ////if (reply != 'n' && reply != 'N') goto begW2;
#                  if (reply == 'n') goto xitW2;
#                  if (reply != 'N') goto begW2;
                  li $a0, 'n'
                  beq $v1, $a0, xitW2
                  li $a0, 'N'
                  bne $v1, $a0, begW2
xitW2:

#                  cout << endl;
                  li $a0, '\n'
                  li $v0, 11            # print newline char
                  syscall
#
#                  //if (used1 > 0)
#                  if (used1 <= 0) goto endI2;
                  ble $t0, $zero, endI2 

begI2:#//          {
#                     total = 0;
                  li $a2, 0             # set total to 0

#                     //for (hopPtr1 = a1, endPtr1 = a1 + used1; hopPtr1 < endPtr1; ++hopPtr1)
#                     hopPtr1 = a1;
                  la $t3, a1

#                     endPtr1 = a1 + used1;
                  sll $a0, $t0, 2       # multipy used1 by 4 to equal
                                        # correct address indexing

                  add $t7, $t3, $a0     # add (4 * used1) to address value of
                                        # hopPtr1
                  
#                     goto FTest1;
                  j FTest1              # go to FTest1
begF1:#//             {

#                        target = *hopPtr1;
                  lw $a1, 0($t3)        # set value of target to hopPtr1

#                        total += target;
                  add $a2, $a2, $a1     # increment total by target

#                        //if (target % 2 == 1)
#                        ////if (target % 2 != 1) goto else3;
#                        if ( (target & 1) != 1) goto else3;
                  andi $a0, $a1, 1      # store result of target & 1 in temp
                  li $v0, 1             # load 1 into temp2
                  bne  $a0, $v0, else3       # if temp == 0 (aka !1) jump to else3
begI3:#//                {

#                           hopPtr3 = a3 + used3 - 1;
#                           endPtr3 = a3;
                  sll $a0, $t2, 2       # multiply used3 by 4 into temp
                  addi $a0, $a0, -4     # subtract index size value from temp
                  la $t9, a3            # load a3 address into endPtr3
                  add $t6, $t9, $a0     # add temp to endPtr3 to get 
                                        # hopPtr3
#                           

#                           //while (hopPtr3 >= endPtr3)
#                           goto WTest3;
                  j WTest3
begW3:#//                   {
#                              //if (*hopPtr3 > target)
#                              if (*hopPtr3 <= target) goto else4;
                  lw $a0, 0($t6)           # load value at hopPtr3 int temp
                  ble $a0, $a1, else4    # if temp less than target jump 
                                        # to else4
begI4:#//                      {
#                                 *(hopPtr3 + 1) = *hopPtr3;
#                                 --hopPtr3;
                  lw $a0, 0($t6)        # put value hopPtr3 points to in temp
                  sw $a0, 4($t6)        # store that vale at hopPtr3 + 4
                  addi $t6, $t6, -4     # decrease hopPtr3 by one array index

#                              goto endI4;
                  j endI4
#//                            }
else4:#//                      else
#//                            {
#                                 //break;
#                                 goto xitW3;
                  j xitW3
endI4:#//                      }
WTest3:#//                  }
#                           if (hopPtr3 >= endPtr3) goto begW3;
                  bge $t6, $t9, begW3  # if hopPtr3 >= endPtr3 jupt to begW3
xitW3:
                           #*(hopPtr3 + 1) = target;
                  sw $a1, 4($t6)        # store target at address of hopPtr3
                                        # plus size of 1 address

                           #++used3;
                  addi $t2, $t2, 1      # increase used3 by 1

                        #goto endI3;
                  j endI3
#//                      }
else3:#//                else
#//                      {
                           #hopPtr2 = a2;
                  la $t4, a2

                           #endPtr2 = a2 + used2;
                  sll $a0, $t1, 2       # multipy value of used2 by 4
                                        # to equal correct value of address 
                  add $t8, $t4, $a0     # add addess of hopPtr2 with used2 * 4

                           #//while (hopPtr2 < endPtr2)
                           #goto WTest4;
                  j WTest4
begW4:#//                   {
                              #//if (*hopPtr2 >= target)
                              #if (*hopPtr2 < target) goto else5;
                  lw $a0, 0($t4)        # load value hopPtr2 points to 
                                        # into temp

                  blt $a0, $a1, else5   # if *hopPtr2 less than target
                                        # jump to else5
begI5:#//                      {
                                 #hopPtr21 = endPtr2;
                  add $t5, $zero, $t8   # copy endPtr2 to hopPtr21

                                 #///while (hopPtr21 > hopPtr2)
                                 #goto WTest5;
                  j WTest5
begW5:#//                         {
                                    #*hopPtr21 = *(hopPtr21 - 1);
                  addi $a0, $t5, -4     # put value of hopPtr21 - 1*4 into temp
                  lw $a0, 0($a0)	# put value at that address to temp	
                  sw $a0, 0($t5)
                  
                                    #--hopPtr21;
                  addi $t5, $t5, -4     # decrease hopPtr21 by index size
WTest5:#//                        }
                                 #if (hopPtr21 > hopPtr2) goto begW5;
                  bgt $t5, $t4, begW5

                                 #///break;
                                 #goto xitW4;
                  j xitW4
                           #///goto endI5; // unreacheable
#//                            }
else5:#//                      else
#//                            {
                                 #++hopPtr2;
                  addi $t4, $t4, 4 #increase hopPtr2 address by int size

endI5:#//                      }
WTest4:#//                  }
                           #if (hopPtr2 < endPtr2) goto begW4;
                  blt $t4, $t8, begW4
xitW4:
                           #*hopPtr2 = target;
                  sw $a1, 0($t4)           # store target at address of hopPtr2

                           #++used2;
                  addi $t1, $t1, 1
endI3:#//                }
                        #mean = total/used1;
                  div $a3, $a2, $t0     # set mean to total/used1

                     #++hopPtr1;
                  addi $t3, $t3, 4       # increment hopPtr1 by index value
FTest1:#//            }
                     #if (hopPtr1 < endPtr1) goto begF1;
                  blt $t3, $t7, begF1   # if hopPtr1 less than endPtr1
                                        # jump to begF1
                     #cout << begA1Str;
                  li $v0, 4             # output begining A1 string
                  la $a0, begA1Str 
                  syscall 
                     #//if (used1 > 0)
                     #if (used1 <= 0) goto endI6;
                  ble $t0, $zero, endI6 # if used1 <=0 got to endI6
begI6:#//             {
                        #hopPtr1 = a1;
                  la $t3, a1            # load a1 address into hopPtr1

                        #endPtr1 = a1 + used1;
                  sll $a0, $t0, 2       # multipy used1 by index size 
                                        # and store in temp
                  add $t7, $t3, $a0     # add temp to hopPtr1 and store in
                                        # endPtr1
                        
#//                      do
begDW1:#//               {
                           #cout << *hopPtr1 << ' ' << ' ';
                  lw $a0, 0($t3)        # load value at hopPtr1
                  li $v0, 1             # load instruction to print int
                  syscall
                  li $a0, ' '           # load ' ' char into $a0
                  li $v0, 11            # load instruction to print char
                  syscall               # print ' '
                  syscall               # print 2nd ' '

                           #++hopPtr1;
                  addi $t3, $t3, 4      # increase hopPtr1 by index size
DWTest1:#//              }
                        #//while (hopPtr1 < endPtr1);
                        #if (hopPtr1 < endPtr1) goto begDW1;
                  blt $t3, $t7, begDW1

endI6:#//             }
                     #cout << endl;
                  li $a0, '\n'          # load newline into temp
                  li $v0, 11            # load instruction to print char
                  syscall               # call print char 
#
                     #cout << commA2Str;
                  li $v0, 4             # load instruction to print str
                  la $a0, commA2Str     # output commA2Str
                  syscall

                     #//if (used2 > 0)
                     #if (used2 <= 0) goto endI7;
                  ble $t1, $zero, endI7 # if used2 <= 0 jumpt to endI7
begI7:#//             {
                        #hopPtr2 = a2;
                  la $t4, a2

                        #endPtr2 = a2 + used2;
                  sll $a0, $t1, 2       # multiply used2 by 4 
                                        # and store in temp
                  add $t8, $t4, $a0
#//                      do
begDW2:#//               {
                           #cout << *hopPtr2 << ' ' << ' ';
                  lw $a0, 0($t4)        # load value at hopPtr2
                  li $v0, 1             # load instruction to print int
                  syscall
                  li $a0, ' '           # load ' ' char into $a0
                  li $v0, 11            # load instruction to print char
                  syscall               # print ' '
                  syscall               # print 2nd ' '

                           #++hopPtr2;
                  addi $t4, $t4, 4      # increase hopPtr2 by index size
DWTest2:#//              }

                        #//while (hopPtr2 < endPtr2);
                        #if (hopPtr2 < endPtr2) goto begDW2;
                  blt $t4, $t8, begDW2  # if hopPtr2 < endPtr2 goto begDW2

endI7:#//             }
                     #cout << endl;
                  li $a0, '\n'          # load endline char
                  li $v0, 11            # load instruction to print char
                  syscall
#
                     #cout << commA3Str;
                  li $v0, 4             # load instruction to print str
                  la $a0, commA3Str     # output commA3Str
                  syscall

                     #//if (used3 > 0)
                     #if (used3 <= 0) goto endI8;
                     ble $t2, $zero, endI8
begI8:#//             {
                        #hopPtr3 = a3;
                  la $t6, a3            # load address of a3 into hopPtr3

                        #endPtr3 = a3 + used3;
                  sll $a0, $t2, 2       # multiply used3 by 4 
                                        # and store in temp
                  add $t9, $t6, $a0     # add temp to hopPtr3 store in 
                                        # endPtr3
#//                      do
begDW3:#//               {
                           #cout << *hopPtr3 << ' ' << ' ';
                  lw $a0, 0($t6)        # load value at hopPtr3
                  li $v0, 1             # load instruction to print int
                  syscall
                  li $a0, ' '           # load ' ' char into $a0
                  li $v0, 11            # load instruction to print char
                  syscall               # print ' '
                  syscall               # print 2nd ' '

                           #++hopPtr3;
                  addi $t6, $t6, 4      # increase hopPtr3 by index size

DWTest3:#//              }
                        #//while (hopPtr3 < endPtr3);
                        #if (hopPtr3 < endPtr3) goto begDW3;
                  blt $t6, $t9, begDW3
endI8:#//             }

                     #cout << endl;
                  li $a0, '\n'          # load endline char
                  li $v0, 11            # load instruction to print char
                  syscall

#
                     #hopPtr1 = a1;
               la $t3, a1               # load address of a1 to hopPtr1

                     #hopPtr2 = a2;
               la $t4, a2               # load address of a2 to hopPtr2

                     #hopPtr3 = a3;
               la $t6, a3               # load address of a3 to hopPtr3

                     #endPtr2 = a2 + used2;
               sll $a0, $t1, 2          # multiply by index size, 
                                        # store in temp
               add $t8, $t4, $a0        # store hopPtr2 + temp in endPtr2

                     #endPtr3 = a3 + used3;
               sll $a0, $t2, 2          # multiply by index size, 
                                        # store in temp
               add $t9, $t6, $a0        # store hopPtr3 + temp in endPtr3

                     #//while (hopPtr2 < endPtr2 && hopPtr3 < endPtr3)
                     #goto WTest6;
                  j WTest6              # jump to WTest6

begW6:#//             {
                        #//if (*hopPtr2 < *hopPtr3)
                        #if (*hopPtr2 >= *hopPtr3) goto else9;
                  lw $v0, 0($t4)        # load value at hopPtr2 into temp1
                  lw $a0, 0($t6)        # load value at hopPtr3 into temp2
                  bge $v0, $a0, else9

begI9:#//                {
                           #*hopPtr1 = *hopPtr2;
                  lw $v0, 0($t4)
                  sw $v0, 0($t3)        # store value at hopPtr2 in hopPtr1

                           #++hopPtr2;
                  addi $t4, $t4, 4      # increase hopPtr2 by index size

                        #goto endI9;
                  j endI9               # jump to endI9
#//                      }
else9:#//                else
#//                      {
                           #*hopPtr1 = *hopPtr3;
                  lw $a0, 0($t6)        # load value at hopPtr3 into temp2
                  sw $a0, 0($t3)        # store value at hopPtr3 in hopPtr1

                           #++hopPtr3;
                  addi $t6, $t6, 4      # increase hopPtr3 by index size

endI9:#//                }
                        #++hopPtr1;
                  addi $t3, $t3, 4      # increase hopPtr1 by index size
WTest6:#//            }
                     #////if (hopPtr2 < endPtr2 && hopPtr3 < endPtr3) goto begW6;
                     #if (hopPtr2 >= endPtr2) goto xitW6;
                  bge $t4, $t8, xitW6

                     #if (hopPtr3 < endPtr3) goto begW6;
                  blt $t6, $t9, begW6
xitW6:
                     #//while (hopPtr2 < endPtr2)
                     #goto WTest7;
                  j WTest7              # jump to WTest7
begW7:#//             {
                        #*hopPtr1 = *hopPtr2;
                  lw $a0, 0($t4)        # store value at hopPtr2 in temp
                  sw $a0, 0($t3)        # store temp into hopPtr1

                        #++hopPtr2;
                  addi $t4, $t4, 4      # increase hopPtr2 by index size

                        #++hopPtr1;
                  addi $t3, $t3, 4     # increase hopPtr1 by index size
WTest7:#//            }
                     #if (hopPtr2 < endPtr2) goto begW7;
                  blt $t4, $t8, begW7
#
                     #//while (hopPtr3 < endPtr3)
                     #goto WTest8;
                  j WTest8              # jump to WTest8
begW8:#//             {
                        #*hopPtr1 = *hopPtr3;
                  lw $a0, 0($t6)        # store value at hopPtr3 in temp
                  sw $a0, 0($t3)        # store temp into hopPtr1

                        #++hopPtr3;
                  addi $t6, $t6, 4      # increase hopPtr3 by index size

                        #++hopPtr1;
                  addi $t3, $t3, 4     # increase hopPtr1 by index size

WTest8:#//            }
                     #if (hopPtr3 < endPtr3) goto begW8;
                  blt $t6, $t9, begW8   # if hopPtr3 < endPtr3 goto begW8
#
                     #hopPtr1 = a1;
                  la $t3, a1               # load address of a1 to hopPtr1

                     #hopPtr2 = a2;
                  la $t4, a2               # load address of a2 to hopPtr2

                     #hopPtr3 = a3;
                  la $t6, a3               # load address of a3 to hopPtr3

                     #endPtr1 = a1 + used1;
                  sll $a0, $t0, 2       # multipy used1 by 4 to equal
                                        # correct address indexing

                  add $t7, $t3, $a0     # add (4 * used1) to address value of
                                        # hopPtr1
                     #used2 = 0;
                  li $t1, 0             # load 0 into used2

                     #used3 = 0;
                  li $t2, 0             # load 0 into used3

                     #//while (hopPtr1 < endPtr1)
                     #goto WTest9;
                  j WTest9              # jump to WTest9
begW9:#//             {
                        #target = *hopPtr1;
                  lw $a1, 0($t3)        # load value at hopPtr to target

                        #//if (target < mean)
                        #if (target >= mean) goto else10;
                  bge $a1, $a3, else10
begI10:#//               {
                           #*hopPtr2 = target;
                  sw $a1, 0($t4)        # set value at hopPtr2 to target

                           #++used2;
                  addi $t1, $t1, 1      # increase used2 by 1

                           #++hopPtr2;
                  addi $t4, $t4, 4      # increase hopPtr2 by index size

                        #goto endI10;
                  j endI10              # jump to endI10
#//                      }
else10:#//               else
#//                      {
                           #//if (target > mean)
                           #if (target <= mean) goto endI11;
                  ble $a1, $a3, endI11

begI11:#//                  {
                              #*hopPtr3 = target;
                  sw $a1, 0($t6)        # set value at hopPtr3 to target

                              #++used3;
                  addi $t2, $t2, 1

                              #++hopPtr3;
                  addi $t6, $t6, 4      # increase hopPtr3 by index size

endI11:#//                  }
endI10:#//               }
                        #++hopPtr1;
                  addi $t3, $t3, 4      # increase hopPtr1 by index size
WTest9:#//            }
                     #if (hopPtr1 < endPtr1) goto begW9;
                  blt $t3, $t7, begW9
#
                     #cout << procA1Str;
                  li $v0, 4             # load instruction to print str
                  la $a0, procA1Str     # output procA1Str
                  syscall
                   
                     #//if (used1 > 0)
                     #if (used1 <= 0) goto endI12;
                  ble $t0, $zero, endI12  # if used1 <= 0 goto endI12
begI12:#//            {
                        #hopPtr1 = a1;
                  la $t3, a1               # load address of a1 to hopPtr1

                        #endPtr1 = a1 + used1;
                  sll $a0, $t0, 2       # multipy used1 by 4 to equal
                                        # correct address indexing

                  add $t7, $t3, $a0     # add (4 * used1) to address value of
                                        # hopPtr1
                        #//do
begDW4:#//               {
                           #cout << *hopPtr1 << ' ' << ' ';
                  lw $a0, 0($t3)        # load value at hopPtr1
                  li $v0, 1             # load instruction to print int
                  syscall
                  li $a0, ' '           # load ' ' char into $a0
                  li $v0, 11            # load instruction to print char
                  syscall               # print ' '
                  syscall               # print 2nd ' '

                           #++hopPtr1;
                  addi $t3, $t3, 4      # increase hopPtr1 by index size
DWTest4:#//               }
                        #//while (hopPtr1 < endPtr1);
                        #if (hopPtr1 < endPtr1) goto begDW4;
                  blt $t3, $t7, begDW4
endI12:#//            }
                     #cout << endl;
                  li $a0, '\n'          # load char '\n'
                  li $v0, 11            # load print char instruction
                  syscall               # call instruction
#
                     #cout << commA2Str;
                  li $v0, 4             # load instruction to print str
                  la $a0, commA2Str     # output commA2Str
                  syscall

                     #//if (used2 > 0)
                     #if (used2 <= 0) goto endI13;
                  ble $t1, $zero, endI13  # go to endI13 if used2 <= 0
begI13:#//            {
                        #hopPtr2 = a2;
                  la $t4, a2            # load address of a2 to hopPtr2

                        #endPtr2 = a2 + used2;
                  sll $a0, $t1, 2       # multiply by index size, 
                                        # store in temp
                  add $t8, $t4, $a0     # store hopPtr2 + temp in endPtr2

                        #//do
begDW5:#//               {
                           #cout << *hopPtr2 << ' ' << ' ';
                  lw $a0, 0($t4)        # load value at hopPtr2
                  li $v0, 1             # load instruction to print int
                  syscall
                  li $a0, ' '           # load ' ' char into $a0
                  li $v0, 11            # load instruction to print char
                  syscall               # print ' '
                  syscall               # print 2nd ' '

                           #++hopPtr2;
                  addi $t4, $t4, 4      # increase hopPtr2 by index size

DWTest5:#//               }
                        #//while (hopPtr2 < endPtr2);
                        #if (hopPtr2 < endPtr2) goto begDW5;
                  blt $t4, $t8, begDW5
endI13:#//            }
                     #cout << endl;
                  li $a0, '\n'          # load char '\n'
                  li $v0, 11            # load print char instruction
                  syscall               # call instruction
#
                     #cout << commA3Str;
                  li $v0, 4             # load instruction to print str
                  la $a0, commA3Str     # output commA3Str
                  syscall

                     #//if (used3 > 0)
                     #if (used3 <= 0) goto endI14;
                  ble $t2, $zero, endI14
begI14:#//            {
                        #hopPtr3 = a3;
                  la $t6, a3            # load address of a3 to hopPtr3

                        #endPtr3 = a3 + used3;
                  sll $a0, $t2, 2       # multiply by index size, 
                                        # store in temp
                  add $t9, $t6, $a0     # store hopPtr3 + temp in endPtr3
                        #//do
begDW6:#//               {
                           #cout << *hopPtr3 << ' ' << ' ';
                  lw $a0, 0($t6)        # load value at hopPtr3
                  li $v0, 1             # load instruction to print int
                  syscall
                  li $a0, ' '           # load ' ' char into $a0
                  li $v0, 11            # load instruction to print char
                  syscall               # print ' '
                  syscall               # print 2nd ' '

                           #++hopPtr3;
                  addi $t6, $t6, 4      # increase hopPtr3 by index size

DWTest6:#//               }
                        #//while (hopPtr3 < endPtr3);
                        #if (hopPtr3 < endPtr3) goto begDW6;
                  blt $t6, $t9, begDW6
endI14:#//            }
                     #cout << endl;
                  li $a0, '\n'          # load char '\n'
                  li $v0, 11            # load print char instruction
                  syscall               # call instruction

endI2:#//          }
#
                  #cout << endl;
                  li $a0, '\n'
                  li $v0, 11
                  syscall 

                  #cout << dacStr;
                  li $v0, 4             # output prompt to continue
                  la $a0, dacStr 
                  syscall

                  #cin >> reply;               
                  li $v0, 12            # read in reply
                  syscall
                  move $v1, $v0

                  #cout << endl;
                  li $a0, '\n'
                  li $v0, 11
                  syscall

WTest1:#//      }
               #////if (reply != 'n' && reply != 'N') goto begW1;
               #if (reply == 'n') goto xitW1;
               #if (reply != 'N') goto begW1;

                  li $a0, 'n'
                  beq $v1, $a0, xitW1
                  li $a0, 'N'
                  bne $v1, $a0, begW1
xitW1:
               #cout << dlStr << '\n';
                  li $v0, 4             # load instruction to print str
                  la $a0, dlStr         # output dlStr
                  syscall
                  li $a0, '\n'          # load char '\n'
                  li $v0, 11            # load print char instruction
                  syscall               # call instruction
                  
               #cout << byeStr << '\n';
                  li $v0, 4             # load instruction to print str
                  la $a0, byeStr        # output byeStr
                  syscall
                  li $a0, '\n'          # load char '\n'
                  li $v0, 11            # load print char instruction
                  syscall               # call instruction

               #cout << dlStr << '\n';
                  li $v0, 4             # load instruction to print str
                  la $a0, dlStr         # output dlStr
                  syscall
                  li $a0, '\n'          # load char '\n'
                  li $v0, 11            # load print char instruction
                  syscall               # call instruction
#
               #return 0;
               li $v0, 10
               syscall
#}
#