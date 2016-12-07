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

" Save an undo file to disk.
if exists("+persistent_undo")
    set undofile
endif

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

command! CopyPath let @*=expand("%:p:~") | let @+=expand("%:p:~")

" Automatically write the current file
" if the cursor isn't moved for a while.
if has('autocmd')
    autocmd CursorHold * if filewritable(@%) == 1 | :update | endif
endif

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
" See http://vi.stackexchange.com/q/2801/1631
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
