" vim compiler file for Teamscale Precommit Analysis
" Compiler:		Teamscale Precommit Analysis     
" Maintainer:   CQSE GmbH
" Last Change:  08/31/2018
"
" Simple compiler plugin, see :help write-compiler-plugin. 
" Put this file into $VIMRUNTIME/compiler
" Activate it with :compiler teamscale
" Run pre-commit with :make %
" Navigate findings in the quickfix window with :cw

if exists("current_compiler")
  finish
endif

if !exists("g:teamscale#user")
  echoe 'You did not provide a user for Teamscale in g:teamscale#user'
  finish
endif

if !exists("g:teamscale#accesskey")
  echoe 'You did not provide an access key for Teamscale in g:teamscale#accesskey'
  finish
endif

let current_compiler = "teamscale"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo&vim

let s:teamscaledev = get(g:, 'teamscale#devpath', 'teamscale-dev')
if !executable(s:teamscaledev)
  echoe 'Cannot find teamscale-dev binary. Please set g:teamscale#devpath'
  finish
endif

let s:prog = 'NO_COLOR=true ' . shellescape(s:teamscaledev) . ' precommit -u ' . shellescape(g:teamscale#user) . ' -k ' . shellescape(g:teamscale#accesskey)
exe 'CompilerSet makeprg=' . escape(s:prog, '\" ')

CompilerSet errorformat+=%f:%l:%c:\ %trror:\ %m
CompilerSet errorformat+=%f:%l:%c:\ %tarning:\ %m
CompilerSet errorformat+=%f:%l:%c:\ %m
CompilerSet errorformat+=%f:%l:\ %trror:\ %m
CompilerSet errorformat+=%f:%l:\ %tarning:\ %m
CompilerSet errorformat+=%f:%l:\ %m

let &cpo = s:cpo_save
unlet s:cpo_save

