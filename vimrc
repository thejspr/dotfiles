set nocompatible " be iMproved
if !isdirectory(expand("~/.vim/bundle/vundle/.git"))
  !git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
endif
filetype off " must be off before Vundle has run

set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" essentials
Bundle 'epmatsw/ag.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'AutoTag'
Bundle 'Raimondi/delimitMate'

" textwrangling
Bundle 'tpope/vim-surround'
Bundle 'tomtom/tcomment_vim'
Bundle 'ervandew/supertab'
Bundle 'godlygeek/tabular'

" Git
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'

" File management
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-eunuch'
Bundle 'kwbdi.vim'

" Ruby
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-rails'
Bundle 'lucapette/vim-ruby-doc'
Bundle 'sickill/vim-pasta'
Bundle 'tpope/vim-bundler'

" JavaScript
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'leshill/vim-json'
Bundle 'nono/vim-handlebars'

" msc languages
Bundle 'tpope/vim-markdown'
Bundle 'slim-template/vim-slim'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
au FileType handlebars runtime! ftplugin/html/sparkup.vim

" SnipMate
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "thejspr/snipmate-snippets"
Bundle "garbas/vim-snipmate"

" UI
Bundle 'Lokaltog/vim-powerline'
Bundle 'Solarized'

" Clojure
Bundle 'guns/vim-clojure-static'
Bundle 'tpope/vim-foreplay'
Bundle 'kien/rainbow_parentheses.vim'
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" new stuff
Bundle 'Lokaltog/vim-easymotion'
let g:EasyMotion_leader_key = '<Leader>'
let g:EasyMotion_mapping_t = '_t'
let g:EasyMotion_mapping_T = '_T'
let g:EasyMotion_mapping_f = '_f'
let g:EasyMotion_mapping_k = '_k'
let g:EasyMotion_mapping_K = '_K'
Bundle 'gcmt/tube.vim'
let g:tube_terminal = 'iterm'

filetype plugin indent on
runtime macros/matchit.vim

syntax on
set nocursorcolumn
set cursorline
set background=dark
colorscheme solarized

let mapleader = ","
let g:mapleader = ","
set history=100
set nobackup
set nowritebackup
set notimeout
set noswapfile
set vb
set undofile
set undodir=~/.tmp,/tmp
set foldlevelstart=99
:au FocusLost * silent! wa "save all buffers when focus is lost
set guioptions-=L
set guifont=Menlo\ Regular:h13

" Supertab
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabLongestHighlight = 1

" UI
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
set wildmode=list:longest,list:full
set ruler
set backspace=indent,eol,start
set laststatus=2
set number

" set mouse=a
" set mousehide
set gcr=a:blinkon0

" Resize splits when the win{is resized
au VimResized * exe "normal! \<c-w>="

