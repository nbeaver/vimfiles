" Use four spaces as indentation.
setlocal expandtab
setlocal shiftwidth=4
setlocal softtabstop=4
" Wrap long lines on word boundaries.
set wrap
set linebreak
" http://vim.wikia.com/wiki/Word_wrap_without_line_breaks

" Autocomplete words from the system dictionary.
set dictionary+=/usr/share/dict/words
set complete+=k
set ignorecase
set infercase
" https://vim.fandom.com/wiki/Dictionary_completions
" https://stackoverflow.com/questions/4987163/case-insensitivity-on-autocomplete
