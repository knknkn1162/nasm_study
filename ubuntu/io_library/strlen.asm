section .data
  text1 db 'asdkbasdka', 0
  text2 db 'qwe qweqe qe', 0
  text3 db '', 0

section .text
  global _start

_start:
  mov rdi, text1
  call strlen

  mov rdi, rax
  call exit

; accepts from rdi and return strlen with rax
strlen:
  xor rax, rax
.loop:
  cmp byte[rdi+rax], 0
  je .end
  inc rax
  jmp .loop
.end:
  ret

exit:
  mov rax, 60
  mov rdi, 0
  syscall
  ret
