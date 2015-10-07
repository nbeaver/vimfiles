" https://vi.stackexchange.com/questions/4805/insert-mode-completion-of-executables-in-path-like-compgen-c/

setlocal complete+=k~/.cache/vim/shellcmds.txt
setlocal dictionary=~/.cache/vim/shellcmds.txt
setlocal iskeyword+=-
silent call system("compgen -c > ~/.cache/vim/shellcmds.txt")

" TODO: aliases and shell functions in a separate file?
