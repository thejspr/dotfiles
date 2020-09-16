" Plugins {{{
" Init {{{
set nocompatible
filetype off
call plug#begin('~/.vim/plugged')
" }}}

" Essentials {{{
Plug 'tpope/vim-repeat'
Plug 'ervandew/supertab'
Plug 'vim-scripts/kwbdi.vim'
Plug 'tpope/vim-obsession' " sessions mgmt
Plug '907th/vim-auto-save'
let g:auto_save = 1
let g:auto_save_silent = 1
let g:auto_save_events = ["InsertLeave", "TextChanged", "FocusLost"]
Plug 'neoclide/coc.nvim', {'branch': 'release'}
nmap gd <Plug>(coc-definition)
nmap gr <Plug>(coc-references)
" }}}

" Search & Code navigation {{{
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
noremap <leader>t :Files<cr>
noremap <leader>T :GFiles<cr>
noremap <leader>b :Buffers<cr>
noremap <leader>r :History<cr>
let g:fzf_layout = { 'down': '~30%' }
let g:fzf_history_dir = '~/.vim/history'

Plug 'mhinz/vim-grepper'
nnoremap <leader>a :GrepperRg <cword><CR>
nnoremap <leader>g :Grepper -tool rg<cr>
nnoremap <leader>G :Grepper -tool git<cr>
nnoremap <leader>* :Grepper -tool rg -cword -noprompt<cr>
vnoremap <leader>* :Grepper -tool rg -cword -noprompt<cr>
" }}}

" Text {{{
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'AndrewRadev/splitjoin.vim'
nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>
Plug 'terryma/vim-multiple-cursors'
" }}}

" File management & Git {{{
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb' " Gbrowse handlers for github
" }}}

" Ruby {{{
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'sickill/vim-pasta'
"}}}

" Msc languages {{{
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-ragtag'
let g:ragtag_global_maps = 1
Plug 'ludovicchabant/vim-gutentags'
let g:gutentags_trace = 0
Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript'

Plug 'mattn/emmet-vim'
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends': 'jsx',
\      'quote_char': "'",
\  },
\  'html' : { 'quote_char': "'" },
\  'erb' : { 'quote_char': "'" }
\}
"  }}}

" UI {{{
Plug 'gruvbox-community/gruvbox'
" Plug 'mhinz/vim-startify'
" let g:startify_change_to_dir = 0
" }}}

" tmux and testing {{{
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
let g:VimuxOrientation = "h"
let g:VimuxHeight = "45"
nnoremap <leader><space> :VimuxPromptCommand<cr>
Plug 'janko-m/vim-test'
let test#strategy = "vimux"
nmap <silent> <leader>x :TestNearest<CR>
nmap <silent> <leader>X :TestFile<CR>
nmap <silent> <leader>A :TestSuite<CR>
nmap <silent> <leader>q :VimuxRunLastCommand<CR>
let test#ruby#rspec#executable = 'bundle exec rspec'
" }}}

" new stuff {{{
" Plug 'jiangmiao/auto-pairs'
" au Filetype markdown let b:AutoPairs = {"(": ")"}
" let g:AutoPairsShortcutFastWrap = "<C-f>" "fixes issue with å
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1
let g:gitgutter_map_keys = 0
let g:gitgutter_enabled = 1
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
" }}}

call plug#end()
filetype plugin indent on
" }}}

" Settings {{{
set history=500
set nobackup
set nowritebackup
set noswapfile
set undofile
set undodir=~/.tmp,/tmp
set mouse=a
" }}}

" CoC {{{
set updatetime=300
" set shortmess+=c
" set cmdheight=2
set signcolumn=yes

let g:coc_global_extensions = ['coc-solargraph']

" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
"   let g:coc_global_extensions += ['coc-prettier']
" endif

" if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
"   let g:coc_global_extensions += ['coc-eslint']
" endif
" }}}

" Folding {{{
set foldenable
set foldnestmax=10
set foldlevelstart=10
set foldmethod=indent
" }}}

" UI {{{
" set termguicolors
source ~/.colorscheme.vim
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='hard'
colorscheme gruvbox

syntax on
set nocursorcolumn
set nocursorline
set colorcolumn=80
set synmaxcol=140
set title
set ffs=unix,mac,dos
set scrolloff=4
set autoindent
set smartindent
set showmode
set modeline
set showcmd
set hidden
set wildmenu
set wildmode=full
set ruler
set backspace=indent,eol,start
set laststatus=2
set statusline+=%f
set number
set splitbelow
set splitright
set infercase

" Resize splits when the win is resized
au VimResized * wincmd =

" https://bluz71.github.io/2017/05/15/vim-tips-tricks.html
set autoread
augroup autoRead
  autocmd!
  autocmd FocusLost * silent! wall
augroup END

" Text Formatting
set tabstop=2
set shiftwidth=2
set expandtab
set nowrap
set textwidth=80
set list listchars=tab:»·,trail:·
"}}}

" Key mappings {{{
map , <leader>

" Buffer management
noremap <tab> :bn<CR>
noremap <S-tab> :bp<CR>
"}}}

" Msc annoyances {{{
nnoremap K <nop>
" reselect visual lock after indent/outdent
vnoremap < <gv
vnoremap > >gv
" }}}

" Searching {{{
set hlsearch
set incsearch
set smartcase
set gdefault
set showmatch

" let g:gutentags_ctags_executable='/usr/local/bin/ctags'
set wildignore+=node_modules/*,bower_components/*
set wildignore+=app/assets/images/**/*
set wildignore+=vendor/cache/**/*

noremap <leader>, :noh<cr>
nnoremap <space> /
noremap <leader>f :%s///<left><left>
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" |
  \ endif
" }}}

" Spell checking {{{
set spellfile+=~/.vim/spell/en.utf-8.add
set dict+=~/.vim/spell/en.utf-8.add
noremap <leader>ss :setlocal spell!<cr>
noremap <leader>sn ]s
noremap <leader>sp [s
noremap <leader>sa zg
noremap <leader>sd z=
au BufRead,BufNewFile COMMIT_EDITMSG setlocal ft=diff spell!
"}}}

" Nerdtree {{{
let g:NERDTreeQuitOnOpen=0
let g:NERDTreeShowBookmarks = 0
let g:NERDTreeWinSize = 24
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeChDirMode=2
let NERDTreeShowHidden=0
let NERDTreeNaturalSort=1
noremap tt :NERDTreeToggle<CR>
" }}}

" Edit .vimrc {{{
command! Ev :e ~/.vimrc
" }}}

" Function Keys {{{
set pastetoggle=<F3>
" }}}

" Ruby {{{
" Rails.vim
noremap <Leader>m :Emodel<space>
noremap <Leader>c :Econtroller<space>
noremap <Leader>v :Eview<space>
" }}}

" New stuff {{{
inoremap jj <esc>
inoremap jk <esc>
map <c-x> <Plug>Kwbd<CR>
au BufReadPost *.html set formatoptions-=t
noremap ff :set foldlevel=1<cr>
noremap fa :set foldlevel=20<cr>
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
cnoreabbrev pu PlugUpdate
command! Es :e ~/Dropbox/scratch.md
" }}}

set encoding=utf-8
setglobal fileencoding=utf-8
set scrolloff=25

" vim: foldmethod=marker:foldlevel=1:textwidth=100:colorcolumn=100
