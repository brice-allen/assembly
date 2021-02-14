;{Name: Brice Allen}
;{id: *****2188}
;{CSCI-2515}
;{Homework 2}


INCLUDE Irvine32.inc


;{ PART 1: Write a single statement that computes the product i = 3 to i = 8. | 3*4*5*6*7*7 = 20160d || 4EC0h }
.data

constant_variable_sum word [3*4*5*6*7*8] ;{ = 4EC0h = 4 nibbles = 16 bit = 1 word}

.code
main PROC
xor eax, eax ;{ Clear register.}
mov ax, 3*4*5*6*7*8 ;{Part 1 requirement.}
call dumpregs ;{ Display results. }

;{Or Using a variable from data.} 
xor eax, eax ;{ Clear register.}
mov ax, constant_variable_sum
call dumpregs

;{ Part 2.1: Write a small block of computational statements that causes the EBX register to set the carry flag. DO NOT USE STC. }
.data

.code
xor ebx, ebx ;{ Clear register.}
mov bx, 0aaaah ;{ Store 0aaaah in bx register. }
adc bx, bx ;{ Part 2.1 requirement: Adding 0aaaah to 0aaaah results in 15554h and sets the overflow flag to 1. }
call dumpregs  ;{ Verify flag is set to one. }


;{ Part 2.2: Write a short block of computational statements that causes the ECX register to set the overflow flag. }
.data

.code
test ecx, ecx ; { Reset overflow flag. } 
call dumpregs ;{ Verify overflow equals 0. }
xor ecx, ecx ;{ Clear register.}
mov cx, 0aaaah ;{ Store 0aaaah in cx register. }
add cx, cx ;{ Part 2.1 requirement: Adding 0aaaah to 0aaaah results in 15554h and sets the overflow flag to 1. }
call dumpregs ;{ Verify flag is set to one. }


;{ Part 3: Using directives for creating symbolics, write a signle statement that computes the number of seconds in a day. }
	;{Specifications:}
		;{ a. Place the result in the EDX register. }
		;{ b. The statement that is placed in the program and expanded is to be SECONDS_IN_DAY. }
		;{ c. The EDX register should be zeroed out before it is used. }
		;{ d. Make sure the statement uses the symbolics to the fullest extent; that is, SECONDS_IN_DAY will be the only expression. }
			;{ on the instruction line. No other mnemonics, or opperands just SECONDS_IN_DAY. }
.data
SECONDS_IN_DAY dword [60 * 60 * 24] ;{ 60*60*24 = 86400d = 15180h = 5 nibbles = 20 bits = 1 dword}

.code
xor edx, edx ;{ Clear register.}
mov edx, SECONDS_IN_DAY
call dumpregs

	exit
main ENDP
END main