" https://vi.stackexchange.com/questions/4805/insert-mode-completion-of-executables-in-path-like-compgen-c/

silent call system("mkdir -p ~/.cache/vim/")
silent call system("compgen -c > ~/.cache/vim/shellcmds.txt")
setlocal complete+=k~/.cache/vim/shellcmds.txt
setlocal dictionary=~/.cache/vim/shellcmds.txt
setlocal iskeyword+=-

" Use four spaces as indentation.
setlocal expandtab
setlocal shiftwidth=4
setlocal softtabstop=4
