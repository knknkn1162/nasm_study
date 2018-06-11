section .data
  name: db 'Zara ali', 10
  name_len: equ $-name

section .text
  global _start

_start:
  mov rax, 1
  mov rsi, name
  mov rdx, name_len
  syscall

  mov [name], dword 'Nura'

  mov rax, 1
  mov rsi, name
  mov rdx, name_len
  syscall
  call exit

exit:
  mov rax, 60
  mov rdi, 0
  syscall
  ret
