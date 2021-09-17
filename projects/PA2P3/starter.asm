###############################################################################
# Title: Assign02P3                   Author: Kody Gentry
# Class: CS 2318-003, Fall 2020       Submitted: 11/05/2020
###############################################################################
# Program: MIPS translation of a given C++ program
###############################################################################
# Pseudocode description: supplied a2p2_SampSoln.cpp
###############################################################################

						# include <iostream>
						# using namespace std;
         .data
a1			.space 12
a2			.space 12
a3			.space 12
einStr			.asciiz "\nEnter integer #"
moStr			   .asciiz "\nMax of "
ieStr			   .asciiz " ints entered..."
emiStr			.asciiz "\nEnter more ints? (n or N = no, others = yes) "
begA1Str		   .asciiz "\nbeginning a1: "
nn09A1Str		.asciiz "\na1 (noneg09): "
procA1Str		.asciiz "\nprocessed a1: "
procA2Str		.asciiz "\n          a2: "
procA3Str		.asciiz "\n          a3: "
dacStr			.asciiz "\nDo another case? (n or N = no, others = yes) "
dlStr			   .asciiz "\n================================"
byeStr         .asciiz "\nbye..."

         .text
			.globl main

main:						# int main(){
			
######################################################
# Register usage:
######################################################
# $a0: extra short-lived holder (as locally commented)
# $a1: endPtr1 
# $a2: endPtr2 
# $a3: endPtr3 
# $t0: target
# $t1: used1
# $t2: used2
# $t3: used3
# $t4: hopPtr1
# $t5: hopPtr2
# $t6: hopPtr11
# $t7: hopPtr3
# $t8: reply or intHolder or iter (non-overlappingly)
# $t9: count
# $v0: extra short-lived holder (as locally commented)
# $v1: short-lived holder (as locally commented)
######################################################

			li $t8, 'y'		# reply = 'y';
			j WTest1		# goto: WTest1;
begW1:
			li $t1, 0		# used1 = 0;
			la $t4, $a1		# hopPtr1 = a1;
			j WTest2		# goto WTest2;
begW2:
         li $v0, 4		# cout << einStr;
         la $a0, einStr
         syscall
         li $v0, 1		# cout << (used1 + 1);
         move $a0, $t1
         addi $a0, $a0, 1
         syscall
         li $v0, 11		# cout << ':' << ' ';
         la $a0, ':'
         syscall
         li $v0, 11
         la $a0, ' '
         syscall
         li $v0, 5
         syscall
         sw $v0, 0(t4)		# cin >> *hopPtr1;
         addi $t1, $t1, 1	# ++used1;
         addi $t4, $t4, 4	# ++hopPtr1;
			li $v1, 12		# if (used1 < 12) - if (used1 >= 12) -> goto else1;
			bgeu $t1, $v1, else1
begI1:
			li $v0, 4		# cout << emiStr;
			la $a0, emiStr
			syscall
			li $v0, 12		# cin >> reply;
			move $a0, $t8
			syscall
			j endI1			# goto endI1;
else1:
         li $v0, 4		# cout << moStr << 12 << ieStr << endl;
         la $a0, moStr
         syscall
         li $v0, 4
         la $a0, 12
         syscall
         li $v0, 4
         la $a0, ieStr
         syscall
         li $t8, 'n'    # reply = 'n';
endI1:
endW2:
WTest2:
         li $v1, 'n'
			beq $t8, $v1, xitW2	# if (reply == 'n') goto xitW2;
			li $v1, 'N'
			bne $t8, $v1, begW2	# if (reply != 'N') goto begW2;
xitW2:

              cout << begA1Str;
              ///if (used1 > 0)
              if (used1 <= 0) goto endI2;
begI2://      {
                 hopPtr1 = a1;
                 endPtr1 = a1 + used1;
                 //do
begDW1://        {
                    cout << *hopPtr1 << ' ' << ' ';
                    ++hopPtr1;
endDW1://        }
                 //while (hopPtr1 < endPtr1);
DWTest1:
                 if (hopPtr1 < endPtr1) goto begDW1;

