%define cat_count 42

mov rax, cat_count

%macro dq_three 3 ; arity
dq %1
dq %2
dq %3
%endmacro

dq_three 666, 555, 444

BITS 64
%define x 5

%if x == 10
mov rax, 100
%elif x == 15
mov rax, 115
%elif x == 20
mov rax, 0
%else
mov rax, rbx
%endif


%ifdef flag
hellostring: db "Hello", 0
%endif
