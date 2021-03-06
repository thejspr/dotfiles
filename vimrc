" Plugins {{{
" Init {{{
set nocompatible
filetype off
call plug#begin('~/.vim/plugged')
" }}}

" Essentials {{{
Plug 'tpope/vim-repeat'
Plug 'ervandew/supertab'
Plug 'tpope/vim-obsession' " sessions mgmt
Plug '907th/vim-auto-save'
let g:auto_save = 1
let g:auto_save_silent = 1
let g:auto_save_events = ["InsertLeave", "TextChanged", "FocusLost"]

Plug 'neoclide/coc.nvim', {'branch': 'release'}
nmap gd <Plug>(coc-definition)
nmap gr <Plug>(coc-references)
" Requires: :CocInstall coc-explorer
noremap tt :CocCommand explorer<CR>

Plug 'roxma/vim-paste-easy'
Plug 'vimwiki/vimwiki'
let g:vimwiki_list = [{'path': '~/Dropbox/notes/', 'syntax': 'markdown',
      \ 'ext': '.md', 'diary_rel_path': 'journal/'}]
let g:vimwiki_global_ext = 0
Plug 'moll/vim-bbye'
map <c-x> :Bdelete<CR>
" }}}

" Search & Code navigation {{{
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
noremap <leader>t :Files<cr>
noremap <leader>b :Buffers<cr>
noremap <leader>r :History<cr>
let g:fzf_layout = { 'down': '~30%' }
let g:fzf_history_dir = '~/.vim/history'

Plug 'mhinz/vim-grepper'
nnoremap <leader>a :GrepperRg <cword><CR>
nnoremap <leader>g :Grepper -tool rg<cr>
" }}}

" Text {{{
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'mg979/vim-visual-multi'
" }}}

" File management & Git {{{
Plug 'tpope/vim-eunuch' " File command helpers: Rename, Delete etc.
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb' " Gbrowse handlers for github
Plug 'mhinz/vim-signify' " Git signs column
Plug 'pbrisbin/vim-mkdir' " Automatically create new folders for files
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
nnoremap <leader>F :ALEFix<cr>

Plug 'tpope/vim-rails'
Plug 'sickill/vim-pasta'
let g:pasta_disabled_filetypes = ['yaml']
Plug 'tpope/vim-haml'
"}}}

" Msc languages {{{
Plug 'pangloss/vim-javascript'

" Plug 'mattn/emmet-vim'
" let g:user_emmet_install_global = 0
" autocmd FileType html,css,eruby EmmetInstall
" let g:user_emmet_leader_key='<C-E>'
" let g:user_emmet_settings = {
" \  'javascript.jsx' : {
" \      'extends': 'jsx',
" \      'quote_char': "'",
" \  },
" \  'html' : { 'quote_char': "'" },
" \  'erb' : { 'quote_char': "'" }
" \}
"  }}}

" tmux and testing {{{
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
let g:VimuxOrientation = "h"
let g:VimuxHeight = "45"
nmap <leader><space> :VimuxPromptCommand<cr>
nmap <silent> <leader>q :VimuxRunLastCommand<CR>
Plug 'janko-m/vim-test'
" let g:test#preserve_screen = 0
let test#strategy = "vimux"
" let test#strategy = "neovim"
let test#neovim#term_position = "vert"
nmap <silent> <leader>x :TestNearest<CR>
nmap <silent> <leader>X :TestFile<CR>
" nmap <silent> <CR> :TestFile<CR>
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
Plug 'Yggdroot/indentLine'
let g:indentLine_char = '┊'
let g:indentLine_bufNameExclude = ['NERD_tree.*', 'fzf']
Plug 'junegunn/goyo.vim'
let g:goyo_width = 85
Plug 'dstein64/vim-startuptime'
" }}}

call plug#end()
filetype plugin indent on
" }}}

" CoC {{{
set updatetime=300
set signcolumn=yes
set shortmess+=c
let g:coc_global_extensions = ['coc-solargraph']
" }}}

" UI {{{
set background=light
colorscheme solarized
call togglebg#map("<F5>")

if &background == 'dark'
  let g:indentLine_color_term = 238
else
  let g:indentLine_color_term = 253
endif

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
map <space> <leader>

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
" nnoremap <space> /
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
au BufReadPost *.html* set formatoptions-=t

if has("nvim")
  " Terminal inside vim
  autocmd TermOpen * startinsert
  command! -nargs=* T split | resize 25 | terminal <args>
  nnoremap <leader>c :T<cr>
endif
noremap <C-q> <C-w>q
noremap <f1> <Nop>
" nmap <silent>gx :sil !xdg-open <c-r><c-a><cr>
" let g:netrw_browsex_viewer= "xdg-open"
nmap <silent> gx :!xdg-open <cWORD><cr>
" }}}
