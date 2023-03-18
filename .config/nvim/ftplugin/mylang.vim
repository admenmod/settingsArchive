if exists('b:current_syntax')
  finish
endif

syntax match mylangIf "\<if\>" contained
syntax match mylangElse "\<else\>" contained
highlight link mylangIf Keyword
highlight link mylangElse Keyword
