" Bundles {{{
" Init {{{
if !isdirectory(expand("~/.vim/bundle/vundle/.git"))
  !git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
endif
filetype off " must be off before Vundle has run

set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

command! BI :BundleInstall
command! -bang BU :BundleInstall!
command! BC :BundleClean
" }}}

" Essentials {{{
Bundle 'epmatsw/ag.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'Raimondi/delimitMate'
Bundle 'gcmt/tube.vim'
Bundle 'tpope/vim-repeat'
" }}}

" Code navigation {{{
" Bundle 'Lokaltog/vim-easymotion'
Bundle 'nelstrom/vim-visual-star-search'
Bundle 'terryma/vim-multiple-cursors'
" }}}

" Text {{{
Bundle 'tpope/vim-surround'
Bundle 'tomtom/tcomment_vim'
Bundle 'ervandew/supertab'
Bundle 'godlygeek/tabular'
Bundle 'chip/vim-fat-finger'
Bundle 'AndrewRadev/switch.vim'
nnoremap - :Switch<cr>
Bundle 'SirVer/ultisnips'
" }}}

" File management & Git {{{
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-eunuch'
Bundle 'kwbdi.vim'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'
" }}}

" Ruby {{{
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-bundler'
Bundle 'sickill/vim-pasta'
let g:pasta_disabled_filetypes = ['sass', 'coffee', 'yaml']
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
"}}}

" JavaScript {{{
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
" }}}

" Markup languages {{{
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-haml'
Bundle 'slim-template/vim-slim'
Bundle 'tpope/vim-ragtag'
Bundle 'mattn/emmet-vim'
" let g:user_emmet_leader_key = '<C-q>'
" }}}

" UI {{{
" iterm2 support
Bundle 'sjl/vitality.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'restore_view.vim'
Bundle 'regedarek/ZoomWin'
Bundle 'bling/vim-airline'
let g:airline_theme='simple'
let g:airline_enable_bufferline=0
let g:airline_powerline_fonts=1
" }}}

" Clojure {{{
" Bundle 'tpope/vim-fireplace'
" Bundle 'tpope/vim-classpath'
" Bundle 'guns/vim-clojure-static'
" Bundle 'kien/rainbow_parentheses.vim'
" au VimEnter *.clj RainbowParenthesesToggle
" au Syntax *.clj RainbowParenthesesLoadRound
" au Syntax *.clj RainbowParenthesesLoadSquare
" au Syntax *.clj RainbowParenthesesLoadBraces
"}}}

" new stuff {{{
Bundle "zweifisch/pipe2eval"
Bundle "fisadev/vim-ctrlp-cmdpalette"
Bundle "sk1418/Join"
" }}}

" Outro {{{
filetype plugin indent on
runtime macros/matchit.vim
" }}}
" }}}

" Settings {{{
set nocompatible " be iMproved
set history=200
set nobackup
set nowritebackup
set notimeout
set noswapfile
set undofile
set undodir=~/.tmp,/tmp
:au FocusLost * silent! wa "save all buffers when focus is lost
set formatoptions-=or " do not continue comments on newlines
set clipboard=unnamed
set mouse=a
" }}}

" UI {{{
set background=dark
" set background=light
map <f7> :let &background = ( &background == "dark"? "light" : "dark")<CR>
colorscheme solarized

set guioptions-=L
set guifont=Menlo\ Regular:h14

syntax on
set nocursorcolumn
set nocursorline
set colorcolumn=80
set synmaxcol=200

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
set splitbelow
set splitright

" Resize splits when the win{is resized
au VimResized * wincmd =

" Text Formatting
set tabstop=2
set shiftwidth=2
set expandtab
set nowrap
set list listchars=trail:·
"}}}

" Key mappings {{{
let mapleader = ","
let g:mapleader = ","

nnoremap <CR> :write<CR>

" tComment
nnoremap // :TComment<CR>
vnoremap // :TComment<CR>

" Auto format
noremap === mmgg=G`m^zz
"}}}

" UltiSnips {{{
set runtimepath+=~/.vim/bundle/ultisnips
"}}}

" Tab key {{{
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabLongestHighlight = 1

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
" }}}

" Msc annoyances {{{
nnoremap Q <nop>
nnoremap K <nop>
nnoremap J mzJ`z " keep cursor in place when joining lines

" reselect visual lock after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Center screen when scrolling search results
nnoremap n nzz
nnoremap } }zz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" improve movement on wrapped lines
nnoremap j gj
nnoremap k gk

" Fix save annoyances
cnoreabbrev W w
cnoreabbrev Wa wa
cnoreabbrev Wq wq
cnoreabbrev Wqa wqa
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
" }}}

" Searching {{{
set hlsearch
set incsearch
set smartcase
set gdefault
set showmatch

nnoremap <leader><space> :nohlsearch<cr>
nnoremap <space> /
noremap <m-space> ?
" find/replace shortcut
noremap <leader>f :%s///<left><left>
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

" Use Ag instead of Grep when available
let g:ackprg="ag -H --nogroup --column --nocolor -m 1000"
nnoremap <leader>a :Ag! <cword><CR>
nnoremap \ :Ag<SPACE>
" }}}

" Movement and navigation {{{
" Buffer management
noremap <tab> :bn<CR>
noremap <S-tab> :bp<CR>
nnoremap <leader>l :ls<cr>:b<space>

" easy split navigation
nnoremap <C-left> <C-w>h
nnoremap <C-down> <C-w>j
nnoremap <C-up> <C-w>k
nnoremap <C-right> <C-w>l

