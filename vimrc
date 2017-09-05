" Plugins {{{
" Init {{{
set nocompatible
filetype off
call plug#begin('~/.vim/plugged')
" }}}

" Essentials {{{
" Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-repeat'
Plug 'ervandew/supertab'
Plug 'junegunn/fzf', { 'do': './install --all' }
noremap <leader>t :FZF<cr>
let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'
let g:fzf_layout = { 'down': '~20%' }
" }}}

" Search & Code navigation {{{
Plug 'terryma/vim-multiple-cursors'
Plug 'mhinz/vim-grepper'

" Use Ripgrep instead of Grep
" set grepprg=rg\ --vimgrep\ --no-heading'
" set grepformat=%f:%l:%c:%m,%f:%l:%m
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
let g:user_emmet_settings={'javascript.jsx': {'extends':'jsx'}}
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
Plug 'kana/vim-textobj-user'
runtime macros/matchit.vim
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'tpope/vim-bundler'
"}}}

" Msc languages {{{
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-ragtag'
let g:ragtag_global_maps = 1
" }}}

" UI {{{
" iterm2 support
Plug 'sjl/vitality.vim'
Plug 'bling/vim-airline'
" let g:airline_powerline_fonts=0
" let g:airline#extensions#hunks#enabled = 0
let g:airline_left_sep=''
let g:airline_right_sep=''
" let g:airline_section_z=''
let g:airline#extensions#tabline#enabled = 1
Plug 'airblade/vim-gitgutter'
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
let g:gitgutter_map_keys = 0
Plug 'altercation/vim-colors-solarized'
" }}}

" tmux and testing {{{
Plug 'benmills/vimux'
nnoremap <leader><space> :VimuxPromptCommand<cr>
Plug 'janko-m/vim-test'
let test#strategy = "vimux"
" let test#custom_strategies = {
"   \ 'nearest': 'basic',
"   \ 'file':    'basic',
"   \ 'suite':   'neovim',
" \}
nmap <silent> <leader>x :TestNearest<CR>
nmap <silent> <leader>X :TestFile<CR>
nmap <silent> <leader>A :TestSuite<CR>
nmap <silent> <leader>r :VimuxRunLastCommand<CR>
" nmap <silent> <leader>g :TestVisit<CR>
" }}}

" javascript {{{
Plug 'elzr/vim-json'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'sbdchd/neoformat'
" }}}

" new stuff {{{
Plug 'tpope/vim-obsession'
Plug 'ajh17/VimCompletesMe'
autocmd FileType text,markdown let b:vcm_tab_complete = 'dict'
Plug 'ludovicchabant/vim-gutentags'
Plug 'wikitopian/hardmode'
let g:HardMode_level='wannabe'
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
nnoremap <leader>e <Esc>:call ToggleHardMode()<CR>
Plug 'w0rp/ale'
let g:ale_fixers = {
  \ 'javascript': ['eslint']
  \ }
let g:ale_linters = {
  \ 'javascript': ['eslint'],
  \ 'eruby': ['']
  \ }
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
Plug 'morhetz/gruvbox'
" }}}

call plug#end()
filetype plugin indent on
" }}}

let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" Settings {{{
set shell=/usr/local/bin/zsh
set history=200
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
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" set termguicolors
try
  set background=dark
  " set background=light
  " colorscheme solarized
  colorscheme gruvbox
catch /:E185/
endtry

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
set number
set splitbelow
set splitright
set infercase

" Resize splits when the win is resized
au VimResized * wincmd =

" https://bluz71.github.io/2017/05/15/vim-tips-tricks.html
set autoread
" augroup autoSaveAndRead
"   autocmd!
"   autocmd TextChanged,InsertLeave,FocusLost * silent! wall
"   " autocmd CursorHold * silent! checktime
" augroup END

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
" let mapleader = "\<Space>"
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

" Enter command with one keystroke
" nnoremap ; :
" nnoremap : ;
" nnoremap ! :!

" Automatically jump to end of text you pasted
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Move windows with ctrl + home row
nmap <C-h> :wincmd h<CR>
nmap <C-j> :wincmd j<CR>
nmap <C-k> :wincmd k<CR>
nmap <C-l> :wincmd l<CR>
" }}}

" Searching {{{
set hlsearch
set incsearch
set smartcase
set gdefault
set showmatch

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

" Nerdtree & ctrlp {{{
" NERDTree
let g:NERDTreeQuitOnOpen=0
let g:NERDTreeShowBookmarks = 0
let g:NERDTreeWinSize = 25
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeChDirMode=2
let NERDTreeShowHidden=0
let NERDTreeHijackNetrw=1
" }}}

" Edit .vimrc {{{
command! Ev :e ~/.vimrc
" }}}

" Function Keys {{{
noremap <F1> :set nowrap! <CR>
noremap <F2> :NERDTreeToggle<CR>
set pastetoggle=<F3>
nmap <f4> <Plug>Kwbd
noremap <F5> :NERDTreeFind<CR>
nnoremap <F6> :%s/\s*$//<CR>:noh<CR> " EOL whitespace removal
" }}}

" Ruby {{{
au BufRead,BufNewFile {Thorfile,Vagrantfile,Procfile,pryrc,config.ru} set ft=ruby

" Replace Ruby 1.8 style hashes with shorter Ruby 1.9 style
noremap <leader>h :%s/:\([^ ]*\)\(\s*\)=>/\1:/g<CR>

" Rails.vim
noremap <Leader>m :Emodel<space>
noremap <Leader>c :Econtroller<space>
noremap <Leader>v :Eview<space>
" }}}

" New stuff {{{
" Move lines with alt + home row
noremap <m-k> :call feedkeys( line('.')==1 ? '' : 'ddkP' )<CR>
noremap <m-j> ddp

function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

" buffer search/switch
nnoremap <silent> <Leader>b :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>
" }}}

" vim: foldmethod=marker:foldlevel=1:textwidth=120:colorcolumn=120
