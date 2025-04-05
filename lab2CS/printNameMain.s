# Program Name: printNameMain
# Author: Ayaaz M.
# Date: 3/20/2025
# Purpose: To read and display a string
# Input:
# - input: Username
# Output:
# - format: Prints the greeting string

.text
.global main

main:
	// Save return to OS on stack
	SUB sp, sp, #4	// Allocate space on the stack
	STR lr, [sp, #0]	// Save the return address

	// Prompt for an input
	LDR r0, =prompt	// Load address of input into r0
	BL printf	// Call printf to display the prompt

	// Read user input using scanf
	LDR r0, =input	// Set r0 to the address of input (format string)
	LDR r1, =name	// Set r1 to the address of name where we are going to store the input
	BL scanf	// Call scanf to print the greeting message

	// Print the greeting message
	LDR r0, =format	// Load address of formatted output string
	LDR r1, =name	// Load address of stored name
	BL printf	// Call printf to print the greeting message

	// Restore the stack and return to OS
	LDR lr, [sp, #0]	// Restore the saved link register
	ADD sp, sp, #4		// Deallocate stack space
	MOV pc, lr		// Return to OS

.data
prompt: .asciz "Enter your name: " // Prompt message
input: .asciz "%s" // Format string
format: .asciz "Hello %s, how are you today?\n" // Greeting message with insertion
name: .space 40 // Reserve 40 bytes of memory for storing input string
