section .data
  hello_world db "Hello world!", 10
  ; See also https://www.tutorialspoint.com/assembly_programming/assembly_strings.htm
  hello_world_len equ $ - hello_world ; $(points to the byte after the last character of the string variable msg. ) - hello_world

section .text
  global _start

_start:
  call print_hello
  call exit

print_hello:
  mov rax, 1
  mov rdi, 1
  mov rsi, hello_world
  mov rdx, hello_world_len
  syscall
  ret

exit:
  mov rax, 60
  mov rdi, 0
  syscall
