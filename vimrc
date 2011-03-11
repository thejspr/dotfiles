set nocompatible " Use Vim settings, rather then Vi settings (much better!).

set viminfo^=! " Add recently accessed projects menu (project plugin)

set viminfo^=% " remember open buffers.

colorscheme railscasts

if has("gui_running")
  set guioptions-=T
endif 

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

"save file
nmap <c-s> :w<CR>
vmap <c-s> <Esc><c-s>gv
imap <c-s> <Esc><c-s>

" Buffers - explore/next/previous: Alt-F12, F12, Shift-F12.
nnoremap <silent> <F12> :BufExplorer<CR>
nnoremap <silent> <M-right> :bn<CR>
nnoremap <silent> <M-left> :bp<CR>

" close buffer (force close buffer)
nmap <F4> :bw<CR>
nmap <s-F4> :bw!<CR>

" Move lines up/down
noremap <a-up> :call feedkeys( line('.')==1 ? '' : 'ddkP' )<CR>
noremap <a-down> ddp

" reload configuration file on edit/save
autocmd BufWritePost .vimrc source %
command! Ev :e ~/.vimrc

" FuzzyFinder
"map <leader>t :FufFile **/<CR>
map <leader>f :FufFile<CR>
map <leader>b :FufBuffer<CR>

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

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
  set hlsearch
endif

" Switch wrap off for everything
set nowrap

if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Set File type to 'text' for files ending in .txt
  autocmd BufNewFile,BufRead *.txt setfiletype text

  " latex stuff
  autocmd BufNewFile,BufRead *.tex set wrap linebreak textwidth=0

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

" \ is the leader character
let mapleader = ","

" Edit the README_FOR_APP (makes :R commands work)
map <Leader>R :e doc/README_FOR_APP<CR>

" Leader shortcuts for Rails commands
map <Leader>m :Rmodel 
map <Leader>c :Rcontroller 
map <Leader>v :Rview 
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

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Duplicate a selection
" Visual mode: D
vmap D y'>p

" Press Shift+P while in visual mode to replace the selection without
" overwriting the default register
vmap P p :call setreg('"', getreg('0')) <CR>

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
set numberwidth=4

" Snippets are activated by Shift+Tab
let g:snippetsEmu_key = "<S-Tab>"

" case only matters with mixed case expressions
set ignorecase
set smartcase

let g:fuf_splitPathMatching=1
