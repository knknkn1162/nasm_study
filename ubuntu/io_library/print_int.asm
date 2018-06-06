section .bss
  num resb 50

section .text
  global _start


_start:
  mov rdi, -79
  call print_int
  call exit

print_int:
  ret

exit:
  mov rax, 60
  mov rdi, 0
  syscall
  ret
