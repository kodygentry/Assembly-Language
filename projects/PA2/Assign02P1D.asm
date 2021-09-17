##########################################################################
# Kody Gentry, CS 2318-003, Assignment 2 Part 1 Program D
##########################################################################
# Program that prompts the user to enter the integer scores for Exam 1, 
# Exam 2 and Final Exam, read the scores, compute the weighted avg score 
# (using the following formula), and display a labeled output about
# the weighted avg score. 
# Score = e1(128/637)+e2(307/1024)+fiinal/2
#########################################################################
			.data
ex1Prompt:		.asciiz "Enter exam 1 score: "
ex2Prompt:		.asciiz "Enter exam 2 score: "
finalPrompt:		.asciiz "Enter final score: "		
avg:			.asciiz "The avg score is: "
############################ data segment ################################
			.text
			.globl main
main:
			li $v0, 4		# prompt for exam 1
			la $a0, ex1Prompt	
			syscall
			li $v0, 5		# read in exam 1
			syscall	
			
			sll $t0, $v0, 7		# t0 = exam 1 * 128 (sll 7 bits)
			li $t1, 637		# t3 has 637
			divu $t0, $t1		# divide by 637
			mflo $t0		# exam1 * 128 / 637
			
			li $v0, 4		#prompt for exam 2
			la $a0, ex2Prompt
			syscall
			li $v0, 5		# read in exam 2
			syscall		
				
			move $t1, $v0		# t1 has exam 2
			li $t2, 307		# store 307 in t2
			mult $t1, $t2		# multiply by 307
			mflo $t1		# exam 2 * 307
			srl $t1, $t1, 10	# $t0 has exam2 * 307/1024 (sra 10 bits)
			
			
			li $v0, 4		# prompt final score
			la $a0, finalPrompt	
			syscall
			li $v0, 5		# read int final score
			syscall			
			
			move $t3, $v0		# t3 has final exam score
			srl $t3, $t3, 1		# final/2
			
			add $v0, $t3, $t0	# sum all three values
			add $t1, $v0, $t1
			
			li $v0, 4
			la $a0, avg		# output the avg weight
			syscall
			move $a0, $t1
			li $v0, 1
			syscall			# display avg
			
			li $v0, 10
			syscall			# exit gracefully