" Shortcuts and keymappings ----------------------------------------{
" , is the leader character
let mapleader = ","

" save shortcut
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

" Move lines up/down
noremap <a-up> :call feedkeys( line('.')==1 ? '' : 'ddkP' )<CR>
noremap <a-down> ddp

map <F3> :w !detex \| wc -w<CR>

set backspace=indent,eol,start "allow backspacing over everything in insert mode

" edit .vimrc
command! Ev :e ~/.vimrc
autocmd BufWritePost .vimrc source $MYVIMRC
" ------------------------------------------------------------------}

" Misc. commands and setup -----------------------------------------{
" remove trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

" vim ctags
set tags=./tags;

" ------------------------------------------------------------------}

" General setup ----------------------------------------------------{
set nocompatible " Use Vim settings, rather then Vi.
set viminfo^=% " remember open buffers.
"set viminfo^=! " Add recently accessed projects menu (project plugin)


if has("gui_running")
  set guioptions-=T
else
  set t_Co=256
endif

" backups
set backup
set nowritebackup
set backupdir=~/.vim/backup,~/,.
set directory=~/.vim/tmp,~/,.

set history=256	" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Use Ack instead of Grep when available
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor\ --ignore-dir=tmp\ --ignore-dir=coverage
endif

" Numbers
set number
set numberwidth=3

" case only matters with mixed case expressions
set ignorecase
set smartcase
set hlsearch

" Switch wrap off for everything
set nowrap

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab
set cindent
set smartindent

" Always display the status line
set laststatus=2

set hidden "enables buffer switch without saving.

" syntax --------------------------------{
syntax on

" Enable file type detection.
filetype plugin indent on

" enable syntax files
au FileType * exe('setl dict+='.$VIMRUNTIME.'/syntax/'.&filetype.'.vim')
" ---------------------------------------}

" Set File type to 'text' for files ending in .txt
autocmd BufNewFile,BufRead *.txt setfiletype text

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

" ------------------------------------------------------------------}

" Plugins ----------------------------------------------------------{
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
map <Leader>u :Runittest
"map <Leader>f :Rfunctionaltest
map <Leader>tm :RTmodel
map <Leader>tc :RTcontroller
map <Leader>tv :RTview
map <Leader>tu :RTunittest
map <Leader>tf :RTfunctionaltest
map <Leader>sm :RSmodel
map <Leader>sc :RScontroller
map <Leader>sv :RSview
map <Leader>su :RSunittest
map <Leader>sf :RSfunctionaltest
" ----------------------------------------------}

" Snippets
Bundle "https://github.com/msanders/snipmate.vim.git"
let g:snippetsEmu_key = "<Tab>"

" Syntax highlight and checking
Bundle "https://github.com/scrooloose/syntastic.git"
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
"Bundle "cucumber.zip"

" Git integration
Bundle "git.zip"
"Bundle "fugitive.vim"

" Colors
Bundle 'Color-Sampler-Pack'
colorscheme tango2

" Utility
"Bundle "repeat.vim"
Bundle "surround.vim"
"Bundle "SuperTab"
"Bundle "file-line"
"Bundle "Align"

" FuzzyFinder
Bundle "L9"
Bundle "FuzzyFinder"
let g:fuf_modesDisable = [] " ------------------{
nnoremap <silent> <LocalLeader>h :FufHelp<CR>
nnoremap <silent> <LocalLeader>2  :FufFileWithCurrentBufferDir<CR>
nnoremap <silent> <LocalLeader>@  :FufFile<CR>
nnoremap <silent> <LocalLeader>3  :FufBuffer<CR>
nnoremap <silent> <LocalLeader>4  :FufDirWithCurrentBufferDir<CR>
nnoremap <silent> <LocalLeader>$  :FufDir<CR>
nnoremap <silent> <LocalLeader>5  :FufChangeList<CR>
nnoremap <silent> <LocalLeader>6  :FufMruFile<CR>
nnoremap <silent> <LocalLeader>7  :FufLine<CR>
nnoremap <silent> <LocalLeader>8  :FufBookmark<CR>
nnoremap <silent> <LocalLeader>*  :FuzzyFinderAddBookmark<CR><CR>
nnoremap <silent> <LocalLeader>9  :FufTaggedFile<CR>
map <leader>f :FufFile **/<CR>
"map <leader>f :FufFile<CR>
map <leader>b :FufBuffer<CR>
let g:fuf_splitPathMatching=1"
" ----------------------------------------------}

" Ack
Bundle "ack.vim"
noremap <LocalLeader># "ayiw:Ack <C-r>a<CR>
vnoremap <LocalLeader># "ay:Ack <C-r>a<CR>

" tComment
Bundle "tComment"
nnoremap // :TComment<CR>
vnoremap // :TComment<CR>

" Command-T
Bundle "git://git.wincent.com/command-t.git"
let g:CommandTMatchWindowAtTop=1 " show window at top

" Navigation
Bundle "bufexplorer.zip"
nnoremap <silent> <F9> :BufExplorer<CR>
nnoremap <silent> <M-right> :bn<CR>
nnoremap <silent> <M-left> :bp<CR>
Bundle "https://github.com/scrooloose/nerdtree.git"
nmap <silent> <c-n> :NERDTreeToggle<CR>
map <F2> :NERDTreeToggle<CR>
Bundle "bufkill.vim"
nmap <F4> :BD<CR>
" " }}} ------------------------------------------------------------}
