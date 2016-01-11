" Turn on incremental search and search highlighting.
if has('extra_search')
    set incsearch
    set hlsearch
endif

" Highlight search is cool,
" but it can be distracting,
" so it's nice to clear the highlighting register.
command ClearSearch let @/ = ""

" Automatically work with directory the file is in,
" not the directory `vim` is invoked from.
if exists("+autochdir")
    set autochdir
endif

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

" By default, use four spaces as indentation.
set expandtab
set shiftwidth=4
set softtabstop=4

" Use plugins for filetype,
" which may override the indentation settings.
" Important for e.g. Makefiles that must use hard tabs.
if has('autocmd')
    filetype plugin indent on
endif

" From the documentation,
" a 'minimal language-sensitive completion'.
" /usr/share/vim/vim74/doc/insert.txt
if has("autocmd") && exists("+omnifunc")
    autocmd Filetype *
                \	if &omnifunc == "" |
                \		setlocal omnifunc=syntaxcomplete#Complete |
                \	endif
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

command WriteMake write | make

if exists("*strftime")
    command DateInsert put=strftime('%F')
endif

command CopyPath let @*=expand("%:p:~")

nnoremap <F5> :w\|make<CR>

" Make # and * work in visual mode.
vnoremap * y/<C-R>"<CR>
vnoremap # y?<C-R>"<CR>
" Based on http://vim.wikia.com/wiki/Search_for_visually_selected_text
" Warning: does not escape regular expression characters such as [ ].

" Automatically write the current file
" if the cursor isn't moved for a while.
if has('autocmd')
    autocmd CursorHold * if filewritable(@%) == 1 | :update | endif
endif

" Use the system clipboard (no more "*p for me!)
set clipboard=unnamed

source ~/src/vimscript/good-habits/good-habits.vim

" Open URLs in the user's preferred application,
" not desktop-specific URL handles like
" gnome-open, exo-open, or kioclient.
:let g:netrw_browsex_viewer= "xdg-open"
