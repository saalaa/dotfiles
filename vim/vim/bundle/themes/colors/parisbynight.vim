"
" Vim colour file
"
" Maintainer:  Samuel Sanchez http://pagedegeek.com
" Inspired by vydark by Vy-Shane Sin Fat <shane@node.mu>
" Version:     0.4
"
" This colour file is meant for GUI use.
"

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name="parisbynight"


hi Normal        guifg=#E6E5DF  guibg=#282828
hi Title         guifg=white
" hi Cursor        guibg=#555577  guifg=#aaaaaa
hi Cursor		        guifg=#ffffff    guibg=#8798EE
hi LineNr        guifg=#444455  guibg=#292929 "guibg=292929
" hi Visual        guibg=#555566
hi Visual		        guifg=#ffffff guibg=#8398CF gui=NONE
hi NonText       guifg=#444455  guibg=#252525 "guibg=2929292
hi StatusLine    guifg=#bbbbbb  guibg=#353535  gui=none
hi StatusLineNC  guifg=#777777  guibg=#353535  gui=none
hi VertSplit     guifg=#353535  guibg=#353535  gui=none
hi ModeMsg       guifg=#99dd99  guibg=#394439  gui=none
hi ErrorMsg      guifg=#222222  guibg=#ff8888  gui=none
hi Error         guifg=#ffaaaa  guibg=#333333  gui=none
hi Folded        guifg=#666677  guibg=#242424 


" Vim 7.x specific
if version >= 700
  hi MatchParen  guifg=#F8E40A  guibg=NONE     gui=none
  hi Pmenu       guifg=#BBBAB9  guibg=#444444  gui=none
  " hi PmenuSel    guifg=#222222  guibg=#99bbdd  gui=none
  hi PmenuSbar   guifg=#494949  guibg=#494949  gui=bold
  hi PmenuThumb  guifg=#666666  guibg=#666666  gui=bold
  " hi Pmenu            guifg=#C8D4DD guibg=#687192
  hi PmenuSel         guifg=#ffffff guibg=#818FC0
  " hi PmenuSbar        guifg=#5bcbee guibg=#4d5770
  " hi PmenuThumb       guifg=#778bbd guibg=#778bbd
  
  " hi Search      guifg=#dddd99  guibg=#444433  gui=none
  hi Search		        guifg=#C2DFEE guibg=#505779
  " hi IncSearch   guifg=#eeeeaa  guibg=#666633  gui=none
  hi IncSearch	      guifg=#39ADDB guibg=#ffffff
  hi CursorLine  guibg=#2b2c2d  gui=none
  hi ColorColumn guibg=#252525
  hi SpellBad    guisp=#774444
  hi SpellCap    guisp=#774444
  hi SpellLocal  guisp=#774444
  hi SpellRare   guisp=#774444
endif


" Syntax highlighting 
hi Comment       guifg=#53524E  gui=NONE
hi Todo          guifg=#8888aa  guibg=#303030  gui=italic
hi Operator      guifg=#bbbbbb  gui=none
hi Identifier	   guifg=#8989B3 gui=NONE " variables, ...
hi Statement	   guifg=#818BB8 gui=NONE " begin, if, ...
hi PreProc       guifg=#818BB8 gui=NONE " def, ...
hi Type          guifg=#75b0d9  gui=none            "guifg=#99bbcc  gui=none
hi Constant      guifg=#88cc99  gui=none
hi Conditional   guifg=#818BB8  gui=none " 99bbcc
hi Delimiter     guifg=#88cc99  gui=none " 99bbdd
" hi PreProc       guifg=#88ddcc  gui=none
" hi Special       guifg=#d8ac60              "guifg=#99dd99  gui=bold
hi Special		      guifg=#D8D875 " -> ", '...

" hi Keyword       guifg=#bbbbbb  gui=none
hi String        guifg=#daa342              "guifg=#88cc99  gui=italic
hi Regex         guifg=#ff0000

hi link Function        Normal
hi link Character       Constant
"hi link String          Constant
hi link Boolean         Constant
hi link Number          Constant
hi link Float           Number
hi link Repeat          Conditional
hi link Label           Statement
hi link Exception       Statement
hi link Include         Normal
hi link Define          Type
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type
hi link Tag             Special
hi link SpecialChar     Special
hi link SpecialComment  Special
hi link Debug           Special

"5f5372 violet sympa
hi rubyInstanceVariable guifg=#dddddd
" hi rubyControl          guifg=#6da9c7
hi link rubyControl Statement
hi link rubyInclude Statement
hi link rubyExceptional Statement "      guifg=#6da9c7 gui=none
hi link rubyPredefinedVariable rubyInstanceVariable
hi link rubyLocalVariableOrMethod rubyInstanceVariable
hi link rubyString String
"hi javaOperator guifg=#ffffff 
hi link javaOperator Type
hi link javaExternal Type
hi javaParenT guifg=#ffffff gui=italic

hi htmlTag guifg=#55b480
hi link htmlTagName htmlTag
hi link htmlEndTag htmlTag
hi rubyString guifg=#daa342
hi link rubyStringDelimiter rubyString
hi rubySymbol guifg=#58b5cc
hi link htmlArg rubySymbol
hi link htmlString rubyString
hi rubyFunction guifg=#fdc87e
hi rubyInstanceVariable guifg=#9ea0c3
" hi rubyKeyWord guifg=#aa5d22
"hi rubyLocalVariableOrMethod guifg=#e65c4d

hi link yamlBlockMappingKey htmlArg
hi link treeDir htmlArg
hi htmlH1 gui=none
hi htmlTitle gui=none

hi erubyDelimiter guifg=#4F707E

hi link treeFile treeHelp

hi rubyInterpolation guifg=#F1C579
hi link rubyInterpolationDelimiter rubyInterpolation

hi link NERDTreeDir Identifier
hi NERDTreePart       guifg=#494D58
hi NERDTreeOpenable   guifg=#cdeaf9
hi NERDTreeFile       guifg=#cdeaf9
" hi NERDTreeClosable   guifg=#cdeaf9
hi link NERDTreeExecFile Special
hi link NERDTreePartFile NERDTreePart
hi link NERDTreeClosable NERDTreePart



