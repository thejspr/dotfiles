" vim: foldmethod=marker
" Plugins {{{
" Init {{{
set nocompatible
filetype off " must be off before Vundle has run
call plug#begin('~/.vim/plugged')
command! BI :PlugInstall
command! -bang BU :PlugInstall!
command! BC :PlugClean
" }}}

" Essentials {{{
Plug 'epmatsw/ag.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'JazzCore/ctrlp-cmatcher', { 'do': './install.sh' }
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-repeat'
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
" }}}

" Code navigation {{{
Plug 'nelstrom/vim-visual-star-search'
Plug 'terryma/vim-multiple-cursors'
" }}}

" Text {{{
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
" Plug 'chip/vim-fat-finger'
Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<s-c-l>"
let g:UltiSnipsEditSplit="vertical"
Plug 'thejspr/vim-snippets'
Plug 'AndrewRadev/splitjoin.vim'
nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>
" }}}

" File management & Git {{{
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
" Plug 'nelstrom/vim-qargs'
Plug 'kwbdi.vim'
" }}}

" Ruby {{{
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'sickill/vim-pasta'
Plug 'kana/vim-textobj-user'
runtime macros/matchit.vim
Plug 'nelstrom/vim-textobj-rubyblock'
"}}}

" Msc languages {{{
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-haml'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-ragtag'
let g:ragtag_global_maps = 1
Plug 'mattn/emmet-vim'
" let g:user_emmet_leader_key='<c-y>'
" let user_emmet_expandabbr_key = '<c-e>'
" Plug 'fatih/vim-go'
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
" }}}

" UI {{{
" iterm2 support
Plug 'sjl/vitality.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/seoul256.vim'
Plug 'restore_view.vim'
Plug 'bling/vim-airline'
let g:airline_powerline_fonts=0
let g:airline#extensions#hunks#enabled = 0
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_z=''
let g:airline#extensions#tabline#enabled = 1
Plug 'airblade/vim-gitgutter'
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
let g:gitgutter_map_keys = 0
" }}}

" tmux and testing {{{
Plug 'benmills/vimux'
Plug 'skalnik/vim-vroom'
let g:vroom_use_vimux = 1
let g:vroom_cucumber_path = 'spinach'
let g:vroom_use_colors = 0
let g:vroom_spec_command = 'rspec'
let g:vroom_rspec_version = '3.x'
" }}}

" new stuff {{{
" use - to open a nerdtree
Plug 'tpope/vim-vinegar'
Plug 'christoomey/vim-tmux-navigator'
" }}}

call plug#end()
filetype plugin indent on
" }}}

" Settings {{{
set shell=/usr/local/bin/zsh
set history=200
set nobackup
set nowritebackup
set noswapfile
set undofile
set undodir=~/.tmp,/tmp
set clipboard=unnamed
set foldnestmax=10
set foldenable
let macvim_skip_colorscheme=1

set ttyfast
set ttymouse=xterm2
set mouse=a
" }}}

" UI {{{
set background=dark
" set background=light
" colorscheme seoul256
try
  colorscheme solarized
catch /^Vim\%((\a\+)\)\=:E185/
endtry
hi clear SignColumn

syntax on
set nocursorcolumn
set nocursorline
set colorcolumn=80
set synmaxcol=140
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
set textwidth=80
set list listchars=tab:»·,trail:·

if has("gui_running")
  set guifont=Monaco:h12
endif
"}}}

" Key mappings {{{
let mapleader = "\<Space>"
map , <leader>

" tComment
nnoremap // :Commentary<CR>
vnoremap // :Commentary<CR>
" Buffer management
noremap <tab> :bn<CR>
noremap <S-tab> :bp<CR>
"}}}

" Msc annoyances {{{
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
cabbrev W w
cabbrev Wa wa
cabbrev Wq wq
cabbrev Wqa wqa
cabbrev ew wq
cabbrev qw wq

nnoremap <Leader>w :w<CR>
autocmd InsertLeave * if expand('%') != '' | update | endif

" Enter command with one keystroke
nnoremap ; :
nnoremap : ;
nnoremap ! :!

" Automatically jump to end of text you pasted
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" allow quit via single keypress (Q)
map Q :wqa<CR>
" }}}

