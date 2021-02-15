title HWK_2_allen.asm


;{Name: Brice Allen}
;{id: *****2188}
;{CSCI-2515}
;{Homework 2}


include Irvine32.inc
;{ MACROS } 
;{ Fix typo }
move textequ <mov>
;{ Clear registers }
cleareax textequ <mov eax, 0d> 
clearebx textequ <mov ebx, 0d>
clearecx textequ <mov ecx, 0d>
clearedx textequ <mov edx, 0d>


;{ PART 1: Write a single statement that computes the product i = 3 to i = 8. | 3*4*5*6*7*7 = 20160d || 4EC0h }
.data
constant_variable_sum equ 3*4*5*6*7*8 ;{ 21600d = 4EC0h = 4 nibbles = 16 bit = 1 word}

.code
main proc
cleareax ;{ Clear register.}
call dumpregs ;{ Display results. }
mov eax, constant_variable_sum ;{ Store variable in the lower 16 bits of the accumulator register. }
call dumpregs ;{ Display results. }

;{ ****** or ******** for truly one line. }
cleareax ;{ Clear register.}
call dumpregs ;{ Display results. }
mov eax, 3*4*5*6*7*8 ;{ Store variable in the lower 16 bits of the accumulator register. }
call dumpregs ;{ Display results. }


;{ Part 2.1: Write a small block of computational statements that causes the EBX register to set the carry flag. DO NOT USE STC. }
.data
bin_storage dw 0ffffffffh 
.code
clearebx ;{ Clear register.}
mov bx, bin_storage ;{ Store 0ffffffffh in bx register. }
adc bx, bx ;{ Part 2.1 requirement: Adding 0ffffffffh to 0ffffffffh results in 1FFFFFFFEh and sets the carry flag to 1. }
call dumpregs  ;{ Verify flag is set to one. }


;{ Part 2.2: Write a short block of computational statements that causes the ECX register to set the overflow flag. }
.data

.code
test ecx, ecx ; { Reset overflow flag. } 
call dumpregs ;{ Verify overflow equals zero. }
clearecx ;{ Clear register.}
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
second_storage equ 60*60*24 ;{ 60*60*24 = 86400d = 15180h = 5 nibbles = 20 bits = 1 dword needed }
SECONDS_IN_DAY textequ <mov edx, second_storage>

.code
clearedx ;{ Clear register.}
SECONDS_IN_DAY
call dumpregs ;{ Display results. }

;{ Part 4: Calculate A = (A-B) +(C-D). Where A=38d, B=00101001b, C=A5h, and D=85d. }
	;{Specifications:}
		;{ a. You must ensure your registers are cleared before starting this part. }
		;{ b.Ensure that you are using registers (or parts of registers) of the appropriate size. }
		;{ c. You will calculate this in the following manner. }
			;{ A-B }
			;{ C-D }
			;{ (A-B)+(C-D) }
		;{ d. There are no memory to memory operations. You will have to use registers as necessary to accomplish this. }
		;{ e. You must declare 4 DWORD variables to hold the values given above. }
		;{ f. After the result is stored in A, put the result in EAX. }
		;{ g. After the result is in EAX, type the following line of code in your program: Call WriteInt }

.data
;{ I converted the numbers to hexadecimal INT32 - little-endian (DCBA). }
a_storage dw 00000026h
b_storage dw 00000029h
c_storage dw 000000a5h
d_storage dw 00000055h



.code
cleareax 
clearebx
mov ax, a_storage
sub ax, b_storage ;{ 0000fffdh }
mov bx, c_storage
sub bx, d_storage ;{ 00000050h }
add ax, bx

mov a_storage, ax
call writeint




	exit
main ENDP
END main
