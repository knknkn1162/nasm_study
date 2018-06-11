global find_word
extern string_equals

section .rodata
msg_word: db "no such word", 0

section .text
; rdi = address of a null terminated word name
; rsi = address of the last word
; returns: rax = 0 if not found, otherwise address
find_word:
  xor rax, rax
.loop
  test rsi, rsi
  jz .end
  push rdi ; save all caller-saved registers you want to survive function call
  push rsi
  add rsi, 8
  call string_equals
  pop rsi ; restore caller-saved registers
  pop rdi
  test rax, rax
  jnz .found
  mov rsi, [rsi]
  jmp .loop
.found
  mov rax, rsi
.end
  ret
