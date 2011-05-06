
" Shortcuts and keymappings {{{
" , is the leader character
let mapleader = ","

" save shortcut
noremap <C-s> <ESC>:w<CR>
vnoremap <C-s> <ESC>:w<CR>
inoremap <C-s> <ESC>:w<CR>

"Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <A-j> mz:m+<cr>`z
nmap <A-k> mz:m-2<cr>`z
vmap <A-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <A-k> :m'<-2<cr>`>my`<mzgv`yo`z

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
" set filetype to ruby
command! FR set filetype=ruby

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
set matchtime=3  " Bracket blinking.
set laststatus=2  " Always show status line.
set ruler  " Show ruler
set showcmd " Display an incomplete command in the lower right corner of the Vim window
set shortmess=atI " Shortens messages
set number
set numberwidth=3
set hidden "enables buffer switch without saving.
set nowrap

if has("gui_running")
  set columns=84
  set lines=60
  set guioptions-=T
  " set guioptions-=m
else
  set t_Co=256
endif

set so=7
set wildmenu "Turn on WiLd menu

" backups
set nobackup
set nowb
set noswapfile  

set history=512	" lines of command line history
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Use Ack instead of Grep when available
if executable("ack")
  let g:ackprg="ack-grep -H --nocolor --nogroup --column"
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

" Ruby filetypes
au BufRead,BufNewFile {Gemfile,Rakefile,Capfile,*.rake,config.ru} set ft=ruby

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
map <Leader>R :e doc/README_FOR_APP<CR>
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

" cucumber
map <leader>cu :! cucumber %<CR>

" rake
map <leader>r :! rake<CR>

" ----------------------------------------------}

" Snippets
Bundle "https://github.com/msanders/snipmate.vim.git"
let g:snippetsEmu_key = "<C-Tab>"

" Syntax highlight and checking
Bundle "https://github.com/scrooloose/syntastic.git"
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
Bundle "https://github.com/tpope/vim-cucumber.git"

" Git integration
Bundle "https://github.com/tpope/vim-git.git"
Bundle "fugitive.vim"

" Colors
Bundle 'Color-Sampler-Pack'
Bundle "https://github.com/altercation/vim-colors-solarized.git"
if has("gui_running")
  set background=dark
  colorscheme solarized
  " colorscheme wombat
else
  " colorscheme wombat256
  set background=dark
  colorscheme solarized 
endif

" Utility
Bundle "surround.vim"
Bundle "https://github.com/ervandew/supertab.git"

" FuzzyFinder
Bundle "L9"
Bundle "FuzzyFinder"
let g:fuf_modesDisable = [] " ------------------{
nnoremap <silent> <LocalLeader>h :FufHelp<CR>
nnoremap <silent> <LocalLeader>2  :FufFileWithCurrentBufferDir<CR>
nnoremap <silent> <LocalLeader>4  :FufDirWithCurrentBufferDir<CR>
nnoremap <silent> <LocalLeader>$  :FufDir<CR>
nnoremap <silent> <LocalLeader>5  :FufChangeList<CR>
nnoremap <silent> <LocalLeader>6  :FufMruFile<CR>
nnoremap <silent> <LocalLeader>7  :FufLine<CR>
nnoremap <silent> <LocalLeader>8  :FufBookmark<CR>
nnoremap <silent> <LocalLeader>*  :FuzzyFinderAddBookmark<CR><CR>
nnoremap <silent> <LocalLeader>9  :FufTaggedFile<CR>
map <leader>f :FufFile **/<CR>
map <leader>b :FufBuffer<CR>
" ----------------------------------------------}

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
:set wildignore+=*.o,*.obj,.git,vendor/**,tmp/**

" Navigation
" Bundle "https://github.com/Lokaltog/vim-easymotion.git"
" let g:EasyMotion_leader_key = '<Leader>m'

Bundle "bufexplorer.zip"
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
map <leader>o :BufExplorer<cr>
nnoremap <silent> <S-M-right> :bn<CR>
nnoremap <silent> <S-M-left> :bp<CR>

Bundle "https://github.com/scrooloose/nerdtree.git"
nmap <silent> <c-n> :NERDTreeToggle<CR>
map <F2> :NERDTreeToggle<CR>
" kwdb.vim
nmap <F4> <Plug>Kwbd
" }}}
" Statusline ---------------------------------{{{
" hi StatColor guibg=#95e454 guifg=black ctermbg=lightgreen ctermfg=black
" hi Modified guibg=orange guifg=black ctermbg=lightred ctermfg=black
" 
" function! MyStatusLine(mode)
"     let statusline=""
"     if a:mode == 'Enter'
"         let statusline.="%#StatColor#"
"     endif
"     let statusline.="\(%n\)\ %f\ "
"     if a:mode == 'Enter'
"         let statusline.="%*"
"     endif
"     let statusline.="%#Modified#%m"
"     if a:mode == 'Leave'
"         let statusline.="%*%r"
"     elseif a:mode == 'Enter'
"         let statusline.="%r%*"
"     endif
"     let statusline .= "\ (%l/%L,\ %c)\ %P%=%h%w\ %y\ [%{&encoding}:%{&fileformat}]\ \ "
"     return statusline
" endfunction
" 
" au WinEnter * setlocal statusline=%!MyStatusLine('Enter')
" au WinLeave * setlocal statusline=%!MyStatusLine('Leave')
" set statusline=%!MyStatusLine('Enter')
" 
" function! InsertStatuslineColor(mode)
"   if a:mode == 'i'
"     hi StatColor guibg=orange ctermbg=lightred
"   elseif a:mode == 'r'
"     hi StatColor guibg=#e454ba ctermbg=magenta
"   elseif a:mode == 'v'
"     hi StatColor guibg=#e454ba ctermbg=magenta
"   else
"     hi StatColor guibg=red ctermbg=red
"   endif
" endfunction 
" 
" au InsertEnter * call InsertStatuslineColor(v:insertmode)
" au InsertLeave * hi StatColor guibg=#95e454 guifg=black ctermbg=lightgreen ctermfg=black
" --------------------------------------------}}}
