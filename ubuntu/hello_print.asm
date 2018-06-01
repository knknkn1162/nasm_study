section .data
  text db "hello world", 10, 0
  text2 db "World?", 10, 0

section .text
  global _start
_start:
  mov rax, text
  call _print

  mov rax, text2
  call _print

  mov rax, 60 ; exit
  mov rdi, 0
  syscall


_print:
  push rax ; push text data
  mov rbx, 0
_printLoop:
  inc rax ; increment pointer to rax
  inc rbx ; increment 0
  mov cl, [rax]
  cmp cl, 0
  jne _printLoop

  mov rax, 1 ; write
  mov rdi, 1 ; stdout
  pop rsi ; retrieve text data
  mov rdx, rbx ;count
  syscall
  ret
