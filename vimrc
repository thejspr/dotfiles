" Shortcuts and keymappings {{{
let mapleader = ","

" Leave insert-mode
imap jj <esc>

" save shortcut
noremap <C-s> <ESC>:w<CR>
vnoremap <C-s> <ESC>:w<CR>
inoremap <C-s> <ESC>:w<CR>
noremap <C-M-s> <ESC>:wq<CR>
vnoremap <C-M-s> <ESC>:wq<CR>
inoremap <C-M-s> <ESC>:wq<CR>

"Move a line of text using Ctrl+[jk]
nmap <C-j> mz:m+<cr>`z
nmap <C-k> mz:m-2<cr>`z
vmap <C-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <C-k> :m'<-2<cr>`>my`<mzgv`yo`z

" select everything
noremap <C-a> ggVG

" find/replace shortcut
noremap <leader>f :%s///gc<left><left><left><left>

nnoremap <F3> :set hlsearch!<CR>

set backspace=indent,eol,start "allow backspacing over everything in insert mode

" Indent entire file
noremap   <silent> <F5> mmgg=G'm
imap  <silent> <F5> <Esc> mmgg=G'm

" edit .vimrc
command! Ev :e ~/.vimrc
autocmd BufWritePost .vimrc source $MYVIMRC

set ffs=unix,mac,dos

" Copy paste in/out of vim
noremap <C-c> "+y
noremap <C-v> "+p
imap <C-c> <esc>"+y 
imap <C-v> <esc>"+p 

" vim ctags
set tags=./tags;

" Sudo write
comm! W exec 'w !sudo tee % > /dev/null' | e
" }}}

" General setup {{{
set nocompatible  " Use Vim settings, rather then Vi.
" set viminfo^=%    " remember open buffers.

set showmatch     " Show matching brackets.
set matchtime=2   " Bracket blinking.
set laststatus=2  " Always show status line.
set ruler         " Show ruler
set showcmd       " Display an incomplete command in the lower right corner
set shortmess=atI " Shortens messages
set number
set numberwidth=2
set hidden        "enables buffer switch without saving.

set binary        " resolved no end of line git thing

set so=7
set wildmenu      "Turn on WiLd menu

" backups
set nobackup
set noswapfile
set nowritebackup

set history=1024  " lines of command line history
set incsearch		  " do incremental searching

" Use Ack instead of Grep when available
if executable("ack")
  let g:ackprg="ack-grep -H --nocolor --nogroup --column"
  nnoremap <leader>a :Ack 
endif

" case only matters with mixed case expressions
set ignorecase
set smartcase

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
autocmd BufNewFile,BufRead {*.txt,README,*.wiki} setfiletype text

" Vimwiki settings
autocmd BufWrite {*.wiki} exe('VimwikiAll2HTML')
let g:vimwiki_list = [{'html_header': '~/vimwiki_html/header.tpl'}]

" latex stuff
autocmd BufNewFile,BufRead *.tex setlocal wrap linebreak textwidth=0
autocmd BufNewFile,BufRead {*.tex,*.bib} set filetype=tex
noremap <F6> :w !detex \| wc -w<CR>

" Enable soft-wrapping for text files
autocmd FileType text,markdown,html,xhtml,eruby setlocal wrap linebreak nolist

" Ruby and Rails customizations
au BufRead,BufNewFile {Gemfile,Rakefile,Capfile,*.rake,config.ru} set ft=ruby
autocmd BufNewFile,BufRead *_spec.rb compiler rspec

" JavaScript and JSON
noremap <leader>jt  <Esc>:%!json_xs -f json -t json-pretty<CR>

" For all text and tex files set 'textwidth' to 78 characters.
autocmd FileType text,tex setlocal textwidth=78

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif

