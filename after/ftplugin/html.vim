" Use two spaces as indentation.
setlocal expandtab
setlocal shiftwidth=2
setlocal softtabstop=2
" Check spelling.
setlocal spell

" Autocomplete words from the system dictionary.
setlocal dictionary+=/usr/share/dict/words
setlocal complete+=k
setlocal ignorecase
setlocal infercase
" https://vim.fandom.com/wiki/Dictionary_completions
" https://stackoverflow.com/questions/4987163/case-insensitivity-on-autocomplete
