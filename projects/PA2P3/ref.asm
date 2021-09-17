###############################################################################
# Title: Assign02P3                   Author: Jordyn Dream Roth
# Class: CS 2318-253, Spring 2020     Submitted: 4/6/2020
###############################################################################
# Program: MIPS tranlation of a given C++ program
###############################################################################
# Pseudocode description: supplied a2p2_SampSoln.cpp
###############################################################################

			.data
a1:			.space 48
a2:			.space 48
a3:			.space 48
einStr:			.asciiz "\nEnter integer #"
moStr:			.asciiz "\nMax of "
ieStr:			.asciiz " ints entered..."
emiStr:			.asciiz "\nEnter more ints? (n or N = no, others = yes) "
begA1Str:		.asciiz "\nbeginning a1: "
am1dA1Str:		.asciiz "\na1 (dups<=1): "
procA1Str:		.asciiz "\nprocessed a1: "
procA2Str:		.asciiz "\n          a2: "
procA3Str:		.asciiz "\n          a3: "
dacStr:			.asciiz "\nDo another case? (n or N = no, others = yes) "
d1Str:			.asciiz "\n================================"
byeStr:			.asciiz "\nbye..."

			.text
			.globl main

main:		

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

			li $t8,	'y'		#reply = 'y';
			j WTest1		#goto WTest1;
begW1:
			li $t1, 0		#used1 = 0;
			la $t4, a1		#hopPtr1 = a1;
			j WTest2		#goto WTest2;	
begW2:
			li $v0, 4
			la $a0, einStr
			syscall			#cout << einStr;
			li $v0, 1
			move $a0, $t1
			addi $a0, $a0, 1
			syscall			#cout << (used1 + 1);
			li $v0, 11
			li $a0, ':'
			syscall
			li $v0, 11
			li $a0, ' '
			syscall			#cout << ':' << ' ';
			li $v0, 5
			syscall
			sw $v0, 0($t4)		#cin >> *hopPtr1;
			addi $t1, $t1, 1	#++used1;
			addi $t4, $t4, 4	#++hopPtr1;
			li $v1, 12
			bgeu $t1, $v1, else1	#if (used1 >= 12) //can also be !<12// goto else1;
begI1:
			li $v0, 4
			la $a0, emiStr
			syscall			#cout << emiStr;
			li $v0, 12
			move $a0, $t8
			syscall			#cin >> reply;
			j endI1			#goto endI1;
else1:
			li $v0, 4
			la $a0, moStr
			syscall
			li $v0, 4
			li $a0,	12
			syscall
			li $v0, 4
			la $a0, ieStr
			syscall			#cout << moStr << 12 << ieStr << endl;
			li $t8, 'n'		#reply = 'n';
endI1:
WTest2:
	        li $v1, 'n'
			beq $t8, $v1, xitW2	#if (reply == 'n') goto xitW2;
			li $v1, 'N'
			bne $t8, $v1, begW2	#if (reply != 'N') goto begW2;
endW2:
xitW2:
            li $v0, 4
			la $a0, begA1Str
			syscall			#cout << begA1Str;            
			blez $t1, endI2		#if (used1 <= 0) goto endI2;
begI2:
			la $t4, a1		#hopPtr1 = a1;
            sll $v1, $t1, 2
			add $a1, $t4, $v1	#endPtr1 = a1 + used1;
begDW1:
			li $v0, 1
			lw $a0, 0($t4)
			syscall
			li $v0, 11
			li, $a0, ' '
			syscall
			li $v0, 11
			li, $a0, ' '
			syscall			#cout << *hopPtr1 << ' ' << ' ';
			addi $t4, $t4, 4	#++hopPtr1;
endDW1:
DWTest1:
			bltu $t4, $a1, begDW1	#if (hopPtr1 < endPtr1) goto begDW1;
endI2:
			li $v0, 1
			bleu $t1, $v0, else3	#if (used1 <= 1) goto else3;
begI3:
			la $t4, a1		#hopPtr1 = a1;
			la $a1, a1
			sll $v1, $t1, 2
			addi $v1, $v1, -4
			add $a1, $a1, $v1	#endPtr1 = a1 + used1 - 1;
			j WTest3		#goto WTest3;
begW3:
			li $t9, 0		#count = 0;                 
			addi $t5, $t4, 4	#hopPtr2 = hopPtr1 + 1;
			la $a2, a1
			sll $v1, $t1, 2
			add $a2, $a2, $v1	#endPtr2 = a1 + used1;
			j FTest1		#goto FTest1;
begF1:                     
			lw $v0, 0($t5)
			lw $v1, 0($t4)
			bne $v0, $v1, endI4	#if (*hopPtr2 != *hopPtr1) goto endI4;
