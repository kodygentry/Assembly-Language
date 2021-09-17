# Kody Gentry, CS2318.03 Assignment 2 Part 1 Program A				
# A program that takes 3 inputs from user and displays them back				
				
				.data	
intPrompt:		.asciiz "Enter an integer: "		
intLabel:		.asciiz "The integer you entered is: "		
stringPrompt:	.asciiz "Enter a string of characters: "		
string:			.space 51	
stringLabel:	.asciiz "The string you entered is: "		
charPrompt:		.asciiz "Enter a single character: "		
char:			.space 9	
charLabel:		.asciiz "The character you entered is: "		
				
			.text	
			.globl main	
main:				
			li $v0, 4	# int prompt (print string)
			la $a0, intPrompt	
			syscall	
				
			li $v0, 5	# read int
			syscall	
				
			move $t0, $v0	# int label (print string)
			li $v0, 4	
			la $a0, intLabel	
			syscall	
				
			li $v0, 1	# print int
			move $a0, $t0	
			syscall	
				
			li $v0, 11	# print endl
			li $a0, '\n'	
			syscall	
				
			li $v0, 4	# string prompt (print string)
			la $a0, stringPrompt	
			syscall	
				
			li $v0, 8	# read string
			la $a0, string	
			li $a1, 51	
			syscall	
				
			move $t0, $v0	# string label (print string)
			li $v0, 4	
			la $a0, stringLabel	
			syscall	
				
			li $v0, 4	# print string
			la $a0, string	
			syscall	
				
			li $v0, 4	# char prompt (print string)
			la $a0, charPrompt	
			syscall	
				
			li $v0,12	# read char
			syscall	
			move $t0, $v0	
				
			li $v0, 11	# print endl
			li $a0, '\n'	
			syscall	
				
			li $v0, 4	# char label (print string)
			la $a0, charLabel	
			syscall	
				
			li $v0, 11	# print char
			move $a0, $t0	
			syscall	
				
			li $v0, 10	# graceful exit
			syscall	
