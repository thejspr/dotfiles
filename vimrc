set nocompatible " be iMproved
if !isdirectory(expand("~/.vim/bundle/vundle/.git"))
  !git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
endif
filetype off " must be off before Vundle has run

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

" textwrangling
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-surround'
Bundle 'tomtom/tcomment_vim'
Bundle 'ervandew/supertab'
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

" UI
Bundle 'Lokaltog/vim-powerline'
Bundle 'bitc/vim-bad-whitespace'
Bundle 'Liquid-Carbon'

" new stuff
Bundle 'AndrewRadev/switch.vim'
nnoremap - :Switch<cr>
Bundle 'roman/golden-ratio'
let g:golden_ratio_autocommand = 0
nmap <C-w>- <Plug>(golden_ratio_resize)
Bundle 'vim-scripts/VimClojure'
" Settings for VimClojure
let vimclojure#ParenRainbow=1
let vimclojure#HighlightBuiltins=1

filetype plugin indent on
runtime macros/matchit.vim

syntax on
set nocursorcolumn
set nocursorline
set synmaxcol=256
syntax sync minlines=256
colorscheme liquidcarbon

"  ---------------------------------------------------------------------------
"  General
"  ---------------------------------------------------------------------------
let mapleader = ","
let g:mapleader = ","
set history=1000
set nobackup
set nowritebackup
set noswapfile
set vb
set undofile
set undodir=~/.tmp,/tmp
set foldlevelstart=99
:au FocusLost * silent! wa "save all buffers when focus is lost

set shell=zsh
" set shellcmdflag=-ic

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
set scrolloff=4
set autoindent
set smartindent
set showmode
set modeline
set showcmd
set hidden
set wildmenu
set wildmode=list:longest,full
set ttyfast
set ttyscroll=3
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
" set colorcolumn=80

"  ---------------------------------------------------------------------------
"  Mappings
"  ---------------------------------------------------------------------------
" Run tests
fun! RunTest(cmd)
  :w

  if filereadable('zeus.json')
    let s:prefix = "!clear && zeus "
  else
    let s:prefix = "!clear && "
  endif

  execute(s:prefix . a:cmd)
endfu

" rspec whole file
map <leader>R :call RunTest("rspec " . expand("%p"))<CR>

" rspec current line
map <leader>r :call RunTest("rspec " . expand("%p") . ":" . line("."))<CR>

" cucumber whole file
map <leader>K :call RunTest("cucumber " . expand("%p"))<CR>

" cucumber current line
map <leader>k :call RunTest("cucumber " . expand("%p") . ":" . line("."))<CR>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" JSON
au BufRead,BufWrite,BufNewFile *.json set filetype=json foldmethod=syntax
au! FileType json command! -range=% -nargs=* Tidy <line1>,<line2>! json_xs -f json -t json-pretty

" save shortcut
nmap <c-s> :w<CR>
vmap <c-s> <ESC>:w<CR>
imap <c-s> <ESC>:w<CR>
command! Wqa :wqa

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
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

" Auto format
map === mmgg=G`m^zz

" edit .vimrc
command! Ev :e ~/.vimrc
" When vimrc is edited, reload it
au! BufWritePost .vimrc source %
" scratch buffer
command! Es :e ~/.scratch-buffer.rb

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
au BufRead,BufNewFile *.rb,Guardfile,Procfile,*.ru,pryrc set filetype=ruby

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
let g:NERDTreeIgnore=['\.git$','\.sass-cache', '\.DS_Store', '\.bundle', 'coverage', '\.pygments-cache', '\.themes']

" ctrlp
map <leader>t :CtrlP<cr>
map <leader>b :CtrlPBuffer<cr>
let g:ctrlp_custom_ignore = '\.git$\|tmp$\|_deploy$'
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

" copy/paste in/out of vim
" http://vim.wikia.com/wiki/In_line_copy_and_paste_to_system_clipboard
" http://vim.wikia.com/wiki/Mac_OS_X_clipboard_sharing
set clipboard+=unnamed
nmap <C-c> y
vmap <C-c> y
nmap <C-v> p
vmap <C-v> p

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OpenChangedFiles COMMAND
" Open a split for each dirty file in git
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OpenChangedFiles()
  only " Close all windows, unless they're modified
  let status = system('git status -s | grep "^ \?\(M\|A\|UU\)" | sed "s/^.\{3\}//"')
  let filenames = split(status, "\n")
  exec "edit " . filenames[0]
  for filename in filenames[1:]
    exec "sp " . filename
  endfor
endfunction
command! OpenChangedFiles :call OpenChangedFiles()

" PROJECT SPEED!
" Reduce timeout after <ESC> is recvd. This is only a good idea on fast links.
set ttimeout
set ttimeoutlen=20
set notimeout
set ambiwidth=double " powerline char width fix
set lazyredraw
