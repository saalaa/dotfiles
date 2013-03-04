hi clear

set background=dark
if version > 580
  " no guarantees for version 5.8 and below, but this makes it stop
  " complaining
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif
let g:colors_name="parisinlove"

hi Normal           guifg=#E6E5DF  guibg=#323232
hi NonText          guifg=#444455  guibg=#303030

hi CursorLine       guifg=NONE      guibg=#3E4457
hi CursorColumn     guifg=NONE      guibg=#3E4457
hi Cursor		        guifg=#ffffff    guibg=#8798EE
" hi LineNr           guifg=#444455  guibg=#303030
hi LineNr           guifg=#555566  guibg=#363636
" hi VertSplit      	guifg=#43495C guibg=#43495C gui=NONE
" hi StatusLine       guifg=#D3E7F1 guibg=#43495C gui=NONE
" hi StatusLineNC     guifg=#2E2F44 guibg=#43495C gui=NONE
hi VertSplit      	guifg=#353533 guibg=#353535 gui=NONE
hi StatusLine    guifg=#bbbbbb  guibg=#353535  gui=none
hi StatusLineNC  guifg=#777777  guibg=#353535  gui=none

hi Folded		        guifg=#657794 guibg=NONE gui=NONE
hi FoldeColumn      guifg=#657794 guibg=NONE gui=NONE
hi vimFold		      guibg=#657794 guifg=NONE gui=NONE
hi SpecialKey     	guifg=#8ae234                        " not edited!
hi Title	        	guifg=#ef5939                        " not edited!
hi WarningMsg	      guifg=#ef5939                        " not edited!

hi ModeMsg       		guifg=#fce94f " not edited!
" hi Visual		        guifg=#f3f3f3 guibg=#766EA2
" hi Visual		        guifg=#f3f3f3 guibg=#69A4D4 gui=NONE 
hi Visual		        guifg=#f3f3f3 guibg=#81B0D6 gui=NONE 
" hi Visual		        guifg=#ffffff guibg=#8387C0 gui=NONE 
" hi Visual		        guifg=#ffffff guibg=#8398CF gui=NONE 
hi IncSearch	      guifg=#39ADDB guibg=#ffffff
hi Search		        guifg=#C2DFEE guibg=#505779
hi MatchParen	      guifg=#CE5EEB guibg=NONE

hi WildMenu         guifg=#3F4361 guibg=#31C8EE gui=NONE
hi Pmenu            guifg=#C8D4DD guibg=#687192
hi PmenuSel         guifg=#ffffff guibg=#818FC0
hi PmenuSbar        guifg=#5bcbee guibg=#4d5770
hi PmenuThumb       guifg=#778bbd guibg=#778bbd
" hi WildMenu         guifg=#3F4361 guibg=#31C8EE gui=NONE
" hi Pmenu            guifg=#C5A4BC guibg=#3F2335
" hi PmenuSel         guifg=#ffffff guibg=#745067
" hi PmenuSbar        guifg=#745067 guibg=#79546B
" hi PmenuThumb       guifg=#ffffff guibg=#ffffff

hi DiffAdd          guifg=#ffcc7f guibg=#a67429 gui=NONE " not edited!
hi DiffChange       guifg=#7fbdff guibg=#425c78 gui=NONE " not edited!
hi DiffText         guifg=#8ae234 guibg=#4e9a06 gui=NONE " not edited!
hi DiffDelete       guifg=#ff0000 guibg=#000000 gui=NONE " not edited!

hi Directory        guifg=#31C8EE

" tabs (non gui)
hi TabLine      		guifg=#A3A3A3 guibg=#202020 gui=NONE
hi TabLineFill	    guifg=#535353 guibg=#202020 gui=NONE
hi TabLineSel	      guifg=#FFFFFF gui=bold

hi Comment          guifg=#61615F
hi Constant		      guifg=#C2BAF0 " self, ...
" hi String		        guifg=#D8D875
hi String		        guifg=#daa342
" hi Special		      guifg=#D8D875 " -> ", '...
hi Special		      guifg=#daa342 " -> ", '...

hi Number           guifg=#AD8EE2
hi Operator         guifg=#7983B1
hi Identifier	      guifg=#4BB8DA gui=NONE " variables, ...
hi Statement	      guifg=#818BB8 gui=NONE " begin, if, ...
hi PreProc          guifg=#818BB8 gui=NONE " def, ...
hi Type       			guifg=#80D17F gui=NONE " class name, SignalException, constante
" hi Function		      guifg=#ECA952          " methods name
" hi Function         guifg=#fdc87e
hi Function         guifg=#EB507C
hi Todo			        guifg=#7C7C71 guibg=#252525 gui=italic

hi rubyInterpolation guifg=#F0B651
" hi rubyInterpolation guifg=#F1C579
hi htmlTag			     guifg=#7CDBDB
" hi htmlTag			     guifg=#7efafb
hi link Braces Operator

hi NERDTreePart       guifg=#494D58
hi NERDTreeOpenable   guifg=#cdeaf9
hi NERDTreeFile       guifg=#cdeaf9
hi link NERDTreeExecFile Special
hi link NERDTreePartFile NERDTreePart
hi link NERDTreeClosable NERDTreePart
hi link rubyInterpolationDelimiter rubyInterpolation
hi link cppSTL Function
hi link Error	Todo
hi link Character	Number
hi link rubySymbol Number
hi link htmlTagName htmlTag
hi link htmlEndTag htmlTag
hi link htmlLink Underlined
hi link pythonFunction Identifier
hi link Question Type
hi link CursorIM Cursor
hi link VisualNOS Visual
hi link xmlTag Identifier
hi link xmlTagName Identifier
hi link shDeref Identifier
hi link shVariable Function
hi link rubySharpBang	Special
hi link perlSharpBang	Special
hi link schemeFunc Statement

