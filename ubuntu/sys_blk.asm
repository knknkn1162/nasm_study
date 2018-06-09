section .data
  msg: db "Allocated 16 kb of memory!", 10
  len: equ $ - msg

section .text
  global _start

_start:
  mov rax, 12 ; sysblk
  xor rdi, rdi
  syscall ; return `0x601000`; the current setting of the program stack

  add rax, 16384 ; 16K-byte reserved
  mov rdi, rax
  mov rax, 12 ; sysblk
  syscall ; return `0x605000`.

  ; check errno
  cmp rax, 0
  jl exit

  call exit

exit:
  mov rax, 60
  mov rdi, 0
  syscall
  ret
