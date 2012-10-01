set nocompatible               " be iMproved

if !isdirectory(expand("~/.vim/bundle/vundle/.git"))
  !git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
endif

filetype off                   " must be off before Vundle has run

command! BI :BundleInstall
command! -bang BU :BundleInstall!
command! BC :BundleClean
set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" essentials
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-repeat'
Bundle 'xolox/vim-easytags'

" helpers
Bundle 'ervandew/supertab'

" UI
Bundle 'Lokaltog/vim-powerline'
Bundle 'bitc/vim-bad-whitespace'

" textwrangling
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-surround'
Bundle 'tomtom/tcomment_vim'
Bundle 'godlygeek/tabular'

" plugins
Bundle 'tpope/vim-fugitive'
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

" msc languages
Bundle 'tpope/vim-markdown'
Bundle 'panozzaj/vim-autocorrect'
Bundle 'bbommarito/vim-slim'
Bundle 'octave.vim'
Bundle 'sql.vim'

" MatchIt
Bundle 'matchit.zip'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'

" SnipMate
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "git@github.com:thejspr/snipmate-snippets.git"
Bundle "garbas/vim-snipmate"

" new stuff
Bundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Bundle 'AndrewRadev/switch.vim'
nnoremap - :Switch<cr>

filetype plugin indent on
runtime macros/matchit.vim

syntax enable
set background=dark
colorscheme Tomorrow-Night-Eighties

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

" Resize splits when the win{is resized
au VimResized * exe "normal! \<c-w>="

set splitbelow
set splitright

" Fix annoyances
nnoremap <F1> <nop>
nnoremap Q <nop>
nnoremap K <nop>
" keep curson in place when joining lines
nnoremap J mzJ`z

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
" Zeus
function! RSpecFile()
  execute("!clear && zeus rspec " . expand("%p"))
endfunction
command! RSpecFile call RSpecFile()
map <leader>R :call RSpecFile() <CR>

function! RSpecCurrent()
  execute("!clear && zeus rspec " . expand("%p") . ":" . line("."))
endfunction
command! RSpecCurrent call RSpecCurrent()
map <leader>r :call RSpecCurrent() <CR>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" JSON
au BufRead,BufNewFile *.json set filetype=json foldmethod=syntax
au FileType json command -range=% -nargs=* Tidy <line1>,<line2>! json_xs -f json -t json-pretty

nmap <F1> <nop>

" save shortcut
command! Wqa :wqa
noremap <C-s> :w<CR>
vnoremap <C-s> <ESC>:w<CR>
inoremap <C-s> <ESC>:w<CR>
if has("user_commands")
  command! -bang -nargs=? -complete=file E e<bang> <args>
  command! -bang -nargs=? -complete=file W w<bang> <args>
  command! -bang -nargs=? -complete=file Wq wq<bang> <args>
  command! -bang -nargs=? -complete=file WQ wq<bang> <args>
  command! -bang Wa wa<bang>
  command! -bang WA wa<bang>
  command! -bang Q q<bang>
  command! -bang QA qa<bang>
  command! -bang Qa qa<bang>
endif

" Searching / moving
set hlsearch
set incsearch
set smartcase
set gdefault
set showmatch
" turn search highlight off
nnoremap <leader><space> :nohlsearch<cr>
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
command! Es :e ~/.scratch-buffer.rb

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

" easier deletion
nmap \ dd
vmap \ dd

" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>


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

" Sparkup
" augroup sparkup_types
"   " Remove ALL autocommands of the current group.
"   autocmd!
"   " Add sparkup to new filetypes
"   autocmd FileType erb runtime! ftplugin/html/sparkup.vim
" augroup END

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
let g:NERDTreeIgnore=['\.git$','\.sass-cache', '\.DS_Store', '\.bundle', 'coverage', '\.pygments-cache', '\.themes']

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
nnoremap } }zz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" tComment
nnoremap // :TComment<CR>
vnoremap // :TComment<CR>

" Use only current file to autocomplete from tags
set complete=.,w,b,u,],t,i

"  ---------------------------------------------------------------------------
"  Directories
"  ---------------------------------------------------------------------------
" Ctags path (brew install ctags)
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'

" position
" Tell vim to remember certain things when we exit
" "  '10  :  marks will be remembered for up to 10 previously edited files
" "  "100 :  will save up to 100 lines for each register
" "  :50  :  up to 20 lines of command-line history will be remembered
" "  %    :  saves and restores the buffer list
" "  n... :  where to save the viminfo files
set viminfo='10,\"100,:50,n~/.viminfo

autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MY FUNCTIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! InlineBlock()
  normal ?docw{€krx endce}v%:join
endfunction
map <leader>s :call InlineBlock()<cr>

function! ExpandBlock()
  normal 0 {cwdo |n€kb €kra€kb }€klDoend
endfunction
map <leader>S :call ExpandBlock()<cr>
