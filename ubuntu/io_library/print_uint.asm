section .bss
  str: resb 100

section .text
  global _start

_start:
  mov rdi, 3506
  call print_uint
  call exit

print_uint:
  mov r8, str ; store the str pointer
  mov rax, rdi
  mov rcx, 10
  mov rbx, rsp
.loop:
  div rcx ;rax:rdx
  add rdx, 48
  mov [r8], dl
  inc r8 ; increment address
  cmp rax, 0
  je .print
  mov rdx, 0
  jmp .loop
.print:
  mov rax, 1
  mov rdx, 1 ;count
  mov rdi, 1
.print_loop:
  mov rsi, r8
  syscall
  cmp r8, str
  je .end
  dec r8
  jmp .print_loop
.end:
  ret
 


exit:
  mov rax, 60
  mov rdi, 0
  syscall
  ret
