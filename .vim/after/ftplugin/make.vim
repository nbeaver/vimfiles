" https://vi.stackexchange.com/questions/4805/insert-mode-completion-of-executables-in-path-like-compgen-c/

setlocal complete+=k~/.vim/cache/shellcmds.txt
setlocal dictionary=~/.vim/cache/shellcmds.txt
setlocal iskeyword+=-

command! CacheShellCmds call system("compgen -c > ~/.vim/cache/shellcmds.txt")
