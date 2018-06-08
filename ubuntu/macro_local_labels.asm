%macro mymacro 0
%%labelname:
%%labelname:
%endmacro

; expand to `..@0.labelname:`
mymacro
; expand to `..@1.labelname:`
mymacro
; expand to `..@2.labelname:`
mymacro