" move lines vertivally
noremap <C-j> :m+<CR>
noremap <C-k> :m-2<CR>
inoremap <C-j> <Esc>:m+<CR>
inoremap <C-k> <Esc>:m-2<CR>
vnoremap <C-j> :m'>+<CR>gv
vnoremap <C-k> :m-2<CR>gv
" }}}

" Spell checking {{{
set spellfile+=~/.vim/spell/en.utf-8.add
set dict+=~/.vim/spell/en.utf-8.add
noremap <leader>ss :setlocal spell!<cr>
noremap <leader>sn ]s
noremap <leader>sp [s
noremap <leader>sa zg
noremap <leader>sd z=
"}}}

" Folding {{{
set foldnestmax=10
set foldenable
" }}}

" Nerdtree & ctrlp {{{
" NERDTree
let g:NERDTreeQuitOnOpen=0
let g:NERDTreeShowBookmarks = 0
let g:NERDTreeWinPos = "left"
let g:NERDTreeWinSize = 25
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeChDirMode=2
let NERDTreeShowHidden=0
let NERDTreeHijackNetrw=1

" ctrlp
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|mp3|)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py|_site|gh-pages|dist|bower_components|.tmp|images'
let g:ctrlp_match_window_reversed = 1
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 1

noremap <leader>t :CtrlP<cr>
noremap <leader>b :CtrlPBuffer<cr>
noremap <leader>r :CtrlPMRUFiles<cr>

" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

set wildignore+=*/vendor/cache/*,*/public/system/*,*/tmp/*,*/.git/*,*/node_modules/*,*/.DS_Store
set wildignore+=*/tmp/*,*.so,*.swp,*.o,*~,*.obj,tmp/**,app/assets/images/**,*.class,*.lock,**.png,**.jpg,**.jpeg
set wildignore+=*.sass-cache/**,build/**,coverage/**,_deploy/**,spec/dummy/**,dist/**
" }}}

" Edit .vimrc {{{
command! Ev :e ~/.vimrc
" Reload vimrc when saved
augroup vimrcs
  au!
  au bufwritepost ~/.vimrc
  \ source ~/.vimrc |
  \ if exists('g:Powerline_loaded') |
    \ silent! call Pl#Load() |
  \ endif
augroup END
" }}}

" Function Keys {{{
noremap <F1> :set nowrap! <CR>
noremap <F2> :NERDTreeToggle<CR>
set pastetoggle=<F3>
nmap <f4> <Plug>Kwbd
" F5 Ctrlp refresh
nnoremap <F6> :%s/\s*$//<CR>:noh<CR> " EOL whitespace removal
" }}}

" Ruby {{{
au BufRead,BufNewFile {Capfile,Gemfile,Rakefile,Thorfile,Vagrantfile,Procfile,pryrc,config.ru,.caprc,.irbrc,irb_tempfile*} set ft=ruby

" Replace Ruby 1.8 style hashes with shorter Ruby 1.9 style
noremap <leader>h :%s/:\([^ ]*\)\(\s*\)=>/\1:/<CR>

" Rails.vim
noremap <Leader>m :Rmodel<space>
" noremap <Leader>c :Rcontroller<space>
noremap <Leader>v :Rview<space>
" }}}

" JavaScript & JSON {{{
au BufRead,BufWrite,BufNewFile *.json set filetype=json foldmethod=syntax
au! FileType json command! -range=% -nargs=* Tidy <line1>,<line2>! json_xs -f json -t json-pretty

au BufRead *.hbs set filetype=handlebars
au FileType handlebars runtime! ftplugin/html/sparkup.vim

function! FormatJson()
  set ft=json
  exe '%!python -m json.tool'
endfunction
" }}}

" Git {{{
" Fugitive
nnoremap <leader>gs :Gstatus<CR><C-w>10+
noremap <leader>gc :Gcommit -v<CR><C-w>15+

autocmd BufRead COMMIT_EDITMSG setlocal spell!
autocmd BufRead COMMIT_EDITMSG setlocal nocursorline
autocmd BufRead COMMIT_EDITMSG setlocal colorcolumn=72
" }}}

" Tube.vim {{{
let g:tube_terminal = 'iterm'
let g:tube_always_clear_screen = 0

function! TubeThis(...) abort
  let l:cmd = []
  let l:path = expand('%')

  if l:path =~# '_spec'
    if filereadable('script/server')
      let l:executable = 'script/spec'
    else
      let l:executable = 'be rspec'
    endif
  else
    let l:executable = &ft
    if filereadable('Gemfile')
      silent call add(l:cmd, 'be')
    endif
  endif

  if exists('a:1')
    silent call extend(l:cmd, [l:executable, l:path . ':' . a:1])
  else
    silent call extend(l:cmd, [l:executable, l:path])
  end

  if filereadable('.spork')
    silent call add(l:cmd, '--drb')
  endif

  let l:cmd_string = join(l:cmd, ' ')

  exe 'Tube ' . l:cmd_string
endfunction

nnoremap <Leader>x :call TubeThis(line('.'))<CR>
nnoremap <Leader>X :call TubeThis()<CR>
nnoremap <Leader>§ :TubeLastCmd<CR>
" }}}

" Statusline {{{
" let g:Powerline_symbols = 'unicode'
let g:Powerline_theme = 'solarized256'
let g:Powerline_colorscheme = 'solarized256'
"}}}

" New stuff {{{
command! Es :vsplit ~/Dropbox/scratch.txt

" inoremap  <Up>     <NOP>
" inoremap  <Down>   <NOP>
" inoremap  <Left>   <NOP>
" inoremap  <Right>  <NOP>
" noremap   <Up>     <NOP>
" noremap   <Down>   <NOP>
" noremap   <Left>   <NOP>
" noremap   <Right>  <NOP>
"}}

" vim: foldmethod=marker
