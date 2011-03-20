set nocompatible " Use Vim settings, rather then Vi settings (much better!).

"set viminfo^=! " Add recently accessed projects menu (project plugin)

set viminfo^=% " remember open buffers.

colorscheme tango2

" , is the leader character
let mapleader = ","

if has("gui_running")
  set guioptions-=T
  "save file
  nmap <c-s> :w<CR>
  vmap <c-s> <Esc><c-s>gv
  imap <c-s> <Esc><c-s>
else
  set t_Co=256
endif

" remove trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

" vim ctags
set tags=./tags;

" syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

" Buffers - explore/next/previous
nnoremap <silent> <F9> :BufExplorer<CR>
nnoremap <silent> <M-right> :bn<CR>
nnoremap <silent> <M-left> :bp<CR>

" close buffer (see bclose.vim)
nmap <F4> :Kwbd<CR>

" Move lines up/down
noremap <a-up> :call feedkeys( line('.')==1 ? '' : 'ddkP' )<CR>
noremap <a-down> ddp

command! Ev :e ~/.vimrc

" FuzzyFinder
map <leader>f :FufFile **/<CR>
"map <leader>f :FufFile<CR>
map <leader>b :FufBuffer<CR>
let g:fuf_splitPathMatching=1

" NERD Tree
nmap <silent> <c-n> :NERDTreeToggle<CR>
map <F2> :NERDTreeToggle<CR>

map <F3> :w !detex \| wc -w<CR>

set backspace=indent,eol,start "allow backspacing over everything in insert mode

" Store all backup and temporary files in one place
set backup
set backupdir=~/.vim/backup,~/,.
set directory=~/.vim/tmp,~/,.
set nowritebackup
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

syntax on
set hlsearch

" Switch wrap off for everything
set nowrap

if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Set File type to 'text' for files ending in .txt
  autocmd BufNewFile,BufRead *.txt setfiletype text

  " latex stuff
  autocmd BufNewFile,BufRead *.tex setlocal wrap linebreak textwidth=0

  " Enable soft-wrapping for text files
  autocmd FileType text,markdown,html,xhtml,eruby setlocal wrap linebreak nolist

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Automatically load .vimrc source when saved
  autocmd BufWritePost .vimrc source $MYVIMRC

  " enable syntax files
  au FileType * exe('setl dict+='.$VIMRUNTIME.'/syntax/'.&filetype.'.vim')

  augroup END
else
  set autoindent		" always set autoindenting on
endif " has("autocmd")

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab
set cindent
set smartindent

" Always display the status line
set laststatus=2

" Edit the README_FOR_APP (makes :R commands work)
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

" Hide search highlighting
map <Leader>h :set invhls <CR>

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Press ^F from insert mode to insert the current file name
imap <C-F> <C-R>=expand("%")<CR>

set hidden "enables buffer switch without saving.

" Edit routes
command! Rroutes :e config/routes.rb
command! Rschema :e db/schema.rb

" Use Ack instead of Grep when available
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor\ --ignore-dir=tmp\ --ignore-dir=coverage
endif

" Numbers
set number
set numberwidth=3

" Snippets are activated by Shift+Tab
let g:snippetsEmu_key = "<Tab>"

" case only matters with mixed case expressions
set ignorecase
set smartcase

