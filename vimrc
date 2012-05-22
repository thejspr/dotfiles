set nocompatible               " be iMproved

if !isdirectory(expand("~/.vim/bundle/vundle/.git"))
  !git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
endif

filetype off                   " must be off before Vundle has run

set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" essentials
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-repeat'
Bundle 'sjl/vitality.vim'
Bundle 'xolox/vim-easytags'

" helpers
Bundle 'ervandew/supertab'
Bundle 'Shougo/neocomplcache'

" autoclose
Bundle 'kana/vim-smartinput'
" Bundle 'Auto-Pairs'
" Bundle 'Raimondi/delimitMate'
" Bundle 'Townk/vim-autoclose'

" UI
Bundle 'Lokaltog/vim-powerline'
Bundle 'bitc/vim-bad-whitespace'
Bundle 'altercation/vim-colors-solarized'

" textwrangling
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-surround'
Bundle 'tomtom/tcomment_vim'
Bundle 'godlygeek/tabular'

" plugins
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'msanders/snipmate.vim'
Bundle 'kien/ctrlp.vim'
" Bundle 'vim-scripts/L9'

" Ruby
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'vim-ruby/vim-ruby'
Bundle 'lucapette/vim-ruby-doc'
" Bundle 'sickill/vim-pasta'

" JavaScript
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'leshill/vim-json'
Bundle 'itspriddle/vim-jquery'

" html...
Bundle 'gregsexton/MatchTag'

" msc languages
Bundle 'tpope/vim-markdown'
Bundle 'panozzaj/vim-autocorrect'

" MatchIt
Bundle 'matchit.zip'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'

filetype plugin indent on     " and turn it back on!

runtime macros/matchit.vim

syntax enable
set background=dark
colorscheme solarized

"  ---------------------------------------------------------------------------
"  General
"  ---------------------------------------------------------------------------
filetype plugin indent on
let mapleader = ","
let g:mapleader = ","
let maplocalleader = ";"
set modelines=0
set history=1000
set nobackup
set nowritebackup
set noswapfile
set vb
set undofile
set undodir=~/.tmp,/tmp
set foldlevelstart=99

"  ---------------------------------------------------------------------------
"  Completion
"  ---------------------------------------------------------------------------
" Supertab
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabLongestHighlight = 1
" neocomplcache
imap  <silent><expr><tab> neocomplcache#sources#snippets_complete#expandable() ? "\<plug>(neocomplcache_snippets_expand)" : (pumvisible() ? "\<c-e>" : "\<tab>")
smap  <tab> <right><plug>(neocomplcache_snippets_jump) 
inoremap <expr><c-e> neocomplcache#complete_common_string()

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

set mouse=a
set mousehide

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
" Switch between the last two files
nnoremap <leader><leader> <c-^>

" save shortcut
noremap <C-s> <ESC>:w<CR>
vnoremap <C-s> <ESC>:w<CR>
inoremap <C-s> <ESC>:w<CR>

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
noremap <leader>f :%s///g<left><left>

