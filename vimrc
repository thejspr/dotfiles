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
" Bundle 'sjl/vitality.vim'
Bundle 'xolox/vim-easytags'

" helpers
Bundle 'ervandew/supertab'
" Bundle 'Shougo/neocomplcache'

" autoclose
Bundle 'Auto-Pairs'
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
Bundle 'msanders/snipmate.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/L9'

" File management
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-eunuch'

" Ruby
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'vim-ruby/vim-ruby'
Bundle 'lucapette/vim-ruby-doc'
Bundle 'sickill/vim-pasta'

" JavaScript
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'leshill/vim-json'
Bundle 'itspriddle/vim-jquery'

" msc languages
Bundle 'tpope/vim-markdown'
Bundle 'panozzaj/vim-autocorrect'
Bundle 'bbommarito/vim-slim'

" MatchIt
Bundle 'matchit.zip'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'

" trial plugins
Bundle 'rstacruz/sparkup'
Bundle 'YankRing.vim'
Bundle 'Conque-Shell'

filetype plugin indent on
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
" set modelines=0
set history=1000
set nobackup
set nowritebackup
set noswapfile
set vb
set undofile
set undodir=~/.tmp,/tmp
set foldlevelstart=99
:au FocusLost * silent! wa "save all buffers when focus os lost

"  ---------------------------------------------------------------------------
"  Completion
"  ---------------------------------------------------------------------------
" Supertab
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabLongestHighlight = 1
" neocomplcache
" imap  <silent><expr><tab> neocomplcache#sources#snippets_complete#expandable() ? "\<plug>(neocomplcache_snippets_expand)" : (pumvisible() ? "\<c-e>" : "\<tab>")
" smap  <tab> <right><plug>(neocomplcache_snippets_jump)
" inoremap <expr><c-e> neocomplcache#complete_common_string()

"  ---------------------------------------------------------------------------
"  UI
"  ---------------------------------------------------------------------------
set title
set encoding=utf-8
set ffs=unix,mac,dos
set scrolloff=7
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
set colorcolumn=80

"  ---------------------------------------------------------------------------
"  Mappings
"  ---------------------------------------------------------------------------
" Switch between the last two files
nnoremap <leader><leader> <c-^>

" save shortcut
noremap <C-s> :w<CR>
vnoremap <C-s> <ESC>:w<CR>
inoremap <C-s> <ESC>:w<CR>
command Wq :wq

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
map <m-space> ?
" find/replace shortcut
noremap <leader>f :%s///<left><left>

" Auto format
map === mmgg=G`m^zz

" edit .vimrc
command! Ev :e ~/.vimrc
" When vimrc is edited, reload it
au! BufWritePost .vimrc source %
" scratch buffer
command! Es :e ~/scratch-buffer.txt

" Copy/paste
noremap <C-c> "+y
noremap <C-v> :set paste<CR>"+p:set nopaste<CR>
vmap <C-c> "+y
vmap <C-v> :set paste<CR>"+p:set nopaste<CR>
imap <C-c> <esc>"+y
imap <C-v> <esc>:set paste<CR>"+p:set nopaste<CR>


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

map <F1> :set nowrap! <CR>
noremap <F2> :NERDTreeToggle<CR>
set pastetoggle=<F3>
nmap <F4> <Plug>Kwbd
" F5 Ctrlp refresh
nmap <F6> :%s/\s*$//<CR>:noh<CR>

"  ---------------------------------------------------------------------------
"  #Git
"  ---------------------------------------------------------------------------
autocmd BufRead COMMIT_EDITMSG setlocal spell!
autocmd BufRead COMMIT_EDITMSG setlocal nocursorline

"  ---------------------------------------------------------------------------
"  #Ruby
"  ---------------------------------------------------------------------------

au BufRead,BufNewFile *.rb,Guardfile,Procfile,*.ru set filetype=ruby

" Replace Ruby 1.8 style hashes with shorter Ruby 1.9 style
map <leader>h :%s/:\([^ ]*\)\(\s*\)=>/\1:/<CR>

" https://github.com/lucapette/vim-ruby-doc
let g:ruby_doc_command='open'

"  ---------------------------------------------------------------------------
"  Plugins
"  ---------------------------------------------------------------------------

" Fugitive
nmap <leader>gs :Gstatus<CR><C-w>10+
noremap <leader>gc :Gcommit -v<CR><C-w>15+

" Rails.vim
map <Leader>m :Rmodel<space>
map <Leader>c :Rcontroller<space>
map <Leader>v :Rview<space>

" NERDTree
let g:NERDTreeQuitOnOpen=0
let g:NERDTreeShowHidden=1
let g:NERDTreeShowBookmarks = 0
let g:NERDTreeWinPos = "left"
let g:NERDTreeWinSize = 30
let g:NERDTreeIgnore=['\.git$','\.sass-cache', '\.DS_Store']

" ctrlp
map <leader>t :CtrlP<cr>
map <leader>b :CtrlPBuffer<cr>
let g:ctrlp_custom_ignore = '\.git$\|tmp$\|_deploy\|bin$'
let g:ctrlp_clear_cache_on_exit = 1

set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*.o,*~,*.obj,.git/**,tmp/**,app/assets/images/**,public/**
set wildignore+=*.class,*.doc,*.lock,**.png,**.jpg,**.jpeg
set wildignore+=*.sass-cache/**,build/**,coverage/**,_deploy/**,solr/**
set wildignore+=doc/**,rdoc/**
set wildignore+=spec/dummy/**

" Center screen when scrolling search results
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

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

"Disable arrows
" map   <up>    <nop>
" map   <down>  <nop>
" map   <left>  <nop>
" map   <right> <nop>
" imap  <up>    <nop>
" imap  <down>  <nop>
" imap  <left>  <nop>
