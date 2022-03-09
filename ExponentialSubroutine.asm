
section .bss
    squaredVal resb 4
    inputVal resb 4
    power resb 4
    
section .data

section .text
    global _start
 
_start:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;start of routine
 
input: 
    mov esi, 5 ; exponent 
    
    mov edi, 2 ; n
    
    
    cmp esi, 0 ;checks if the exponent is either a 0 or 1 
    je exp_zero
    cmp esi, 1
    je exp_one
    
    dec esi
    mov [power], esi
    mov [inputVal], edi 
    mov [squaredVal], edi ; squaredVal is the output
    
    
square_loop:

    mov eax, [inputVal] 
    mov edx, [squaredVal] ; edx is multiplied by eax
    mul edx, 
    
    mov[squaredVal], eax 
    
    dec esi
    cmp esi, 0
    jg square_loop
    jmp exit_loop
    
exp_zero: 
    mov edi, 1
    mov [squaredVal], edi ;x^0 = 1
    jmp exit_loop
exp_one: 
    mov [squaredVal], edi ;x^1 = x 
    jmp exit_loop
    
exit_loop: 
    
    ; [squaredVal] is the output
    ; mov eax, [squaredVal] 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;end of routine 
 
 exit:
    mov eax, 1 ;; prep system exit call
    mov ebx, 0 ; return 0
    int 0x80 ; system call 
    