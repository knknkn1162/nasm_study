section .text
global string_equals

; accepts two pointers to strings and compares them. Returns 1 if they are equal otherwise 0
;rdi .. The pointer to the first string
;rsi .. The pointer to the second string
;rax .. 1(True) or False(0)
string_equals:
  xor rax, rax
.loop:
  cmp [dil], [sil]
  jne .false
  cmp rdi, 0
  jmp .true
  inc rdi
  inc rsi
  jmp .loop
.false:
  mov rax, 0
  ret
.true:
  mov rax, 1
  ret
