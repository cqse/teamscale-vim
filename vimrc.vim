" See README.md for installation instructions

" adjust these variables
let g:teamscale#user='your teamscale login'
let g:teamscale#accesskey='your teamscale IDE accesskey'
" set this, unless the teamscale-dev command-line tool is already on your PATH
let g:teamscale#devpath='/path/to/teamscale-dev'

function! s:precommit() abort
    let previous_compiler = ""
    if exists("b:current_compiler")
        let previous_compiler = b:current_compiler
    endif
    compiler teamscale

    if !exists('b:teamscale')
        return
    endif

    if empty(expand("%"))
        echoe "The current buffer is not a file"
        return
    endif

    w
    make %
    " use silent make % to not see the output

    if !empty(previous_compiler)
        execute "compiler " .. previous_compiler
    endif
    cwindow
endfunction

" Writes the current buffer, then runs pre-commit and shows the results in the
" quickfix window
command! Precommit call s:precommit()

" adjust the mapping to your likes
map <f5> :Precommit<cr>

