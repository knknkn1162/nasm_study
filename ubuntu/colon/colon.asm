%define lw 0

%macro colon 2
%%lw: dq lw
db %1, 0
xt_ %+ %2: ; concatinate xt_ and %2

%define lw %%lw
%endmacro
