section .data
  digit db 0, 10 ; little endian

section .text
  global _start

_start:
  push 4
  push 8
  push 3
  pop rax
  call _printREXDigit
  pop rax
  call _printREXDigit
  pop rax
  call _printREXDigit
  call exit

_printREXDigit:
  add rax, 48
  mov [digit], al
  mov rax, 1
  mov rdi, 1
  mov rsi, digit
  mov rdx, 2
  syscall
  ret

exit:
  mov rax, 60
  mov rdi, 0
  syscall
  ret
