section .data
  msg: db 'Displaying 9 stars', 10
  len: equ $ - msg
  s2 times 9 db '*'

section .text
  global _start

_start:
  mov rax, 1
  mov rdi, 1
  mov rsi, msg
  mov rdx, len
  syscall

  mov rax, 1
  mov rdi, 1
  mov rsi, s2
  mov rdx, 9
  syscall
  call exit


exit:
  mov rax, 60
  mov rdi, 0
  syscall
  ret
