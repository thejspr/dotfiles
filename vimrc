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
" }}}

" File management & Git {{{
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-fugitive'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
let g:gist_open_browser_after_post = 1
let g:gist_post_private = 1
let g:gist_clip_command = 'pbcopy'
" }}}

" Ruby {{{
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails'
Plugin 'sickill/vim-pasta'
" let g:pasta_disabled_filetypes = ['sass', 'coffee', 'yaml']
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
"}}}

" JavaScript {{{
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
" }}}

" Markup languages {{{
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-haml'
Plugin 'slim-template/vim-slim'
Plugin 'tpope/vim-ragtag'
Plugin 'mattn/emmet-vim'
" let user_emmet_expandabbr_key = '<c-d>'
let user_emmet_leader_key = '<C-d>'
" }}}

" UI {{{
" iterm2 support
Plugin 'sjl/vitality.vim'
Plugin 'altercation/vim-colors-solarized'
" Plugin 'junegunn/seoul256.vim'
Plugin 'restore_view.vim'
Plugin 'bling/vim-airline'
let g:airline_theme='powerlineish'
let g:airline_enable_bufferline=0
" let g:airline_powerline_fonts=0
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_z=''
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
Plugin 'rizzatti/dash.vim'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'nelstrom/vim-qargs'
Plugin 'kwbdi.vim'
" }}}

call vundle#end() 
filetype plugin indent on
" set runtimepath+=~/.vim/bundle/ultisnips
" }}}

" Settings {{{
set history=200
set nobackup
set nowritebackup
set notimeout
set noswapfile
set undofile
set undodir=~/.tmp,/tmp
set clipboard=unnamed
set mouse=a
set foldnestmax=10
set foldenable
" use the old regex engine for better performance
" http://stackoverflow.com/questions/16902317/vim-slow-with-ruby-syntax-highlighting
" let g:ruby_path="/Users/jesper/.rbenv/shims/ruby"
set re=1
" }}}

" UI {{{
set background=dark
" set background=light
colorscheme solarized
" colorscheme seoul256

" set guioptions-=L
set guifont=Menlo\ Regular:h14

syntax on
set nocursorcolumn
set nocursorline
set colorcolumn=80
" set synmaxcol=140
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
" Auto format
noremap === mmgg=G`m^zz
" Buffer management
noremap <tab> :bn<CR>
noremap <S-tab> :bp<CR>
" Tab management
" noremap <a-right> gt
" noremap <a-left> gT
"}}}

" Tab key {{{
" }}}

" Msc annoyances {{{
nnoremap Q <nop>
nnoremap K <nop>
nnoremap J mzJ`z " keep cursor in place when joining lines
map q: :q
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
map <c-s> <esc>:w<CR>
imap <c-s> <esc>:w<CR>
" }}}

" Searching {{{
set hlsearch
set incsearch
set smartcase
set gdefault
set showmatch

nnoremap <C-l> :noh<cr>
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
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|mp3|svg|)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py|_site|gh-pages|dist|bower_components|.tmp|images'
let g:ctrlp_match_window_reversed = 1
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 1

noremap <leader>t :CtrlP<cr>
noremap <leader>b :CtrlPBuffer<cr>
noremap <leader>r :CtrlPMRUFiles<cr>

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

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
nmap <f4> :bdelete<cr>
" F5 Ctrlp refresh
nnoremap <F6> :%s/\s*$//<CR>:noh<CR> " EOL whitespace removal
nnoremap <f7> :let &background = ( &background == "dark"? "light" : "dark")<CR>
" }}}

" Ruby {{{
au BufRead,BufNewFile {Thorfile,Vagrantfile,Procfile,pryrc,config.ru} set ft=ruby

" Replace Ruby 1.8 style hashes with shorter Ruby 1.9 style
noremap <leader>h :%s/:\([^ ]*\)\(\s*\)=>/\1:/g<CR>
" noremap <leader>h :%s/:\(\w\+\)\(\s*=>\s*\)/\1: /gc<CR>

" Rails.vim
noremap <Leader>m :Emodel<space>
noremap <Leader>c :Econtroller<space>
noremap <Leader>v :Eview<space>
set path+=.
" }}}

" JavaScript & JSON {{{
function! FormatJson()
  set ft=json
  exe '%!python -m json.tool'
endfunction
" }}}

" Git {{{
nnoremap <leader>gs :Gstatus<CR><C-w>10+
noremap <leader>gc :Gcommit -v<CR><C-w>15+
autocmd BufRead COMMIT_EDITMSG setlocal spell! nocursorline colorcolumn=72
" }}}

" Tmux and testing {{{
nnoremap <Leader>x :VroomRunNearestTest<cr>
nnoremap <Leader>X :VroomRunTest<cr>
nnoremap <Leader>§ :VimuxRunLastCommand<cr>
nmap <leader><space> :VimuxPromptCommand<cr>
" }}}

" New stuff {{{
command! Es :vsplit ~/Dropbox\ (Personal)/scratch.txt
" noremap   <Up>     <NOP>
" noremap   <Down>   <NOP>
" noremap   <Left>   <NOP>
" noremap   <Right>  <NOP>
"}}
