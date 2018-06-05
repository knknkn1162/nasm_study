section .bss
  str: resb 100

section .text
  global _start

_start:
  mov rdi, 356
  call print_uint
  call exit

print_uint:
  mov rsi, rsi ; increment count
  mov rax, rdi
  mov rcx, 10
.loop:
  div rcx ;rax:rdx
  add rdx, 48
  mov [str+rsi], dl
  inc rsi
  cmp rax, 0
  je .print
  mov rdx, 0
  jmp .loop
.print:
  ; print_char
  mov rax, 1
  mov rdi, 1
  mov rdx, rsi
  mov rsi, str
  syscall
  ret
  


exit:
  mov rax, 60
  mov rdi, 0
  syscall
  ret
