;   Hafsa Tayyab
;   23-NTU-CS-1163
;   Lab-10 HomeTask-3

;   Write an assembly program to find the sum of all even numbers in an array.

include irvine32.inc 
.data 
    array WORD 1,2,3,4,5,6,7
    sum WORD 0
    count WORD 0
    msg1 db "Sum : ",0
    msg2 db "No. of elements : ",0
.code 
main proc 
    mov esi,OFFSET array                ; Passing Address of array
    mov ecx,LENGTHOF array              ; Loop Counter
    mov eax,0
LoopAllElements: 
    mov ax, WORD PTR [esi]              ; Using 2-byte data for testing.
    test ax, 1h                         ; If this test results in 0, then the number is even.                     
    jnz skipAddition                    ; Otherwise it's not and we'll skip addition and counting.      
    add sum,ax                          ; Adding even number to the sum.
    add count,1                         ; Count the number.
skipAddition:
    add esi,TYPE array                  ; Incrementing to next value
    loop LoopAllElements                ; Loop until all numbers have been tested
    call crlf

; Display message with sum

    mov edx, OFFSET msg1
    call writestring
    movsx eax,sum                       ; Displaying sum
    call writedec
    call crlf

; Display message with count

    mov edx, OFFSET msg2
    call writestring
    movsx eax,count                     ; Displaying no. of positive numbers
    call writedec
    call crlf 
    call crlf
exit
main endp 
end main 