" vim: foldmethod=marker
" Plugins {{{
" Init {{{
set nocompatible
filetype off " must be off before Vundle has run
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
command! BI :PluginInstall
command! -bang BU :PluginInstall!
command! BC :PluginClean
" }}}

" Essentials {{{
Plugin 'epmatsw/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'JazzCore/ctrlp-cmatcher'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-repeat'
Plugin 'Valloric/YouCompleteMe'
" }}}

" Code navigation {{{
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'terryma/vim-multiple-cursors'
" }}}

" Text {{{
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'godlygeek/tabular'
Plugin 'chip/vim-fat-finger'
Plugin 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-e>"
let g:UltiSnipsJumpBackwardTrigger="<s-c-e>"
let g:UltiSnipsEditSplit="vertical"
Plugin 'thejspr/vim-snippets'
Plugin 'AndrewRadev/splitjoin.vim'
" }}}

" File management & Git {{{
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-fugitive'
Plugin 'nelstrom/vim-qargs'
Plugin 'kwbdi.vim'
" }}}

" Ruby {{{
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails'
Plugin 'sickill/vim-pasta'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'tpope/vim-cucumber'
"}}}

" Msc languages {{{
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-haml'
Plugin 'slim-template/vim-slim'
Plugin 'tpope/vim-ragtag'
let g:ragtag_global_maps = 1
Plugin 'mattn/emmet-vim'
let g:user_emmet_leader_key='<c-e>'
let user_emmet_expandabbr_key = '<c-e>'
Plugin 'fatih/vim-go'
Plugin 'pangloss/vim-javascript'
" }}}

" UI {{{
" iterm2 support
Plugin 'sjl/vitality.vim'
Plugin 'altercation/vim-colors-solarized'
" Plugin 'junegunn/seoul256.vim'
Plugin 'restore_view.vim'
Plugin 'bling/vim-airline'
" let g:airline_theme='powerlineish'
let g:airline_enable_bufferline=0
let g:airline_powerline_fonts=0
let g:airline#extensions#hunks#enabled = 0
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_z=''
Plugin 'airblade/vim-gitgutter'
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
let g:gitgutter_map_keys = 0
" }}}

" tmux and testing {{{
Plugin 'benmills/vimux'
Plugin 'skalnik/vim-vroom'
let g:vroom_use_vimux = 1
let g:vroom_cucumber_path = 'cucumber'
if filereadable("bin/rails")
  let g:vroom_spec_command = 'rspec'
  let g:vroom_rspec_version = '3.x'
else
  let g:vroom_spec_command = 'spec'
  let g:vroom_rspec_version = '1.x'
endif
" }}}

" new stuff {{{
" use - to open a nerdtree
Plugin 'tpope/vim-vinegar'
Plugin 'terryma/vim-expand-region'
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
" }}}

call vundle#end()
filetype plugin indent on
" }}}

" Settings {{{
set shell=/usr/local/bin/zsh
set history=200
set nobackup
set nowritebackup
set notimeout
set noswapfile
set undofile
set undodir=~/.tmp,/tmp
set clipboard=unnamed
set foldnestmax=10
set foldenable
let macvim_skip_colorscheme=1

set ttyfast
set ttymouse=xterm2
set timeout " Do time out on mappings and others
set timeoutlen=1000 " Wait {num} ms before timing out a mapping
set mouse=a
" }}}

" UI {{{
set background=dark
" set background=light
colorscheme solarized
hi clear SignColumn
" colorscheme seoul256

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
" set wildmode=list:longest,list:full
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
cnoreabbrev W w
cnoreabbrev Wa wa
cnoreabbrev Wq wq
cnoreabbrev Wqa wqa

" map <c-s> <esc>:w<CR>
" imap <c-s> <esc>:w<CR>

" allow quit via single keypress (Q)
map Q :wqa<CR>
" }}}

" Searching {{{
set hlsearch
set incsearch
set smartcase
set gdefault
set showmatch

nnoremap <c-l> :noh<cr>
nnoremap <space> /
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
let g:ctrlp_match_func = { 'match' : 'matcher#cmatch' }
let g:ctrlp_match_window = 'order:ttb,max:20'
let g:ctrlp_user_command = 'ag %s -lU --hidden --nocolor -g ""'
let g:ctrlp_show_hidden = 1
let g:ctrlp_use_caching = 0

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
" F5 off
nnoremap <F6> :%s/\s*$//<CR>:noh<CR> " EOL whitespace removal
nnoremap <f7> :let &background = ( &background == "dark"? "light" : "dark")<CR>
" }}}

" Go, Text and Markdown {{{
autocmd bufreadpre *.md setlocal textwidth=80
autocmd bufreadpre *.gp setlocal nolist
" }}}

" Ruby {{{
au BufRead,BufNewFile {Thorfile,Vagrantfile,Procfile,pryrc,config.ru} set ft=ruby
au BufRead {app/*.rb,spec/.*rb} set path+=.

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
" noremap   <Up>     <NOP>
" noremap   <Down>   <NOP>
" noremap   <Left>   <NOP>
" noremap   <Right>  <NOP>
" }}}
