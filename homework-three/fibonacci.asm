title fibonacci.asm
COMMENT*
		Name	   : Brice Allen
		ID         : 107452188
		Class	   : CSCI 2525
		Assignment : PA3.2
		Due Date   : March 1, 2021
*

include Irvine32.inc;/* inlcude dependencies */

move equ <mov>;/* macro to replace typo move with MOV*/



exitProcess proto, dwexitcode: dword


.data
;/* macros to clear registers */
cleareax textequ <mov eax, 0>
clearebx textequ <mov ebx, 0>
clearecx textequ <mov ecx, 0>
clearedx textequ <mov edx, 0>
clearesi textequ <mov esi, 0>
clearedi textequ <mov edi, 0>
fibstart byte 0,1,1
fib byte 9 DUP(?)
position dword 2
displaycount byte 9
loopcount dword 7
.code

main proc
CALL DumpRegs;/* Display registers function call from irvine32 prior to clearing */
;/* Call functions to clear registers */
clearEAX;/* Extended Accumulator, Math */
clearEBX;/* Pointer to Data */
clearECX;/* Counter */
clearEDX;/* I/O Pointer */
clearESI;/* Source Index Data Pointer */
clearEDI;/* Destination Index Data Pointer */

comment* 
Set up esi to the beginning address of the array 'fib'
set cx to the number of units in the array.
set bx to the type of the array.
*
mov esi, offset fib
mov cx, lengthof fib
mov bx, type fib
call dumpmem
comment*
move the first three elements from fibstart into the fib array
*
mov al, fibstart
mov fib, al;{0}
mov al, [fibstart + 1]
mov [fib+1], al;{1}
mov al, [fibstart + 2]
mov [fib+2], al;{1}

;{ pre-loop setup: ecx == seven }
mov ecx, loopcount
looper:;{ loop to calc fib numbers. }
mov esi, offset fib;{ point to beginning of array }
add esi, position;{ add two to get to the correct element }
mov al, [esi];{ dereferenced esi copied to al }
dec esi ;{ --esi }
mov dl, [esi];{ defeferenced esi copied to dl }
add al, dl;{ sum al and dl }
add esi, 2;{ esi +=2 }
mov [esi], al;{ dereference esi and copy al }
inc position;{ ++positioncount }
loop looper;{ loop looper until ecx = 0 which breaks the loop }

comment* 
Set up esi to the beginning address of the array 'fib'
set cx to the number of units in the array.
set bx to the type of the array.
*
mov esi, offset fib
mov cx, lengthof fib
mov bx, type fib
call dumpmem
;{ override size of fib allowing to move all four bytes at once in reverse order  }
mov ebx, dword ptr [fib+4]
;{ call dumpregs to show 0D080503 in ebx }
call dumpregs

invoke	exitprocess, 0

main endp
end main 