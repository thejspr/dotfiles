set nocompatible               " be iMproved

if !isdirectory(expand("~/.vim/bundle/vundle/.git"))
  !git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
endif

filetype off                   " must be off before Vundle has run

set runtimepath+=~/.vim/bundle/vundle/

call vundle#rc()

Bundle "gmarik/vundle"
Bundle "git://github.com/mileszs/ack.vim.git"
" Bundle "git://github.com/tpope/vim-rvm.git"
Bundle "git://github.com/tpope/vim-fugitive"
Bundle "git://github.com/tpope/vim-rails.git"
Bundle "git://github.com/tpope/vim-surround.git"
" Bundle "git://github.com/chrismetcalf/vim-yankring.git"
" Bundle "git://github.com/chrismetcalf/vim-taglist.git"
Bundle "git://github.com/tpope/vim-endwise.git"
Bundle "git://github.com/blueyed/vim-autoclose.git"
Bundle "git://github.com/panozzaj/vim-autocorrect.git"
Bundle "git://github.com/tsaleh/vim-tcomment.git"
Bundle "git://github.com/clones/vim-fuzzyfinder.git"
" Bundle "git://github.com/godlygeek/tabular.git"
Bundle "git://github.com/vim-scripts/Gist.vim.git"
Bundle "git://github.com/vim-scripts/L9.git"
" Bundle "git://github.com/Bogdanp/rbrepl.vim.git"
" Bundle "git://github.com/rson/vim-conque.git"
Bundle "git://github.com/gmarik/snipmate.vim.git"
Bundle "git://github.com/kana/vim-textobj-user.git"
Bundle "git://github.com/nelstrom/vim-textobj-rubyblock.git"
" Bundle "git://github.com/janx/vim-rubytest.git"
Bundle "git://github.com/scrooloose/syntastic.git"
Bundle "git://github.com/msanders/snipmate.vim.git"
" Bundle "git://github.com/mozilla/doctorjs.git"
Bundle "git://github.com/ervandew/supertab.git"
Bundle "git://github.com/scrooloose/nerdtree.git"
Bundle "git://git.wincent.com/command-t.git"
Bundle "Color-Sampler-Pack"
Bundle "toggle_words.vim"
" Bundle "jQuery"
Bundle 'vim-coffee-script'


filetype plugin indent on     " and turn it back on!

runtime macros/matchit.vim    
