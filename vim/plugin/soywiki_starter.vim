" Vim script that turns Vim into a personal wiki
" Maintainer:	Daniel Choi <dhchoi@gmail.com>
" License: MIT License (c) 2011 Daniel Choi

if exists("g:SoyWikiStarterLoaded") || &cp || version < 700
  finish
endif
let g:SoyWikiStarterLoaded = 1


func! Soywiki()
  source /Users/jesper/.rbenv/versions/2.0.0-p247/lib/ruby/gems/2.0.0/gems/soywiki-0.9.6/lib/soywiki.vim
endfunc

command! -bar -nargs=0 Soywiki :call Soywiki()

