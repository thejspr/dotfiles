" Shortcuts and keymappings {{{
" , is the leader character
let mapleader = ","

" save shortcut
noremap <C-s> <ESC>:w<CR>
vnoremap <C-s> <ESC>:w<CR>
inoremap <C-s> <ESC>:w<CR>

"Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <C-j> mz:m+<cr>`z
nmap <C-k> mz:m-2<cr>`z
vmap <C-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <C-k> :m'<-2<cr>`>my`<mzgv`yo`z

" select everything
map <C-a> ggVG

map <F6> :w !detex \| wc -w<CR>
nnoremap <F3> :set hlsearch!<CR>

set backspace=indent,eol,start "allow backspacing over everything in insert mode

" Indent entire file
map   <silent> <F5> mmgg=G`m^
imap  <silent> <F5> <Esc> mmgg=G`m^

" edit .vimrc
command! Ev :e ~/.vimrc
autocmd BufWritePost .vimrc source $MYVIMRC

set ffs=unix,mac,dos

" Copy paste in/out of vim
map <C-c> "+y
map <C-v> "+p

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<CR>

" vim ctags
set tags=./tags;

" Sudo write
comm! W exec 'w !sudo tee % > /dev/null' | e

" }}}

" General setup {{{
set nocompatible " Use Vim settings, rather then Vi.
set viminfo^=% " remember open buffers.

set showmatch  " Show matching brackets.
set matchtime=2  " Bracket blinking.
set laststatus=2  " Always show status line.
set ruler  " Show ruler
set showcmd " Display an incomplete command in the lower right corner of the Vim window
set shortmess=atI " Shortens messages
set number
set numberwidth=2
set hidden "enables buffer switch without saving.
set nowrap

set binary " resolved "no end of line" git thing

set so=7
set wildmenu "Turn on WiLd menu

" backups
set nobackup
set nowb
set noswapfile  

set history=264	" lines of command line history
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Use Ack instead of Grep when available
if executable("ack")
  let g:ackprg="ack-grep"
  nnoremap <leader>a :Ack 
endif

" case only matters with mixed case expressions
set ignorecase
set smartcase
set hlsearch

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab
set cindent
set smartindent
" }}}

" syntax {{{
syntax on

" Enable file type detection.
filetype plugin indent on

" enable syntax files
au FileType * exe('setl dict+='.$VIMRUNTIME.'/syntax/'.&filetype.'.vim')

" Set File type to 'text' for files ending in .txt
autocmd BufNewFile,BufRead {*.txt,README} setfiletype text

" latex stuff
autocmd BufNewFile,BufRead *.tex setlocal wrap linebreak textwidth=0

" Enable soft-wrapping for text files
autocmd FileType text,markdown,html,xhtml,eruby setlocal wrap linebreak nolist

" Ruby and Rails customizations
au BufRead,BufNewFile {Gemfile,Rakefile,Capfile,*.rake,config.ru} set ft=ruby
autocmd BufNewFile,BufRead *_spec.rb compiler rspec

" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif

" Spell checking
map <leader>ss :setlocal spell!<cr>
"Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=
" }}}

" Plugins {{{
set runtimepath+=~/.vim/vundle.git/ " Vundle plugin manager
call vundle#rc()

" trying these

" Programming
Bundle "jQuery"
Bundle "rails.vim"
command! Rroutes :e config/routes.rb " ---------{
command! Rschema :e db/schema.rb
" Leader shortcuts for Rails commands
map <Leader>m :Rmodel<space>
map <Leader>c :Rcontroller<space>
map <Leader>v :Rview<space>
" map <Leader>u :Runittest
" map <Leader>f :Rfunctionaltest
" map <Leader>tm :RTmodel
" map <Leader>tc :RTcontroller
" map <Leader>tv :RTview
" map <Leader>tu :RTunittest
" map <Leader>tf :RTfunctionaltest
map <Leader>sm :RSmodel
map <Leader>sc :RScontroller
map <Leader>sv :RSview
map <Leader>su :RSunittest
map <Leader>sf :RSfunctionaltest

" rake
map <leader>r :!bundle exec rake  

" ----------------------------------------------}

" Snippets
Bundle "https://github.com/msanders/snipmate.vim.git"
let g:snippetsEmu_key = "<Tab>"

" Syntax highlight and checking
Bundle "https://github.com/scrooloose/syntastic.git"
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
" Bundle "https://github.com/tpope/vim-cucumber.git"

" Git integration
Bundle "https://github.com/tpope/vim-git.git"
Bundle "fugitive.vim"

" Colors
Bundle 'Color-Sampler-Pack'
" Bundle "https://github.com/altercation/vim-colors-solarized.git"
set t_Co=256
set background=dark
colorscheme wombat256

" Utility
Bundle "surround.vim"
Bundle "https://github.com/ervandew/supertab.git"
" let g:SuperTabDefaultCompletionTypeDiscovery = [
" \ "&completefunc:<c-x><c-u>",
" \ "&omnifunc:<c-x><c-o>",
" \ ]
let g:SuperTabLongestHighlight = 1

" Ack
Bundle "https://github.com/mileszs/ack.vim.git"
noremap <LocalLeader># "ayiw:Ack <C-r>a<CR>
vnoremap <LocalLeader># "ay:Ack <C-r>a<CR>

" tComment
Bundle "tComment"
nnoremap // :TComment<CR>
vnoremap // :TComment<CR>

" Command-T
Bundle "git://git.wincent.com/command-t.git"
let g:CommandTMatchWindowAtTop=1 " show window at top
set wildignore+=*.o,*.obj,.git,vendor/**,tmp/**,app/assets/images/**,public/images,*.class

" Navigation
" Bundle "https://github.com/Lokaltog/vim-easymotion.git"
" let g:EasyMotion_leader_key = '<Leader>m'

Bundle "bufexplorer.zip"
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
map <leader>o :BufExplorer<cr>
nnoremap <silent> <S-M-right> :bn<CR>
nnoremap <silent> <S-M-left> :bp<CR>

" filesystem
Bundle "https://github.com/scrooloose/nerdtree.git"
nmap <silent> <c-n> :NERDTreeToggle<CR>
map <F2> :NERDTreeToggle<CR>

Bundle 'rename.vim'

" kwdb.vim
nmap <F4> <Plug>Kwbd

" syntax
Bundle "https://github.com/briancollins/vim-jst.git"

" Eclim settings
" ,ji imports whatever is needed for current line
nnoremap <silent> <LocalLeader>ji :JavaImport<cr>
" ,jd opens javadoc for statement in browser
nnoremap <silent> <LocalLeader>jd :JavaDocSearch -x declarations<cr>
" ,<enter> searches context for statement
nnoremap <silent> <LocalLeader><cr> :JavaSearchContext<cr>
" ,jv validates current java file
nnoremap <silent> <LocalLeader>jv :Validate<cr>
" ,jc shows corrections for the current line of java
nnoremap <silent> <LocalLeader>jc :JavaCorrect<cr>
" 'open' on OSX will open the url in the default browser without issue
let g:EclimBrowser='open'

" }}}
