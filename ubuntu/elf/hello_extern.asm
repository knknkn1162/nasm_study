extern print_hello
extern exit

section .text
  global _start

_start:
  call print_hello
  call exit