endI2://      }
              cout << endl;

              //if (used1 > 0)
              if (used1 <= 0) goto endI3;
begI3://      {
                 //for (hopPtr1 = a1, endPtr1 = a1 + used1;  // multi-init
                 //                      hopPtr1 < endPtr1;  // test
                 //                               ++hopPtr1) // update
                 hopPtr1 = a1;
                 endPtr1 = a1 + used1;
                 goto FTest1;
begF1://         {
                    target = *hopPtr1;
                    //if (target < 0 || target > 9)
                    ///if (target >= 0 && target <= 9) goto endI4;
                    if (target < 0) goto begI4;
                    if (target <= 9) goto endI4;
begI4://            {
                       //for (hopPtr11 = hopPtr1 + 1;  // init
                       //         hopPtr11 < endPtr1;  // test
                       //                  ++hopPtr11) // update
                       hopPtr11 = hopPtr1 + 1;
                       goto FTest2;
begF2://               {
                          *(hopPtr11 - 1) = *hopPtr11;
                       ++hopPtr11;
endF2://               }
FTest2:
                       if (hopPtr11 < endPtr1) goto begF2;

                       --used1;
                       --endPtr1;
                       --hopPtr1;
endI4://            }
                 ++hopPtr1;
endF1://         }
FTest1:
                 if (hopPtr1 < endPtr1) goto begF1;

                 cout << nn09A1Str;
                 //if (used1 > 0)
                 if (used1 <= 0) goto endI5;
begI5://         {
                    hopPtr1 = a1;
                    endPtr1 = a1 + used1;
                    //do
begDW2://           {
                       cout << *hopPtr1 << ' ' << ' ';
                       ++hopPtr1;
endDW2://           }
                    //while (hopPtr1 < endPtr1);
DWTest2:
                    if (hopPtr1 < endPtr1) goto begDW2;

endI5://         }
                 cout << endl;

                 used2 = 0;
                 used3 = 0;
                 hopPtr1 = a1;
                 hopPtr2 = a2;
                 hopPtr3 = a3;
                 endPtr1 = a1 + used1;
                 //while (hopPtr1 < endPtr1)
                 goto WTest3;
begW3://         {
                    intHolder = *hopPtr1;
                    *hopPtr2 = intHolder;
                    ++used2;
                    ++hopPtr2;
                    *hopPtr3 = intHolder;
                    ++used3;
                    ++hopPtr3;
                    ++hopPtr1;
endW3://         }
WTest3:
                 if (hopPtr1 < endPtr1) goto begW3;

                 iter = 0;
                 //do
begDW3://        {
                    ++iter;
                    count = 0;
                    //if (iter == 1)
                    if (iter != 1) goto else6;
begI6://            {
                       //for (hopPtr1 = a1, endPtr1 = a1 + used1;  // multi-init
                       //                      hopPtr1 < endPtr1;  // test
                       //                               ++hopPtr1) // update
                       hopPtr1 = a1;
                       endPtr1 = a1 + used1;
                       goto FTest3;
begF3://               {
                          target = *hopPtr1;
                          //if (target != 5)
                          if (target == 5) goto elseI7;
begI7://                  {
                             ++count;
                          goto endI7;
//                        }
elseI7://                 else
//                        {
                             //if (count != 0)
                             if (count == 0) goto endI8;
begI8://                     {
                                *(hopPtr1 - count) = *hopPtr1;
endI8://                     }
endI7://                  }
                       ++hopPtr1;
endF3://               }
FTest3:
                       if (hopPtr1 < endPtr1) goto begF3;

                       used1 -= count;
                       //if (used1 == 0)
                       if (used1 != 0) goto endI9;
begI9://               {
                          hopPtr1 = a1;
                          *hopPtr1 = -99;
                          ++used1;
endI9://               }
                    goto endI6;
//                  }
else6://            else
//                  {
                       //if (iter == 2)
                       if (iter != 2) goto elseI10;
begI10://              {
                          //for (hopPtr2 = a2, endPtr2 = a2 + used2;  // multi-init
                          //                      hopPtr2 < endPtr2;  // test
                          //                               ++hopPtr2) // update
                          hopPtr2 = a2;
                          endPtr2 = a2 + used2;
                          goto FTest4;
