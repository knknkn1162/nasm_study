section .data
  chr db 56
  newline db 10

section .text
  global _start

_start:
  mov rdi, chr
  call print_char
  call print_newline
  call exit

print_char:
  mov rax, 1
  mov rsi, rdi
  mov rdi, 1
  mov rdx, 1
  syscall
  ret

print_newline:
  mov rax, 1
  mov rdi, 1
  mov rdx, 1
  mov rsi, newline
  syscall
  ret

exit:
  mov rax, 60
  mov rdi, 0
  syscall
  ret
