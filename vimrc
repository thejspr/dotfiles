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
Plug 'roxma/vim-paste-easy'
Plug 'vimwiki/vimwiki'
let g:vimwiki_list = [{'path': '~/Dropbox/notes/', 'syntax': 'markdown',
      \ 'ext': '.md', 'diary_rel_path': 'journal/'}]
let g:vimwiki_global_ext = 0
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
Plug 'terryma/vim-multiple-cursors'
" }}}

" File management & Git {{{
" Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-eunuch'

Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb' " Gbrowse handlers for github
Plug 'mhinz/vim-signify'
" }}}

" Ruby {{{
Plug 'dense-analysis/ale'
let g:ale_linters = {
      \   'ruby': ['rubocop'],
      \   'javascript': ['eslint'],
      \}

let g:ale_fixers = {
      \ 'ruby': ['rubocop'],
      \ 'sql': ['pgformatter']
      \}
let b:ale_sql_pgformatter_options = '--spaces 2 --wrap-after 10'
" let g:ale_fix_on_save = 1

" Plug 'vim-ruby/vim-ruby'
" Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'sickill/vim-pasta'
Plug 'tpope/vim-haml'
"}}}

" Msc languages {{{
Plug 'plasticboy/vim-markdown'
" Plug 'tpope/vim-ragtag'
" let g:ragtag_global_maps = 1
Plug 'pangloss/vim-javascript'

Plug 'mattn/emmet-vim'
let g:user_emmet_install_global = 0
autocmd FileType html,css,eruby EmmetInstall
let g:user_emmet_leader_key='<C-E>'
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends': 'jsx',
\      'quote_char': "'",
\  },
\  'html' : { 'quote_char': "'" },
\  'erb' : { 'quote_char': "'" }
\}
"  }}}

" tmux and testing {{{
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
let g:VimuxOrientation = "h"
let g:VimuxHeight = "45"
nmap <leader><space> :VimuxPromptCommand<cr>
nmap <silent> <leader>q :VimuxRunLastCommand<CR>
Plug 'janko-m/vim-test'
let test#strategy = "vimux"
nmap <silent> <leader>x :TestNearest<CR>
nmap <silent> <leader>X :TestFile<CR>
nmap <silent> <leader>A :TestSuite<CR>
" let test#ruby#rspec#executable = 'bundle exec rspec'
" }}}

" UI {{{
Plug 'altercation/vim-colors-solarized'
Plug 'itchyny/lightline.vim'
let g:lightline = {
      \ 'component_function': {
      \   'filename': 'FullFilename',
      \ },
      \ }
function! FullFilename()
  return expand('%F')
endfunction
" }}}

" New {{{
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
noremap tt :CHADopen<CR>
let g:chadtree_settings = { 'view': { 'width': 30 } }
Plug 'Yggdroot/indentLine'
let g:indentLine_color_term = 253
" }}}

call plug#end()
filetype plugin indent on
" }}}

" CoC {{{
set updatetime=100
set signcolumn=yes
set shortmess+=c
let g:coc_global_extensions = ['coc-solargraph']
" }}}

" UI {{{
source ~/.colorscheme.vim
colorscheme solarized
call togglebg#map("<F5>")

syntax on
set colorcolumn=80
set synmaxcol=140
set title
set ffs=unix,mac,dos
set scrolloff=25
set autoindent
set smartindent
set showmode
set modeline
set showcmd
set hidden
set wildmode=full
set ruler
set backspace=indent,eol,start
set laststatus=2
set number
set splitbelow
set splitright

set encoding=utf-8
setglobal fileencoding=utf-8

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

" Settings {{{
set history=500
set nobackup
set nowritebackup
set noswapfile
set undofile
set undodir=~/.tmp,/tmp
set mouse=a
" }}}

" Folding {{{
set foldenable
set foldnestmax=10
set foldlevelstart=10
set foldmethod=indent
nmap f1 :set foldlevel=1<cr>
nmap f2 :set foldlevel=2<cr>
nmap fa :set foldlevel=99<cr>
" }}}

" Key mappings {{{
map , <leader>

" Buffer management
nnoremap <tab> :bn<CR>
nnoremap <S-tab> :bp<CR>
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
set ignorecase
set smartcase
set gdefault
set showmatch

set wildignore+=node_modules/*
set wildignore+=app/assets/images/**/*
set wildignore+=vendor/cache/**/*

nnoremap <leader>, :noh<cr>
nnoremap <space> /
nnoremap <leader>f :%s///<left><left>
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
" au BufRead,BufNewFile *.md setlocal spell!
"}}}

" Nerdtree {{{
" let g:NERDTreeQuitOnOpen=0
" let g:NERDTreeShowBookmarks = 0
" let g:NERDTreeWinSize = 24
" let g:NERDTreeAutoDeleteBuffer=1
" let g:NERDTreeChDirMode=2
" let NERDTreeShowHidden=0
" let NERDTreeNaturalSort=1
" }}}

" Edit .vimrc {{{
command! Ev :e ~/.vimrc
augroup vimrc
  autocmd!
  au bufwritepost .vimrc source $MYVIMRC
  au bufread .vimrc set foldmethod=marker
augroup END
" }}}

" Function Keys {{{
set pastetoggle=<F3>
" }}}

" Ruby {{{
noremap <Leader>m :Emodel<space>
noremap <Leader>c :Econtroller<space>
" }}}

" New stuff {{{
map <c-x> <Plug>Kwbd<CR>
au BufReadPost *.html* set formatoptions-=t
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
command! Es :e ~/Dropbox/scratch.md
nnoremap <leader>F :ALEFix<cr>

autocmd TermOpen * startinsert
command! -nargs=* T split | resize 25 | terminal <args>
nnoremap <leader>c :T<cr>
" }}}