begI4:                        
			li $v1, 1
			bne $t9, $v1, else5	#if (found != 1) goto else5;
begI5:
			addi $t7, $t5, 4	#hopPtr3 = hopPtr2 + 1;
			la $a3, a1
			sll $v1, $t1, 2
			add $a3, $a3, $v1	#endPtr3 = a1 + used1;
			j FTest2		#goto FTest2;
begF2:
			lw $v1, 0($t7)
			sw $v1, -4($t7)		#*(hopPtr3 - 1) = *hopPtr3;
			addi $t7, $t7, 4	#++hopPtr3;
FTest2:
			bltu $t7, $a3, begF2	#if (hopPtr3 < endPtr3) goto begF2;
endF2:
			addi $t1, $t1, -1	#--used1;
			addi $a1, $a1, -4	#--endPtr1;
			addi $a2, $a2, -4	#--endPtr2;
			addi $a3, $a3, -4	#--endPtr3;
			addi $t5, $t5, -4	#--hopPtr2;
			j endI5			#goto endI5;
else5:
			addi $t9, $t9, 1	#++found;
endI5:
endI4:
			addi $t5, $t5, 4	#++hopPtr2;
FTest1:
			bltu $t5, $a2, begF1	#if (hopPtr2 < endPtr2) goto begF1;
endF1:
			addi $t4, $t4, 4	#++hopPtr1;
WTest3:
			bltu $t4, $a1, begW3	#if (hopPtr1 < endPtr1) goto begW3;
endW3:
			li $v0, 4
			la $a0, am1dA1Str
			syscall			#cout << am1dA1Str;
			blez $t1, endI6		#if (used1 <= 0) goto endI6;
begI6:
			la $t4, a1		#hopPtr1 = a1;
                     	sll $v1, $t1, 2
			add $a1, $t4, $v1	#endPtr1 = a1 + used1;
begDW2:
			li $v0, 1
			lw $a0, 0($t4)
			syscall
			li $v0, 11
			li, $a0, ' '
			syscall
			li $v0, 11
			li, $a0, ' '
			syscall			#cout << *hopPtr1 << ' ' << ' ';
			addi $t4, $t4, 4	#++hopPtr1;
endDW2:
DWTest2:
			bltu $t4, $a1, begDW2	#if (hopPtr1 < endPtr1) goto begDW2;
endI6:
			blez $t1, endI7		#if (used1 <= 0) goto endI7;
begI7:
			li $t8, 0		#sum = 0;
			la $a1, a1
			sll $v1, $t1, 2
			addi $v1, $v1, -4
			add $a1, $a1, $v1	#endPtr1 = a1 + used1 - 1;
			la $a1, a1		#endPtr1 = a1;
begDW3:
			lw $v1, 0($t4)
			add $t8, $t8, $v1	#sum += *hopPtr1;
			addi $t4, $t4, -4	#--hopPtr1;
endDW3:
DWTest3:
			bgeu $t4, $a1, begDW3	#if (hopPtr1 >= endPtr1) goto begDW3;
			div $t9, $t8, $t1	#truncAvg = sum / used1;
			li $t2, 0		#used2 = 0;
			li $t3, 0		#used3 = 0;
			la $t5, a2		#hopPtr2 = a2;
			la $t7, a3		#hopPtr3 = a3;
			la $t4, a1		#hopPtr1 = a1;
			la $a1, a1
			sll $v1, $t1, 2
			add $a1, $a1, $v1	#endPtr1 = a1 + used1;
			j FTest3		#goto FTest3;
begF3:
			lw $v1, 0($t4)
			beq $v1, $t9, endI8	#if (*hopPtr1 == truncAvg) goto endI8;
begI8:                      
			lw $v1, 0($t4)
			bgeu $v1, $t9, else9	#if (*hopPtr1 >= truncAvg) goto else9;
begI9:
			lw $v1, 0($t4)
			sw $v1, 0($t5)		#*hopPtr2 = *hopPtr1;
			addi $t2, $t2, 1	#++used2;
			addi $t5, $t5, 1	#++hopPtr2;
			j endI9			#goto endI9;
else9:
			lw $v1, 0($t4)
			sw $v1, 0($t7)		#*hopPtr3 = *hopPtr1;
			addi $t3, $t3, 1	#++used3;
			addi $t7, $t7, 1	#++hopPtr3;
endI9:                       
			addi $t6, $t4, 1	#hopPtr11 = hopPtr1 + 1;
			la $t0, a1
			sll $v1, $t1, 2
			add $t0, $t0, $v1	#target = a1 + used1;
			j FTest4		#goto FTest4;
