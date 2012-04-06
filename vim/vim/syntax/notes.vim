" Vim Syntax File
"
" Language: Notes
" Maintainer: Benoit Myard <benoit@saalaa.net>
" URL: http://bitbucket.org/saalaa/vim-notes

if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

" Todo Lists --------------------------------------------------------------

syn region ballot_todo start="^\s\+☐\s" skip="\s\\$" end="$" contains=ballot_markers,ballot_nl,ballot_text_todo keepend
syn region ballot_done start="^\s\+☑\s" skip="\s\\$" end="$" contains=ballot_markers,ballot_nl,ballot_text_done keepend
syn region ballot_stop start="^\s\+☒\s" skip="\s\\$" end="$" contains=ballot_markers,ballot_nl,ballot_text_stop keepend

syn match   ballot_nl "\\" contained
hi def link ballot_nl Comment

syn match   ballot_markers "\(☐\|☑\|☒\)" contained
hi def link ballot_markers Normal

syn match   ballot_marker_todo "☐" contained
hi def link ballot_marker_todo Normal

syn match   ballot_marker_done "☑" contained
hi def link ballot_marker_done Normal

syn match   ballot_marker_stop "☒" contained
hi def link ballot_marker_stop Normal

hi def link ballot_todo Statement
hi def link ballot_stop Comment
hi def link ballot_done Comment

" Folding ---------------------------------------------------------------------

syn region arrow start="^\s\+->\s" skip="\s\\$" end="$" contains=arrow_marker,arrow_text,nobreak keepend

syn match nobreak "\\" contained
syn match arrow_marker    "^\s\+->\s" contained
syn match arrow_text      "\_.*" contained

" Folding ---------------------------------------------------------------------

syn region notes_fold start="^.*{{{" end="$" contains=notes_fold_open keepend

syn match notes_fold_open	"{{{$" contained
syn match notes_fold_close	"}}}$"

" Text Sugar ------------------------------------------------------------------

syn region notes_script matchgroup=notes_script_delimiter
      \ start='::\_s*\n\ze\z(\s\+\)' skip='^$' end='^\z1\@!'
      \ contains=@NoSpell

" Text Sugar ------------------------------------------------------------------

syn match notes_list "^\s\+\([0-9]\+\.\|[-o*]\)\s"
syn match notes_context "@[A-Za-z][A-Za-z_-]\+"
syn match notes_emphasis "\*[A-Za-z][A-Za-z_-]\+\*"
syn match notes_command "`[/A-Za-z][/.A-Za-z_-]\+`"

" Headers -----------------------------------------------------------------

syn match helpSectionDelim	"^=.*=$"
syn match helpSectionDelim	"^-\{3,}.*-$"

" Headers -----------------------------------------------------------------

"syn match helpHeader		"\s*\zs.\{-}\ze\s\=\~$" nextgroup=helpIgnore



hi def link notes_fold PreProc
hi def link notes_fold_open	Comment
hi def link notes_fold_close	Comment

hi def link notes_list Number
hi def link notes_context Type
hi def notes_emphasis term=bold cterm=bold gui=bold
hi def link notes_command String
hi def link notes_script String
hi def link notes_script_delimiter Delimiter
hi def link nobreak Comment
hi def link arrow_marker    Comment
hi def link arrow_text      Statement

hi def link helpSectionDelim	PreProc

"hi def link helpHeader		PreProc
"hi def link helpIgnore          Ignore

let b:current_syntax = "notes"
