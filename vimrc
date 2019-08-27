" Plugins {{{
" Init {{{
set nocompatible
filetype off
call plug#begin('~/.vim/plugged')
" }}}

" Essentials {{{
Plug 'tpope/vim-repeat'
Plug 'ervandew/supertab'
" }}}

" Search & Code navigation {{{
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
noremap <leader>t :Files<cr>
noremap <leader>T :GFiles<cr>
noremap <leader>b :Buffers<cr>
noremap <leader>r :History<cr>
let g:fzf_layout = { 'down': '~25%' }
let g:fzf_history_dir = '~/.vim/history'
Plug 'mhinz/vim-grepper'
nnoremap <leader>a :GrepperRg <cword><CR>
nnoremap <leader>g :Grepper -tool rg<cr>
nnoremap <leader>G :Grepper -tool git<cr>
nnoremap <leader>* :Grepper -tool rg -cword -noprompt<cr>
vnoremap <leader>* :Grepper -tool rg -cword -noprompt<cr>
" }}}

" Text {{{
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
Plug 'AndrewRadev/splitjoin.vim'
nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>
Plug 'mattn/emmet-vim'
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends': 'jsx',
\      'quote_char': "'",
\  },
\  'html' : { 'quote_char': "'" },
\  'erb' : { 'quote_char': "'" }
\}
Plug 'terryma/vim-multiple-cursors'
" }}}

" File management & Git {{{
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/kwbdi.vim'
" }}}

" Ruby {{{
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'sickill/vim-pasta'
"}}}

" Msc languages {{{
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-ragtag'
let g:ragtag_global_maps = 1
" Plug 'ludovicchabant/vim-gutentags'
let g:gutentags_trace = 0
Plug 'sheerun/vim-polyglot'

let g:ale_linters_explicit = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_fixers = {
  \ 'javascript': ['eslint'],
  \ 'ruby': ['rubocop'],
  \ 'scss': ['prettier'],
  \ 'html': ['prettier']
  \ }
let g:ale_linters = {
  \ 'javascript': ['eslint'],
  \ 'eruby': [''],
  \ 'ruby': ['rubocop']
  \ }
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0
Plug 'w0rp/ale'
" }}}

" UI {{{
" iterm2 support
Plug 'sjl/vitality.vim'
Plug 'itchyny/lightline.vim'
Plug 'chriskempson/base16-vim'
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
nmap <silent> <leader>§ :VimuxRunLastCommand<CR>
" }}}

" new stuff {{{
Plug 'tpope/vim-obsession'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
Plug '907th/vim-auto-save'
let g:auto_save = 1
let g:auto_save_silent = 0
let g:auto_save_events = ["InsertLeave", "TextChanged", "FocusLost"]
" }}}

call plug#end()
filetype plugin indent on
" }}}

" Settings {{{
set shell=/usr/local/bin/zsh
set history=500
set nobackup
set nowritebackup
set noswapfile
set undofile
set undodir=~/.tmp,/tmp

set mouse=a
set iskeyword-=.
" }}}

" Folding {{{
set foldenable
set foldnestmax=10
set foldlevelstart=10
set foldmethod=indent
" }}}

" UI {{{
set termguicolors
set background=light
colorscheme base16-tomorrow
" set background=dark
" colorscheme base16-tomorrow-night

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

" Automatically jump to end of text you pasted
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
" }}}

" Searching {{{
set hlsearch
set incsearch
set smartcase
set gdefault
set showmatch

let g:gutentags_ctags_executable='/usr/local/bin/ctags'
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
let NERDTreeHijackNetrw=1
let NERDTreeNaturalSort=1
noremap tt :NERDTreeToggle<CR>
" }}}

" Edit .vimrc {{{
command! Ev :e ~/.vimrc
" }}}

" Function Keys {{{
set pastetoggle=<F3>
nnoremap <F6> :%s/\s*$//<CR>:noh<CR> " EOL whitespace removal
" }}}

" Ruby {{{
" Replace Ruby 1.8 style hashes with shorter Ruby 1.9 style
noremap <leader>h :%s/:\([^ ]*\)\(\s*\)=>/\1:/g<CR>

" Rails.vim
noremap <Leader>m :Emodel<space>
noremap <Leader>c :Econtroller<space>
noremap <Leader>v :Eview<space>
" }}}

" New stuff {{{
" Make `jj` and `jk` throw you into normal mode
inoremap jj <esc>
inoremap jk <esc>
map <c-x> <Plug>Kwbd<CR>
noremap <Leader>F :ALEFix<CR>
au BufReadPost *.html set formatoptions-=t
" }}}

" vim: foldmethod=marker:foldlevel=1:textwidth=120:colorcolumn=120
