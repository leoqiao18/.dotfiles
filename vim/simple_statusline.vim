" always show status line
set laststatus=2
" Format the status line
set statusline=
set statusline+=%1*
set statusline+=\ %n\  " buffer number
set statusline+=%*

set statusline+=%2*
set statusline+=\ %f " relative filepath
set statusline+=%m " modified?
set statusline+=%r " read-only?
set statusline+=\ 
set statusline+=%*


set statusline+=%3*
set statusline+=%= " left-right separation
set statusline+=\ 
set statusline+=%< " truncate point
set statusline+=\ %{getcwd()}%h
set statusline+=\ 
set statusline+=%*

set statusline+=%2*
set statusline+=\ %y " filetype
set statusline+=\ %l:%c " line:column
set statusline+=\ \|\ %LL " total lines
set statusline+=\ \|\ %p%% " percentage
set statusline+=\ 
set statusline+=%*

highlight User1 ctermfg=white ctermbg=black
highlight User2 ctermfg=white ctermbg=darkgray
highlight User3 ctermfg=gray ctermbg=black
