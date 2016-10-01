" https://vi.stackexchange.com/questions/4805/insert-mode-completion-of-executables-in-path-like-compgen-c/

setlocal complete+=k~/.cache/vim/shellcmds.txt
setlocal dictionary=~/.cache/vim/shellcmds.txt
setlocal iskeyword+=-
silent call system("mkdir -p ~/.cache/vim/")
silent call system("compgen -c > ~/.cache/vim/shellcmds.txt")

" Use four spaces as indentation.
set expandtab
set shiftwidth=4
set softtabstop=4