" Auto format
map === mmgg=G`m^zz

" edit .vimrc
command! Ev :e ~/.vimrc
" When vimrc is edited, reload it
au! BufWritePost .vimrc source %
" scratch buffer
command! Es :e ~/scratch-buffer.txt

" Copy paste in/out of vim
noremap <C-c> "+y
noremap <C-v> "+p
imap <C-c> <esc>"+y
imap <C-v> <esc>"+p

" Sudo write
comm! W exec 'w !sudo tee % > /dev/null' | e
comm! Wq exec 'wq'

" Use Ack instead of Grep when available
let g:ackprg="ack -H --nogroup --column"
nnoremap <leader>a :Ack
nnoremap <leader>A :Ack <cword><CR>

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

" reselect visual lock after indent/outdent
vnoremap < <gv
vnoremap > >gv

" easy split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" improve movement on wrapped lines
nnoremap j gj
nnoremap k gk

" move lines vertivally
noremap <C-j> :m+<CR>
noremap <C-k> :m-2<CR>
inoremap <C-j> <Esc>:m+<CR>
inoremap <C-k> <Esc>:m-2<CR>
vnoremap <C-j> :m'>+<CR>gv
vnoremap <C-k> :m-2<CR>gv

"  ---------------------------------------------------------------------------
"  Function Keys
"  ---------------------------------------------------------------------------

" F1 - toggle wordwrap
map <F1> :set nowrap! <CR>

" F2 - Trim trailing whitespace
nmap <F6> :%s/\s*$//<CR>:noh<CR>

" F4 - kwdb.vim
nmap <F4> <Plug>Kwbd

"  ---------------------------------------------------------------------------
"  #Git
"  ---------------------------------------------------------------------------
autocmd BufRead COMMIT_EDITMSG setlocal spell!
autocmd BufRead COMMIT_EDITMSG setlocal nocursorline

"  ---------------------------------------------------------------------------
"  #Ruby
"  ---------------------------------------------------------------------------

let g:ruby_doc_command='open'

au BufRead,BufNewFile *.rb set filetype=ruby.rails.rspec
au BufRead,BufNewFile Guardfile,Procfile,*.ru set filetype=ruby

" Replace Ruby 1.8 style hashes with shorter Ruby 1.9 style
map <leader>h :%s/:\([^ ]*\)\(\s*\)=>/\1:/<CR>

"  ---------------------------------------------------------------------------
"  Plugins
"  ---------------------------------------------------------------------------

" Rails.vim
map <Leader>m :Rmodel<space>
map <Leader>c :Rcontroller<space>
map <Leader>v :Rview<space>

function! ShowRoutes()
  " Requires 'scratch' plugin
  :topleft 100 :split __Routes__
  " Make sure Vim doesn't write __Routes__ as a file
  :set buftype=nofile
  " Delete everything
  :normal 1GdG
  " Put routes output in buffer
  :0r! rake -s routes
  " Size window to number of lines (1 plus rake output length)
  :exec ":normal " . line("$") . _ "
  " Move cursor to bottom
  :normal 1GG
  " Delete empty trailing line
  :normal dd
  endfunction
map <leader>gR :call ShowRoutes()<cr>

" NERDTree
noremap <F2> :NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen=0
let g:NERDTreeShowHidden=1
let g:NERDTreeShowBookmarks = 0
let g:NERDChristmasTree = 1
let g:NERDTreeWinPos = "left"
let g:NERDTreeWinSize = 30
let g:NERDTreeIgnore=['\.git$','\.sass-cache', '\.DS_Store']

" ctt
map <leader>t :CtrlP<cr>
let g:ctrlp_custom_ignore = '\.git$\|tmp$\|_deploy$'
let g:ctrlp_clear_cache_on_exit = 1

set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*.o,*~,*.obj,.git/**,tmp/**,app/assets/images/**,public/**
set wildignore+=*.class,*.doc,*.lock,**.png,**.jpg,**.jpeg
set wildignore+=*.sass-cache/**,build/**,coverage/**,_deploy/**,solr/**
set wildignore+=doc/**,rdoc/**
set wildignore+=spec/dummy/**

" Center screen when scrolling search results
nmap n nzz
nmap N Nzz

" Git integration
noremap <leader>8 :e! Gemfile \| Gstatus<CR>
noremap <leader>9 :Gcommit<CR>

" tComment
nnoremap // :TComment<CR>
vnoremap // :TComment<CR>

" Use only current file to autocomplete from tags
set complete=.,w,b,u,t,i

"  ---------------------------------------------------------------------------
"  Directories
"  ---------------------------------------------------------------------------
" Ctags path (brew install ctags)
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'

"  ---------------------------------------------------------------------------
" New stuff
"  ---------------------------------------------------------------------------

function! RunTests(filename)
    " Write the file and run tests for the given filename
    :w
    :silent !echo;echo;echo;echo;echo
    exec ":!~/.rbenv/shims/bundle exec rspec " . a:filename
endfunction

function! SetTestFile()
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@%
endfunction

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Run the tests for the previously-marked file.
    let in_spec_file = match(expand("%"), '_spec.rb$') != -1
    if in_spec_file
        call SetTestFile()
    elseif !exists("t:grb_test_file")
        return
    end
    call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
    let spec_line_number = line('.')
    call RunTestFile(":" . spec_line_number)
endfunction

" Run this file
map <leader>R :call RunTestFile()<cr>
" Run only the example under the cursor
map <leader>r :call RunNearestTest()<cr>
" Run all test files
" map <leader>a :call RunTests('spec')<cr>

" position
" Tell vim to remember certain things when we exit
" "  '10  :  marks will be remembered for up to 10 previously edited files
" "  "100 :  will save up to 100 lines for each register
" "  :50  :  up to 20 lines of command-line history will be remembered
" "  %    :  saves and restores the buffer list
" "  n... :  where to save the viminfo files
set viminfo='10,\"100,:50,n~/.viminfo

function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END
