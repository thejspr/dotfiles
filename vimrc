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
" }}}

" Code navigation {{{
Bundle 'AutoTag'
Bundle 'majutsushi/tagbar'
Bundle 'Lokaltog/vim-easymotion'
" }}}

" Textwrangling {{{
Bundle 'tpope/vim-surround'
Bundle 'tomtom/tcomment_vim'
Bundle 'ervandew/supertab'
Bundle 'godlygeek/tabular'
Bundle 'chip/vim-fat-finger'
" }}}

" File management & Git {{{
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-eunuch'
Bundle 'kwbdi.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'LargeFile'
" }}}

" Ruby {{{
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rbenv'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-rails'
Bundle 'lucapette/vim-ruby-doc'
Bundle 'sickill/vim-pasta'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-rake'
"}}}

" JavaScript {{{
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'JSON.vim'
Bundle 'nono/vim-handlebars'
" }}}

" Msc languages {{{
Bundle 'tpope/vim-markdown'
Bundle 'slim-template/vim-slim'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" }}}

" UI {{{
Bundle 'Lokaltog/vim-powerline'
" Bundle 'Lokaltog/powerline' , {'rtp': 'powerline/bindings/vim'}
Bundle 'Solarized'
Bundle 'restore_view.vim'
" }}}

" Clojure (off) {{{
" Bundle 'guns/vim-clojure-static'
" Bundle 'tpope/vim-foreplay'
" Bundle 'kien/rainbow_parentheses.vim'
" au VimEnter * RainbowParenthesesToggle
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces
"}}}

" new stuff {{{
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
" }}}

" UI {{{
set guioptions-=L
set guifont=Menlo\ Regular:h14

set t_Co=256
syntax on
set nocursorcolumn
set cursorline
set background=dark
colorscheme solarized

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
au VimResized * exe "normal! \<c-w>="

" Text Formatting
set tabstop=2
set shiftwidth=2
set expandtab
set nowrap
set textwidth=80
" }}}

" Key mappings {{{
let mapleader = ","
let g:mapleader = ","

nmap <CR> :write<CR>

" tComment
nmap // :TComment<CR>
vmap // :TComment<CR>

" Auto format
map === mmgg=G`m^zz

" No arror keys
" noremap <Up> <NOP>
" noremap <Down> <NOP>
" noremap <Left> <NOP>
" noremap <Right> <NOP>
" }}}

" Tab key {{{
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabLongestHighlight = 1

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
" }}}

" Msc annoyances {{{
nnoremap Q <nop>
nnoremap K <nop>
nnoremap J mzJ`z " keep curson in place when joining lines

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
" }}}

" Searching {{{
set hlsearch
set incsearch
set smartcase
set gdefault
set showmatch

nnoremap <leader><space> :nohlsearch<cr>
nmap <space> /
map <m-space> ?
" find/replace shortcut
noremap <leader>f :%s///<left><left>
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

" Use Ag instead of Grep when available
let g:ackprg="ag -H --nogroup --column"
nnoremap <leader>a :Ag
nnoremap <leader>A :Ag <cword><CR>
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
let NERDTreeShowHidden=0
let g:NERDTreeChDirMode=2

" ctrlp
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|mp3|)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 1
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_extensions = ['tag']
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0

map ; :CtrlP<cr>
map <leader>t :CtrlP<cr>
map <leader>b :CtrlPBuffer<cr>
map <leader>r :CtrlPMRUFiles<cr>

set wildignore+=*/.hg/*,*/.svn/*,*/vendor/cache/*,*/public/system/*,*/tmp/*,*/log/*,*/.git/*,*/.jhw-cache/*,*/solr/data/*,*/node_modules/*,*/.DS_Store
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o,*~,*.obj,.git/**,tmp/**,app/assets/images/**,public/**,*.class,*.doc,*.lock,**.png,**.jpg,**.jpeg
set wildignore+=*.sass-cache/**,build/**,coverage/**,_deploy/**,solr/**,doc/**,rdoc/**,spec/dummy/**
" }}}

" Edit .vimrc {{{
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
" }}}

" Function Keys {{{
map <F1> :set nowrap! <CR>
noremap <F2> :NERDTreeToggle<CR>
set pastetoggle=<F3>
map <f4> <Plug>Kwbd
" F5 Ctrlp refresh
nmap <F6> :%s/\s*$//<CR>:noh<CR> " EOL whitespace removal
" }}}

" Ruby {{{
au BufRead,BufNewFile {Capfile,Gemfile,Rakefile,Thorfile,Vagrantfile,Procfile,pryrc,config.ru,.caprc,.irbrc,irb_tempfile*} set ft=ruby

" Replace Ruby 1.8 style hashes with shorter Ruby 1.9 style
map <leader>h :%s/:\([^ ]*\)\(\s*\)=>/\1:/<CR>

" https://github.com/lucapette/vim-ruby-doc
let g:ruby_doc_command='open'

" Rails.vim
map <Leader>m :Rmodel<space>
map <Leader>c :Rcontroller<space>
map <Leader>v :Rview<space>
" }}}

" JavaScript & JSON {{{
au BufRead,BufWrite,BufNewFile *.json set filetype=json foldmethod=syntax
au! FileType json command! -range=% -nargs=* Tidy <line1>,<line2>! json_xs -f json -t json-pretty

au BufRead *.hbs set filetype=handlebars " Handlebars
au FileType handlebars runtime! ftplugin/html/sparkup.vim
" }}}

" Git {{{
" Fugitive
nmap <leader>gs :Gstatus<CR><C-w>10+
noremap <leader>gc :Gcommit -v<CR><C-w>15+

autocmd BufRead COMMIT_EDITMSG setlocal spell!
autocmd BufRead COMMIT_EDITMSG setlocal nocursorline
" }}}

" Ctags {{{
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
let g:tagbar_type_javascript = { 'ctagsbin' : '/usr/local/share/npm/bin/jsctags' }

let g:tagbar_type_ruby = {
  \ 'kinds' : [
    \ 'm:modules',
    \ 'c:classes',
    \ 'd:describes',
    \ 'C:contexts',
    \ 'f:methods',
    \ 'F:singleton methods'
  \ ]
\ }

" Use only current file to autocomplete from tags
set complete=.,w,b,u,],t,i
" }}}

" Tube.vim {{{
let g:tube_terminal = 'iterm'

function! TubeThis(...) abort
  let l:cmd = []
  let l:path = expand('%')
 
  if filewritable('.zeus.sock')
    call add(l:cmd, 'zeus')
  " elseif filereadable('Gemfile')
  "   call add(l:cmd, 'bundle exec')
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

nmap <Leader>x :call TubeThis(line('.'))<CR>
nmap <Leader>X :call TubeThis()<CR>
nmap <Leader>§ :TubeLastCommand<CR>
" }}}

" EasyMotion {{{
let g:EasyMotion_leader_key = '<Leader>'
let g:EasyMotion_mapping_t = '_t'
let g:EasyMotion_mapping_T = '_T'
let g:EasyMotion_mapping_f = '_f'
let g:EasyMotion_mapping_k = '_k'
let g:EasyMotion_mapping_K = '_K'
"}}}

" Snippets {{{
ia epry require 'pry'; binding.pry
ia e#! #!/usr/bin/env 
ia esh require 'spec_helper'
" }}}
" vim: foldmethod=marker