" Searching {{{
set hlsearch
set incsearch
set smartcase
set gdefault
set showmatch

noremap <leader>, :noh<cr>
" nnoremap <space> /
noremap <leader>f :%s///<left><left>
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

" }}}

" Spell checking {{{
set spellfile+=~/.vim/spell/en.utf-8.add
set dict+=~/.vim/spell/en.utf-8.add
noremap <leader>ss :setlocal spell!<cr>
noremap <leader>sn ]s
noremap <leader>sp [s
noremap <leader>sa zg
noremap <leader>sd z=
autocmd BufRead COMMIT_EDITMSG setlocal spell! colorcolumn=72
"}}}

" Nerdtree & ctrlp {{{
" NERDTree
let g:NERDTreeQuitOnOpen=0
let g:NERDTreeShowBookmarks = 0
let g:NERDTreeWinSize = 25
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeChDirMode=2
let NERDTreeShowHidden=0
let NERDTreeHijackNetrw=1

" ctrlp
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_match_window = 'order:ttb,max:10'
let g:ctrlp_match_func = { 'match' : 'matcher#cmatch' }
set grepprg=ag\ --nogroup\ --nocolor
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_show_hidden = 1
let g:ctrlp_use_caching = 0
let g:ctrlp_mruf_relative = 1

noremap <leader>t :CtrlP<cr>
noremap <leader>b :CtrlPBuffer<cr>
noremap <leader>r :CtrlPMRUFiles<cr>

" Use Ag instead of Grep
let g:ackprg="ag -H --nogroup --column --nocolor -m 1000"
nnoremap <leader>a :Ag! <cword><CR>

set wildignore+=*/public/system/*,*/.git/*,*/node_modules/*,*/.DS_Store,*.svg
set wildignore+=*/tmp/*,tmp/**,**.png,**.jpg,**.jpeg
set wildignore+=*.sass-cache/**,build/**,coverage/**,_deploy/**,spec/dummy/**,dist/**
" }}}

" Edit .vimrc {{{
command! Ev :tabe ~/.vimrc
" Reload vimrc when saved
augroup vimrcs
  au!
  au bufwritepost ~/.vimrc source ~/.vimrc
augroup END
" }}}

" Function Keys {{{
noremap <F1> :set nowrap! <CR>
noremap <F2> :NERDTreeToggle<CR>
set pastetoggle=<F3>
nmap <f4> <Plug>Kwbd
noremap <F5> :NERDTreeFind<CR>
nnoremap <F6> :%s/\s*$//<CR>:noh<CR> " EOL whitespace removal
nnoremap <f7> :let &background = ( &background == "dark"? "light" : "dark")<CR>
" }}}

" Go, Text and Markdown {{{
autocmd bufreadpre *.gp setlocal nolist
autocmd bufreadpre */todos/* setlocal nolist
autocmd bufreadpre *.md setlocal textwidth=80 com=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,b:- formatoptions=tcroqln filetype=markdown
" }}}

" Ruby {{{
au BufRead,BufNewFile {Thorfile,Vagrantfile,Procfile,pryrc,config.ru} set ft=ruby
" au BufRead {app/*.rb,spec/.*rb} set path+=.

" Replace Ruby 1.8 style hashes with shorter Ruby 1.9 style
noremap <leader>h :%s/:\([^ ]*\)\(\s*\)=>/\1:/g<CR>

" Rails.vim
noremap <Leader>m :Emodel<space>
noremap <Leader>c :Econtroller<space>
noremap <Leader>v :Eview<space>
" }}}

" Tmux and testing {{{
nnoremap <Leader>x :VroomRunNearestTest<cr>
nnoremap <Leader>X :VroomRunTest<cr>
nnoremap <Leader>§ :wa<cr>:VimuxRunLastCommand<cr>
nmap <leader><space> :VimuxPromptCommand<cr>
" }}}

" New stuff {{{
" nnoremap   <Up>     <NOP>
" nnoremap   <Down>   <NOP>
" nnoremap   <Left>   <NOP>
" nnoremap   <Right>  <NOP>

" set lisp
" }}}

" vim: textwidth=120
