" https://vi.stackexchange.com/questions/4805/insert-mode-completion-of-executables-in-path-like-compgen-c/

" the k is not a typo:
setlocal complete+=k~/.vim/cache/shellcmds.txt
" http://vimdoc.sourceforge.net/htmldoc/options.html#'complete'

setlocal dictionary=~/.vim/cache/shellcmds.txt
" http://vimdoc.sourceforge.net/htmldoc/options.html#'dictionary'

" For command with hyphens, like apt-cache or fc-list
setlocal iskeyword+=-
" http://vimdoc.sourceforge.net/htmldoc/options.html#'iskeyword'
