" Use four spaces as indentation.
setlocal expandtab
setlocal shiftwidth=4
setlocal softtabstop=4
" Change working directory to match file.
set autochdir
" Check spelling.
set spell
" Make it easier to see lines longer than 80 characters.
set colorcolumn=80
" Prevent linebreaks mid-word.
set linebreak

" Autocomplete words from the system dictionary.
set dictionary+=/usr/share/dict/words
set complete+=k
set ignorecase
set infercase
" https://vim.fandom.com/wiki/Dictionary_completions
" https://stackoverflow.com/questions/4987163/case-insensitivity-on-autocomplete
