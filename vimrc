set nocompatible               " be iMproved
"  ---------------------------------------------------------------------------
"  Plugins
"  ---------------------------------------------------------------------------

if !isdirectory(expand("~/.vim/bundle/vundle/.git"))
  !git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
endif

filetype off                   " must be off before Vundle has run
set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Townk/vim-autoclose'
Bundle 'clones/vim-fuzzyfinder'
Bundle 'ervandew/supertab'
Bundle 'git://git.wincent.com/command-t'
Bundle 'gmarik/snipmate.vim'
Bundle 'godlygeek/tabular'
" Bundle 'janx/vim-rubytest'
Bundle 'kana/vim-textobj-user'
Bundle 'mattn/gist-vim'
Bundle 'mileszs/ack.vim'
Bundle 'mrtazz/molokai.vim'
Bundle 'msanders/snipmate.vim'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'panozzaj/vim-autocorrect'
Bundle 'scrooloose/nerdtree'
Bundle 'sickill/vim-pasta'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-surround'
Bundle 'vim-coffee-script'
Bundle 'vim-ruby/vim-ruby'
Bundle 'vim-scripts/L9'

" trial plugins
Bundle 'bitc/vim-bad-whitespace'
Bundle 'tpope/vim-markdown'
Bundle 'skwp/vim-rspec'
Bundle 'Solarized'

filetype plugin indent on     " and turn it back on!

runtime macros/matchit.vim

"  ---------------------------------------------------------------------------
"  General
"  ---------------------------------------------------------------------------

filetype plugin indent on
let mapleader = ","
let g:mapleader = ","
set modelines=0
set history=1000
set nobackup
set nowritebackup
set noswapfile
syntax enable
set autoread
set vb
set undofile
set undodir=~/.vim/.tmp,~/tmp,~/.tmp,/tmp

"  ---------------------------------------------------------------------------
"  UI
"  ---------------------------------------------------------------------------

set title
set encoding=utf-8
set ffs=unix,mac,dos
set scrolloff=5
set autoindent
set smartindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest,full
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set number

" colorscheme wombat256
" colorscheme molokai
let g:solarized_termcolors=256
set background=dark
colorscheme solarized
set t_Co=256

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

"  ---------------------------------------------------------------------------
"  Text Formatting
"  ---------------------------------------------------------------------------

set tabstop=2
set shiftwidth=2
set expandtab
set nowrap
set textwidth=80

"  ---------------------------------------------------------------------------
"  Mappings
"  ---------------------------------------------------------------------------

" Saving and exit
nmap <leader>q :wq<CR>
nmap <leader>w :w!<CR>
nmap <leader><Esc> :wall \| :qall<CR>

" save shortcut
noremap <C-s> <ESC>:w<CR>
vnoremap <C-s> <ESC>:w<CR>
inoremap <C-s> <ESC>:w<CR>

" Map ESC
imap jj <ESC>

"Move a line of text using Ctrl+[jk]
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Searching / moving
set hlsearch
set incsearch
set ignorecase
set smartcase
set gdefault
set showmatch
" turn search highlight off
nnoremap <leader><space> :noh<cr>
" search (forwards)
nmap <space> /
" search (backwards)
map <c-space> ?
" find/replace shortcut
noremap <leader>f :%s///<left><left>

