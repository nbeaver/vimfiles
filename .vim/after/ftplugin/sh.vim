" https://vi.stackexchange.com/questions/4805/insert-mode-completion-of-executables-in-path-like-compgen-c/

setlocal complete+=k~/.vim/cache/shellcmds.txt
setlocal dictionary=~/.vim/cache/shellcmds.txt
setlocal iskeyword+=-

" Use four spaces as indentation.
setlocal expandtab
setlocal shiftwidth=4
setlocal softtabstop=4