begF4://                  {
                             target = *hopPtr2;
                             //if (target > 4)
                             if (target <= 4) goto elseI11;
begI11://                    {
                                ++count;
                             goto endI11;
//                           }
elseI11://                   else
//                           {
                                //if (count != 0)
                                if (count == 0) goto endI12;
begI12://                       {
                                   *(hopPtr2 - count) = *hopPtr2;
endI12://                       }
endI11://                    }
                          ++hopPtr2;
endF4://                  }
FTest4:
                          if (hopPtr2 < endPtr2) goto begF4;

                          used2 -= count;
                          //if (used2 == 0)
                          if (used2 != 0) goto endI13;
begI13://                 {
                             hopPtr2 = a2;
                             *hopPtr2 = -99;
                             ++used2;
endI13://                 }
                       goto endI10;
//                     }
elseI10://             else
//                     {
                          //for (hopPtr3 = a3, endPtr3 = a3 + used3;  // multi-init
                          //                      hopPtr3 < endPtr3;  // test
                          //                               ++hopPtr3) // update
                          hopPtr3 = a3;
                          endPtr3 = a3 + used3;
                          goto FTest5;
begF5://                  {
                             target = *hopPtr3;
                             //if (target < 6)
                             if (target >= 6) goto elseI14;
begI14://                    {
                                ++count;
                             goto endI14;
//                           }
elseI14://                   else
//                           {
                                //if (count != 0)
                                if (count == 0) goto endI15;
begI15://                       {
                                   *(hopPtr3 - count) = *hopPtr3;
endI15://                       }
endI14://                    }
                          ++hopPtr3;
endF5://                  }
FTest5:
                          if (hopPtr3 < endPtr3) goto begF5;

                          used3 -= count;
                          //if (used3 == 0)
                          if (used3 != 0) goto endI16;
begI16://                 {
                             hopPtr3 = a3;
                             *hopPtr3 = -99;
                             ++used3;
endI16://                 }
endI10://              }
endI6://            }
endDW3://        }
                 //while (iter < 3);
DWTest3:
                 if (iter < 3) goto begDW3;

endI3://      }

              cout << procA1Str;
              //if (used1 > 0)
              if (used1 <= 0) goto endI17;
begI17://     {
                 hopPtr1 = a1;
                 endPtr1 = a1 + used1;
                 //do
begDW4://            {
                    cout << *hopPtr1 << ' ' << ' ';
                    ++hopPtr1;
endDW4://        }
                 //while (hopPtr1 < endPtr1);
DWTest4:
                 if (hopPtr1 < endPtr1) goto begDW4;

endI17://     }
              cout << endl;

              cout << procA2Str;
              //if (used2 > 0)
              if (used2 <= 0) goto endI18;
begI18://     {
                 hopPtr2 = a2;
                 endPtr2 = a2 + used2;
                 //do
begDW5://        {
                    cout << *hopPtr2 << ' ' << ' ';
                    ++hopPtr2;
endDW5://        }
                 //while (hopPtr2 < endPtr2);
DWTest5:
                 if (hopPtr2 < endPtr2) goto begDW5;

endI18://     }
              cout << endl;

              cout << procA3Str;
              //if (used3 > 0)
              if (used3 <= 0) goto endI19;
begI19://     {
                 hopPtr3 = a3;
                 endPtr3 = a3 + used3;
                 //do
begDW6://        {
                    cout << *hopPtr3 << ' ' << ' ';
                    ++hopPtr3;
endDW6://        }
                 //while (hopPtr3 < endPtr3);
DWTest6:
                 if (hopPtr3 < endPtr3) goto begDW6;

endI19://     }
              cout << endl;

              cout << dacStr;
              cin >> reply;
endW1://   }
WTest1:
           ///if (reply != 'n' && reply != 'N') goto begW1;
           if (reply == 'n') goto xitW1;
           if (reply != 'N') goto begW1;
xitW1:

           cout << dlStr << '\n';
           cout << byeStr << '\n';
           cout << dlStr << '\n';

           return 0;
}