" Auto format
map === mmgg=G`m^zz

" edit .vimrc
command! Ev :e ~/.vimrc
command! Eg :e ~/.gvimrc
" When vimrc is edited, reload it
command! Ex :source $MYVIMRC | :BundleInstall
" scratch buffer
command! Es :e ~/scratch-buffer.rb

" Copy paste in/out of vim
noremap <C-c> "+y
noremap <C-v> "+p
imap <C-c> <esc>"+y
imap <C-v> <esc>"+p

" Sudo write
comm! W exec 'w !sudo tee % > /dev/null' | e

" Use Ack instead of Grep when available
if executable("ack")
  let g:ackprg="ack -H --nocolor --nogroup --column"
  nnoremap <leader>a :Ack
  nnoremap <leader>A :Ack <cword><CR>
endif

" Spell checking
set spellfile+=~/.vim/spell/en.utf-8.add
set dict+=~/.vim/spell/en.utf-8.add
noremap <leader>ss :setlocal spell!<cr>
noremap <leader>sn ]s
noremap <leader>sp [s
noremap <leader>sa zg
noremap <leader>sd z=

" Switch between buffers
noremap <tab> :bn<CR>
noremap <S-tab> :bp<CR>
" close buffer
nmap <leader>d :bd<CR>
" close all buffers
nmap <leader>D :bufdo bd<CR>

"  ---------------------------------------------------------------------------
"  Function Keys
"  ---------------------------------------------------------------------------

" F1 - toggle wordwrap
map <F1> :set nowrap! <CR>

" F4 - kwdb.vim
nmap <F4> <Plug>Kwbd

" F6 - Trim trailing whitespace
nmap <F6> :%s/\s*$//<CR>:noh<CR>

"  ---------------------------------------------------------------------------
"  #Git
"  ---------------------------------------------------------------------------
autocmd BufRead COMMIT_EDITMSG setlocal spell!

"  ---------------------------------------------------------------------------
"  #Ruby
"  ---------------------------------------------------------------------------

autocmd BufNewFile,BufRead Guardfile setf ruby

" testing
map <Leader>1 <Plug>RubyTestRun
map <Leader>2 <Plug>RubyFileRun
map <Leader>3 <Plug>RubyTestRunLast

"  ---------------------------------------------------------------------------
"  Plugins
"  ---------------------------------------------------------------------------

" Rails
let g:rails_menu=2
map <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
map <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
map <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
map <Leader>m :Rmodel
map <Leader>c :Rcontroller
map <Leader>v :Rview
" map <Leader>sm :RSmodel
" map <Leader>sc :RScontroller
" map <Leader>sv :RSview
" map <Leader>su :RSunittest
" map <Leader>sf :RSfunctionaltest

" Fabricator
autocmd User Rails Rnavcommand fabricator spec/fabricators -suffix=_fabricator.rb -default=model()

" NERDTree
noremap <leader>n :NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen=0
let g:NERDTreeShowHidden=1
let g:NERDTreeShowBookmarks = 0
let g:NERDChristmasTree = 1
let g:NERDTreeWinPos = "left"
let g:NERDTreeWinSize = 30
let g:NERDTreeIgnore=['\.git$','\.sass-cache', '\.DS_Store']

" vim-autoclose
if !has("gui_running")
  let g:AutoClosePreservDotReg = 0
endif

" Command-T
" find file
map <leader>t :CommandTFlush<cr>\|:CommandT<cr>
let g:CommandTMatchWindowAtTop=1 " show window at top
let g:CommandTMaxHeight=20
set wildignore+=*.o,*~,*.obj,.git/**,tmp/**,app/assets/images/**,public/images/**,public/assets/**
set wildignore+=*.class,*.doc,*.lock,**.png,**.jpg,**.jpeg
set wildignore+=*.sass-cache/**,build/**,coverage/**
set wildignore+=doc/**,rdoc/**

" Center screen when scrolling search results
nmap n nzz
nmap N Nzz

" Git integration
noremap <leader>8 :e! Gemfile \| Gstatus<CR>
noremap <leader>9 :Gcommit<CR>

" Supertab
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabLongestHighlight = 1

" Tabularize
" align symbols
map <leader>as :Tab/\w\+ "[^"]*",/l0l1<CR>
" align equals
map <leader>a= :Tabularize/=\(.*=\)\@!/<CR>

" tComment
nnoremap // :TComment<CR>
vnoremap // :TComment<CR>

" Buffer window (find file in open buffers)
nmap <silent> <leader>b :FufBuffer<CR>

" Use only current file to autocomplete from tags
set complete=.,w,b,u,t,i

" AutoClose
let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'", '#{': '}'}
let g:AutoCloseProtectedRegions = ["Character"]

let my_home = expand("$HOME/")
if filereadable(my_home . '.vim/bundle/vim-autocorrect/autocorrect.vim')
  source ~/.vim/bundle/vim-autocorrect/autocorrect.vim
endif

"  ---------------------------------------------------------------------------
"  GUI
"  ---------------------------------------------------------------------------

if has("gui_running")
  set guioptions-=T " no toolbar set guioptions-=m " no menus
  set guioptions-=r " no scrollbar on the right
  set guioptions-=R " no scrollbar on the right
  set guioptions-=l " no scrollbar on the left
  set guioptions-=b " no scrollbar on the bottom
  set guioptions=aiA
  set mouse=a
  set guifont=Monaco:h12 "<- Maybe a good idea when using mac
  set antialias
endif
set guifont=Monaco:h12

"  ---------------------------------------------------------------------------
"  Directories
"  ---------------------------------------------------------------------------

" Ctags path (brew install ctags)
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'

"  ---------------------------------------------------------------------------
"  Misc
"  ---------------------------------------------------------------------------

" When editing a file, always jump to the last known cursor position.
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif
