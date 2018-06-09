; nasm -f elf64 lib.asm
; nasm -f elf64 test.asm
; ld -o res test.o lib.o
; ./res
extern string_equals

section .rodata
  str1: db 'abcd', 0
  str2: db 'abcd', 0

section .text
  global _start

_start:
  mov rdi, str1
  mov rsi, str2
  call string_equals
  add al, 48 ; stringify
  mov bl, al
  mov rax, 0
  mov rsi, [rbx]
  mov rdi, 1
  syscall
  call exit

exit:
  mov rax, 60
  mov rdi, 0
  syscall
  ret
