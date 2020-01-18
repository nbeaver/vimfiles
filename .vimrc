" Turn on incremental search and search highlighting.
if has('extra_search')
    set incsearch
    set hlsearch
endif

" Highlight search is cool,
" but it can be distracting,
" so it's nice to clear the highlighting register.

command! ClearSearch let @/ = ""

" Turn on syntax highlighting.
if has('syntax')
    syntax on
endif

" Prevent vim from jumping to the start of line when using e.g. Ctrl-F or G
set nostartofline

" Show the partially entered commands on the bottom-right.
set showcmd

" Use plugins for filetype,
" which may override the indentation settings.
" Important for e.g. Makefiles that must use hard tabs.
if has('autocmd')
    filetype on
    filetype indent on
    filetype plugin on
endif


" Vim only recognizes *.gpi as gnuplot files by default.
if has('autocmd')
    autocmd BufNewFile,BufRead *.plt setf gnuplot
    autocmd BufNewFile,BufRead *.gnuplot setf gnuplot
    autocmd BufNewFile,BufRead *.gnu setf gnuplot
    autocmd BufNewFile,BufRead *.gp setf gnuplot
endif

" Read *.texinput as LaTeX files.
if has('autocmd')
    autocmd BufNewFile,BufRead *.texinput setf tex
endif



" When Vim highlights the matching bracket,
" I have a hard time keeping track of which character the cursor is on.
highlight MatchParen cterm=bold ctermbg=none ctermfg=none
" https://stackoverflow.com/questions/10746750/set-vim-bracket-highlighting-colors

" Build shortcuts to write the current file and run 'make'.
nnoremap <F5> :write\|make<CR>
command! WriteMake write | make

" Do a search for all non-ASCII characters.
" Especially useful when 'hlsearch' is set.
command! FindUnicode /[^\d0-\d127]

" Escape backslashes on current line.
command! Backslashify s;\\;\\\\;g

if exists("*strftime")
    command! DateInsert put=strftime('%F')
endif

" Can work in terminal, but requires vim.gtk or vim.gtk3.
command! CopyPath let @*=expand("%:p:~") | let @+=expand("%:p:~")

" Caps Lock, but only in insertion mode.
" https://vi.stackexchange.com/questions/13250/caps-lock-in-insert-mode-only
function! AllCaps()
	inoremap a A
	inoremap b B
	inoremap c C
	inoremap d D
	inoremap e E
	inoremap f F
	inoremap g G
	inoremap h H
	inoremap i I
	inoremap j J
	inoremap k K
	inoremap l L
	inoremap m M
	inoremap n N
	inoremap o O
	inoremap p P
	inoremap q Q
	inoremap r R
	inoremap s S
	inoremap t T
	inoremap u U
	inoremap v V
	inoremap w W
	inoremap x X
	inoremap y Y
	inoremap z Z
endfunction


command! AllCaps call AllCaps()

function! NoAllCaps()
	inoremap a a
	inoremap b b
	inoremap c c
	inoremap d d
	inoremap e e
	inoremap f f
	inoremap g g
	inoremap h h
	inoremap i i
	inoremap j j
	inoremap k k
	inoremap l l
	inoremap m m
	inoremap n n
	inoremap o o
	inoremap p p
	inoremap q q
	inoremap r r
	inoremap s s
	inoremap t t
	inoremap u u
	inoremap v v
	inoremap w w
	inoremap x x
	inoremap y y
	inoremap z z
endfunction

command! NoAllCaps call NoAllCaps()

" Dictionary autocomplete
" https://vim.fandom.com/wiki/Dictionary_completions
" https://stackoverflow.com/questions/4987163/case-insensitivity-on-autocomplete
function! DictionaryAutocomplete()
	set dictionary+=/usr/share/dict/words
	set complete+=k
	set ignorecase
	set infercase
endfunction
command! DictionaryAutocomplete call DictionaryAutocomplete()

" Use the system clipboard (no more "*p for me!)
set clipboard=unnamed

" Open URLs in the user's preferred application
" using freedesktop.org xdg-utils package,
" not desktop-specific URL handles like
" gnome-open, exo-open, or kioclient.
if has('unix') && exists("$DISPLAY")
    let g:netrw_browsex_viewer = 'xdg-open'
endif

" Use whole "words" when opening URLs.
" This avoids cutting off parameters (after '?') and anchors (after '#').
" See https://vi.stackexchange.com/questions/2801/how-can-i-make-gx-recognise-full-urls-in-vim
let g:netrw_gx="<cWORD>"

" Swap words, like Emacs' M-t.
nmap gl :s,\v(\w+)(\W*%#\W*)(\w+),\3\2\1\r,<CR>kgJ:nohl<CR>
" https://stackoverflow.com/questions/141372/how-to-emulate-emacs-transpose-words-in-vim
" Similar ideas:
" http://vim.wikia.com/wiki/VimTip47

" Look for ctags in current directory, going up until hitting home.
set tags=tags,tags;$HOME
" http://stackoverflow.com/questions/11975316/vim-ctags-tag-not-found

set grepprg=ag\ --vimgrep\ $*
set grepformat=%f:%l:%c:%m

set secure exrc

filetype off
set runtimepath+=/usr/share/lilypond/2.18.2/vim/
filetype on
syntax on

" Prevent pauses during high disk load.
set nofsync swapsync=
" https://lkml.org/lkml/2007/8/4/36
" https://superuser.com/questions/327868/sync-filesystem-in-background
