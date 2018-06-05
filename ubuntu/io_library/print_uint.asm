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
  mov rdx, 0 ; we must initialize rdx. without this, segmentation fault occurs
  div rcx ;rax:rdx
  add rdx, 48
  mov [r8], dl
  inc r8 ; increment address
  cmp rax, 0
  jne .loop
.print:
  mov rax, 1
  mov rdx, 1 ;count
  mov rdi, 1
  mov rsi, r8
.print_loop:
  syscall
  cmp rsi, str
  je .end
  dec rsi ; decrement address
  jmp .print_loop
.end:
  ret
 


exit:
  mov rax, 60
  mov rdi, 0
  syscall
  ret
