section .text
  global _start

_start:
  mov rax, 1
  call incRax
  cmp rax, 2
  je exit


incRax:
  inc rax
  ret

exit:
  mov rax, 60
  mov rdi, 0
  syscall
  ret
