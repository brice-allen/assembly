title reorder.asm

comment*
        Name       : Brice Allen
        ID         : XXXXX2188
        Class      : CSCI 2525
        Assignment : Homework three
        Due Date   : March 1, 2021
      *

;{ include dependencies. }
include Irvine32.inc
swapgs proto, pvalx:ptr dword, pvaly:ptr dword
;{ macro to replace typo move with MOV. }
move equ <mov>
;{ exit process from irvine example. syntax label proto[distance][language type][, [param]:tag] }
exitprocess proto, dwexitcode: dword

.data
;{ macros to set registers to zero }
cleareax textequ <mov eax, 0>
clearebx textequ <mov ebx, 0>
clearecx textequ <mov ecx, 0>

;{ declare and initialize array with given elements in given order. }
intstorage dword 4567h,  2348h, 3338h

.code
;------------------------------main procedure------------------------------------------------

main proc
;{ Call functions to clear registers eax, ebc, and ecx. }
cleareax
clearebx
clearecx
;{ set esi to the addresss of the beginning of the array 'intstorage' }
mov esi, offset intstorage
;{ set counter register to length of the array  }
mov ecx, lengthof intstorage 
;{ set ebx to the type(size in bytes) of the array four for dword }
mov ebx, TYPE intstorage
call dumpmem ;{ from irvine }
;{ load each word into a register + four bytes to increment to the next index. }
mov eax, [esi+4]
mov ebx, [esi+8]
mov ecx, [esi]
;{ exchange each register with index in array. + four bytes to get to the next dword. }
xchg eax, [esi]
xchg ebx, [esi+4]
xchg ecx, [esi+8]
;{ set counter register to length of the array.  }
mov ecx, lengthof intstorage 
;{ set ebx to the type(size in bytes) of the array four in our case. }
mov ebx, TYPE intstorage
call dumpmem
;{ from book example }
invoke	exitprocess, 0


main endp



end main
