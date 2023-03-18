highlight tsVart cterm=italic gui=italic guifg=#FF1493 ctermfg=Magenta

syntax match styledEmmetAbbreviation /[a-z0-9#+!%]\+/ containedin=styledDefinition contains=tsVart

" syntax match tsVart /\<public\>/ priority=10 containedin=styledDefinition

" syntax match tsVariableDeclaration /\v^\s*\w+\s*:\s*\w+\s*=/ containedin=tsBlock
" syntax region tsBlock start=/{/ end=/}/ contains=ALL tsVart
"
" как указать что какое то правило преоритетнее других