" Spell checking
set encoding=utf-8
set spellfile+=~/.vim/spell/en.utf-8.add
set dict+=~/.vim/spell/en.utf-8.add
noremap <leader>ss :setlocal spell!<cr>
noremap <leader>sn ]s
noremap <leader>sp [s
noremap <leader>sa zg
noremap <leader>sd z=
" }}}

" Plugins {{{
set runtimepath+=~/.vim/vundle.git/ " Vundle plugin manager
call vundle#rc()

" Ruby
Bundle "https://github.com/ecomba/vim-ruby-refactoring"
Bundle "https://github.com/taq/vim-refact"
Bundle "https://github.com/janx/vim-rubytest.git"
map <Leader>1 <Plug>RubyTestRun
map <Leader>2 <Plug>RubyFileRun
map <Leader>3 <Plug>RubyTestRunLast

" Rails
Bundle "https://github.com/tpope/vim-rails"
let g:rails_menu=2
command! Rroutes :e config/routes.rb
command! Rschema :e db/schema.rb
" Leader shortcuts for Rails commands
noremap <Leader>m :Rmodel<space>
noremap <Leader>c :Rcontroller<space>
noremap <Leader>v :Rview<space>
noremap <Leader>sm :RSmodel
noremap <Leader>sc :RScontroller
noremap <Leader>sv :RSview
noremap <Leader>su :RSunittest
noremap <Leader>sf :RSfunctionaltest

" JavaScript
Bundle "https://github.com/mozilla/doctorjs.git"

" Snippets
Bundle "https://github.com/msanders/snipmate.vim.git"
let g:snippetsEmu_key = "<S-Tab>"
" Tab completion options
set wildmode=list:longest,list:full
set complete=.,w,t

" Syntax highlight and checking
Bundle "https://github.com/scrooloose/syntastic.git"
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2

" Git integration
Bundle "https://github.com/tpope/vim-git.git"
Bundle "fugitive.vim"
noremap <leader>8 :e! Gemfile \| Gstatus<CR>
noremap <leader>9 :Gcommit<CR>

" Colors
Bundle 'Color-Sampler-Pack'
set t_Co=256
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
noremap <leader># "ayiw:Ack <C-r>a<CR>
vnoremap <leader># "ay:Ack <C-r>a<CR>

" tComment
Bundle "tComment"
nnoremap // :TComment<CR>
vnoremap // :TComment<CR>

Bundle 'toggle_words.vim'
nmap <leader>s :ToggleWord<CR> 

" Command-T
Bundle "git://git.wincent.com/command-t.git"
let g:CommandTMatchWindowAtTop=1 " show window at top
let g:CommandTMaxHeight=30
set wildignore+=*.o,*.obj,.git/**,vendor/**,tmp/**,app/assets/images/**,public/images/**,public/assets/**
set wildignore+=*.class,*.doc,*.lock,*.lox,**.png,**.jpg,**.jpeg
" thesis stuff
set wildignore+=repos/**,spikes/**,msc/**,img/**,*.aux,*.out,*.bbl,*.toc,*latexmk,*.blg,*.pdf,report.log
set wildignore+=test_objects/*/**,coverage/**
augroup CommandTExtension
  autocmd!
  autocmd FocusGained * CommandTFlush
  autocmd BufWritePost * CommandTFlush
augroup END

" Navigation
Bundle "bufexplorer.zip"
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
noremap <leader>o :BufExplorer<cr>
nnoremap <silent> <S-M-right> :bn<CR>
nnoremap <silent> <S-M-left> :bp<CR>

" filesystem
Bundle "https://github.com/scrooloose/nerdtree.git"
nmap <silent> <c-n> :NERDTreeToggle<CR>
noremap <F2> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.git$']

" kwdb.vim
nmap <F4> <Plug>Kwbd

" vimwiki - http://code.google.com/p/vimwiki/
Bundle "vimwiki"

Bundle 'https://github.com/vim-scripts/YankRing.vim.git'
noremap <leader>½ :YRShow<CR>

" Learn home-row keys damnit!
" nnoremap <Left> :echoe "Use h"<CR>
" nnoremap <Right> :echoe "Use l"<CR>
" nnoremap <Up> :echoe "Use k"<CR>
" nnoremap <Down> :echoe "Use j"<CR>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" spelling corrections
iab teh the
iab tehn then