" Fix annoyances
nnoremap Q <nop>
nnoremap K <nop>
" keep curson in place when joining lines
nnoremap J mzJ`z

" Text Formatting
set tabstop=2
set shiftwidth=2
set expandtab
set nowrap
set textwidth=80

" Run tests
fun! RunTest(cmd)
  :w
  if filereadable('zeus.json')
    let s:prefix = "!zeus "
  else
    let s:prefix = "!zeus "
  endif
  execute(s:prefix . a:cmd)
endfu

" rspec
map <leader>R :call RunTest("rspec " . expand("%p") . " --no-color")<CR>
map <leader>r :call RunTest("rspec " . expand("%p") . ":" . line(".") . " --no-color")<CR>
" cucumber
map <leader>K :call RunTest("cucumber " . expand("%p"))<CR>
map <leader>k :call RunTest("cucumber " . expand("%p") . ":" . line("."))<CR>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" JSON
au BufRead,BufWrite,BufNewFile *.json set filetype=json foldmethod=syntax
au! FileType json command! -range=% -nargs=* Tidy <line1>,<line2>! json_xs -f json -t json-pretty

" Handlebars
au BufRead *.hbs set filetype=handlebars

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
augroup vimrcs
  au!
  au bufwritepost ~/.vimrc 
  \ source ~/.vimrc |
  \ if exists('g:Powerline_loaded') |
    \ silent! call Pl#Load() |
  \ endif 
augroup END

" Use Ag instead of Grep when available
let g:ackprg="ag -H --nogroup --column"
nnoremap <leader>a :Ag
nnoremap <leader>A :Ag <cword><CR>

" Spell checking
set spellfile+=~/.vim/spell/en.utf-8.add
set dict+=~/.vim/spell/en.utf-8.add
noremap <leader>ss :setlocal spell!<cr>
noremap <leader>sn ]s
noremap <leader>sp [s
noremap <leader>sa zg
noremap <leader>sd z=

" Buffer management
noremap <tab> :bn<CR>
noremap <S-tab> :bp<CR>
map <f4> <Plug>Kwbd

" reselect visual lock after indent/outdent
vnoremap < <gv
vnoremap > >gv

" easy split navigation
nnoremap <C-left> <C-w>h
nnoremap <C-down> <C-w>j
nnoremap <C-up> <C-w>k
nnoremap <C-right> <C-w>l

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

" Function Keys
map <F1> :set nowrap! <CR>
noremap <F2> :NERDTreeToggle<CR>
set pastetoggle=<F3>
" F5 Ctrlp refresh
nmap <F6> :%s/\s*$//<CR>:noh<CR>

" Git
autocmd BufRead COMMIT_EDITMSG setlocal spell!
autocmd BufRead COMMIT_EDITMSG setlocal nocursorline

" Ruby
au BufRead,BufNewFile {Capfile,Gemfile,Rakefile,Thorfile,Vagrantfile,Procfile,pryrc,config.ru,.caprc,.irbrc,irb_tempfile*} set ft=ruby

" Replace Ruby 1.8 style hashes with shorter Ruby 1.9 style
map <leader>h :%s/:\([^ ]*\)\(\s*\)=>/\1:/<CR>

" https://github.com/lucapette/vim-ruby-doc
let g:ruby_doc_command='open'

" Fugitive
nmap <leader>gs :Gstatus<CR><C-w>10+
noremap <leader>gc :Gcommit -v<CR><C-w>15+

" Rails.vim
map <Leader>m :Rmodel<space>
map <Leader>c :Rcontroller<space>
map <Leader>v :Rview<space>

" NERDTree
let g:NERDTreeQuitOnOpen=0
let g:NERDTreeShowBookmarks = 0
let g:NERDTreeWinPos = "left"
let g:NERDTreeWinSize = 25
let g:NERDTreeAutoDeleteBuffer=1
let NERDTreeShowHidden=0
let g:NERDTreeChDirMode=2

" ctrlp
map <leader>t :CtrlP<cr>
map <leader>b :CtrlPBuffer<cr>
map <leader>r :CtrlPMRUFiles<cr>
let g:ctrlp_custom_ignore = '\.git$\|tmp$\|_deploy$'
let g:ctrlp_working_path_mode = 2
let g:ctrlp_match_window_reversed = 1
let g:ctrlp_extensions = ['tag']

set wildignore+=*/.hg/*,*/.svn/*,*/vendor/cache/*,*/public/system/*,*/tmp/*,*/log/*,*/.git/*,*/.jhw-cache/*,*/solr/data/*,*/node_modules/*,*/.DS_Store
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o,*~,*.obj,.git/**,tmp/**,app/assets/images/**,public/**,*.class,*.doc,*.lock,**.png,**.jpg,**.jpeg
set wildignore+=*.sass-cache/**,build/**,coverage/**,_deploy/**,solr/**,doc/**,rdoc/**,spec/dummy/**

" Center screen when scrolling search results
nnoremap n nzz
nnoremap } }zz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" tComment
nmap // :TComment<CR>
vmap // :TComment<CR>

" Use only current file to autocomplete from tags
set complete=.,w,b,u,],t,i

" Ctags path (brew install ctags)
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'

autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

" Run tests
function! TubeThis(...) abort
  let l:cmd = []
  let l:path = expand('%')
 
  if filewritable('.zeus.sock')
    call add(l:cmd, 'zeus')
  elseif filereadable('Gemfile')
    call add(l:cmd, 'bundle exec')
  endif
 
  if l:path =~# '_spec\.rb$'
    let l:executable = 'rspec'
  else
    let l:executable = &ft
  end
 
  if exists('a:1')
    silent call extend(l:cmd, [l:executable, l:path . ':' . a:1])
  else
    silent call extend(l:cmd, [l:executable, l:path])
  end
 
  let l:cmd_string = join(l:cmd, ' ')
 
  exe 'Tube ' . l:cmd_string
endfunction

nmap <Leader>d :call TubeThis(line('.'))<CR>
nmap <Leader>D :call TubeThis()<CR>
nmap <Leader>§ :TubeLastCommand<CR>
