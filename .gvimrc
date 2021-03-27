" http://www.linuxdocs.org/HOWTOs/Vim-HOWTO-3.html
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Ubuntu\ Mono\ 12
  elseif has("gui_gtk3")
    set guifont=Ubuntu\ Mono\ 12
  elseif has("gui_photon")
    set guifont=Ubuntu \ Mono:s12
  elseif has("gui_kde")
    set guifont=Ubuntu\ Mono/12/-1/5/50/0/0/0/1/0
  elseif has("x11")
    set guifont=-*-courier-medium-r-normal-*-*-180-*-*-m-*-*
  else
    set guifont=Ubuntu_Mono:h12:cDEFAULT,Consolas:h10:cANSI:qDRAFT
  endif
  " Turn off bell sound.
  " https://stackoverflow.com/questions/18589352/how-to-disable-vim-bells-sounds
  autocmd GUIEnter * set vb t_vb=
endif

" Set the color scheme.
colorscheme default 

" Always view status bar.
set laststatus=2
" To quote the vim documentation:
"     The value of this option influences when the last window will have a
"     status line:
"       0: never
"       1: only if there are at least two windows
"       2: always

" Make alt-j, alt-k, and alt-l change modes to escape, like in a terminal.
" Note that alt-h already is mapped to the help menu, so we can't fix it.
let s:chars_to_remap = ['w', 'e', 'u', 'o', 'p', 'j', 'k', 'l', 'b', 'n']
for s:char in s:chars_to_remap
    execute "inoremap <M-" . s:char . "> <Esc>" . s:char
    execute "cnoremap <M-" . s:char . "> <Esc>" . s:char
endfor
unlet s:chars_to_remap
" https://github.com/neovim/neovim/issues/2088


if has('unix') && exists("$DISPLAY")
    let g:netrw_browsex_viewer = 'sensible-browser'
endif