begF4:
			lw $v1, 0($t6)
			sw $v1, -4($t6)		#*(hopPtr11 - 1) = *hopPtr11;
			addi $t6, $t6, 1	#++hopPtr11;
FTest4:
			bltu $t6, $t0, begF4	#if (hopPtr11 < endPtr11) goto begF4;
endF4:
			addi $t1, $t1, -1	#--used1;
			addi $a1, $a1, -4	#--endPtr1;
			addi $t4, $t4, -4	#--hopPtr1;
endI8:
			addi $t4, $t4, 1	#++hopPtr1;
FTest3:
			bltu $t4, $a1, begF3	#if (hopPtr1 < endPtr1) goto begF3;
endF3:
			bnez $t1, endI10	#if (used1 != 0) goto endI10;
begI10:
			la $t9, a1		#*(a1+ 0) = truncAvg;
			addi $t1, $t1, 1	#++used1;
endI10:
endI7:
			j endI3			#goto endI3;
else3:
			la $t4, a1		#hopPtr1 = a1;
			li $v0, 4
			la $a0, am1dA1Str
			syscall			#cout << am1dA1Str;
			li $v0, 1
			lw $a0, 0($t4)
			syscall			#cout << *hopPtr1;
			li $t2, 0		#used2 = 0;
			li $t3, 0		#used3 = 0;
endI3:
			li $v0, 4
			la $a0, procA1Str
			syscall			#cout << procA1Str;
			blez $t1, endI11	#if (used1 <= 0) goto endI11;
begI11:
			la $t4, a1		#hopPtr1 = a1;
                     	sll $v1, $t1, 2
			add $a1, $t4, $v1	#endPtr1 = a1 + used1;
begDW4:
			li $v0, 1
			lw $a0, 0($t4)
			syscall
			li $v0, 11
			li, $a0, ' '
			syscall
			li $v0, 11
			li, $a0, ' '
			syscall			#cout << *hopPtr1 << ' ' << ' ';
			addi $t4, $t4, 4	#++hopPtr1;
endDW4:
DWTest4:
			bltu $t4, $a1, begDW4	#if (hopPtr1 < endPtr1) goto begDW4;
endI11:
			li $v0, 4
			la $a0, procA2Str
			syscall			#cout << procA2Str;
			blez $t2, endI12	#if (used2 <= 0) goto endI12;
begI12:
			la $t5, a2		#hopPtr2 = a2;
                     	sll $v1, $t2, 2
			add $a2, $t5, $v1	#endPtr2 = a2 + used2;
begDW5:
			li $v0, 1
			lw $a0, 0($t5)
			syscall
			li $v0, 11
			li, $a0, ' '
			syscall
			li $v0, 11
			li, $a0, ' '
			syscall			#cout << *hopPtr2 << ' ' << ' ';
			addi $t5, $t5, 4	#++hopPtr2;
endDW5:
DWTest5:
			bltu $t5, $a2, begDW1	#if (hopPtr2 < endPtr2) goto begDW5;
endI12:
			li $v0, 4
			la $a0, procA3Str
			syscall			#cout << procA3Str;
			blez $t3, endI13	#if (used3 <= 0) goto endI13;
begI13:
			la $t7, a3		#hopPtr3 = a3;
                     	sll $v1, $t3, 2
			add $a3, $t7, $v1	#endPtr3 = a3 + used3;
begDW6:
			li $v0, 1
			lw $a0, 0($t7)
			syscall
			li $v0, 11
			li, $a0, ' '
			syscall
			li $v0, 11
			li, $a0, ' '
			syscall			#cout << *hopPtr3 << ' ' << ' ';
			addi $t7, $t7, 4	#++hopPtr3;
endDW6:
DWTest6:
			bltu $t7, $a3, begDW6	#if (hopPtr3 < endPtr3) goto begDW6;
endI13:
			li $v0, 4
			la $a0, dacStr		#cout << dacStr;
			li $v0, 12
			move $a0, $t8
			syscall			#cin >> reply;
WTest1:
			li $v1, 'n'
			beq $t8, $v1, xitW1	#if (reply == 'n') goto xitW1;
			li $v1, 'N'
			bne $t8, $v1, begW1	#if (reply != 'N') goto begW1;
endW1:
xitW1:			li $v0, 4
			la $a0, d1Str
			syscall			#cout << d1Str << '\n';
			li $v0, 4
			la $a0, byeStr
			syscall			#cout << byeStr << '\n';
			li $v0, 4
			la $a0, d1Str
			syscall			#cout << d1Str << '\n';
			
			li $v0, 10		# graceful exit
			syscall
