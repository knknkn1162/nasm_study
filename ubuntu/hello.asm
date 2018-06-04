; global, section, db are directives which control the translation process.
section .data ; hold global variables
  text db "hello world", 10 ; db: create byte data
  ex2 times 5 db 49 ; store "11111" string

section .text ; hold instructions
  global _start
; labels: just readable names and addresses
_start: ; entry point
  mov rax, 1
  mov rdi, 1
  mov rsi, text
  mov rdx, 13
  syscall
  mov rax, 1
  mov rdi, 1
  mov rsi, ex2
  mov rdx, 5
  syscall

  mov rax, 60 ; exit
  mov rdi, 0
  syscall
