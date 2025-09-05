" AutoSave {{{
let g:auto_save = 1
let g:auto_save_silent = 0
let g:auto_save_events = ["TextChanged", "FocusLost", "InsertLeave"]
" }}}

" Search & Code navigation {{{
"nmap <leader>a :Grepper -tool rg -cword -noprompt<cr>
" }}}

" Text {{{
autocmd FileType javascript.jsx setlocal commentstring={/*\ %s\ */}
autocmd FileType hyprlang setlocal commentstring=#\ %s
" }}}

" File management & Git {{{
let g:eunuch_no_maps = 1
" }}}

" Msc languages {{{
let g:vim_json_conceal=0
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
"  }}}

" tmux and testing {{{
let g:VimuxOrientation = "v"
let g:VimuxHeight = "33"
let g:test#preserve_screen = 1
let g:test#echo_command = 0
nmap <leader><space> :VimuxPromptCommand<cr>
let test#strategy = "vimux"
nmap <silent> <leader>x :TestNearest<CR>
nmap <silent> <leader>X :TestFile<CR>
nmap <silent> <leader>q :TestLast<CR>

" UI {{{
set termguicolors
if filereadable(expand("~/.darkmode"))
  set background=dark
  colorscheme catppuccin
else
  set background=light
  colorscheme catppuccin-latte
endif

syntax on
set colorcolumn=90
set synmaxcol=140
set scrolloff=5
set smartindent
set wildmode=full
set laststatus=2
set splitbelow
set splitright

" Resize splits when the win is resized
au VimResized * wincmd =

" https://bluz71.github.io/2017/05/15/vim-tips-tricks.html
set autoread
augroup autoRead
  autocmd!
  autocmd FocusLost * silent! wall
augroup END

" Text Formatting
set tabstop=2
set shiftwidth=2
set expandtab
set nowrap
set textwidth=90
" set list listchars=tab:»·,trail:·
"}}}

" Settings {{{
set undofile
set undodir=~/.tmp,/tmp
" }}}

" Folding {{{
set foldenable
set foldnestmax=10
set foldlevelstart=10
set foldmethod=indent
nmap f1 :set foldlevel=0<cr>
nmap f2 :set foldlevel=1<cr>
nmap f3 :set foldlevel=2<cr>
nmap fa :set foldlevel=99<cr>
" }}}

" Key mappings {{{
map , <leader>

" Buffer management
nnoremap <tab> :bn<CR>
nnoremap <S-tab> :bp<CR>
"}}}

" Msc annoyances {{{
nnoremap K <nop>
" reselect visual lock after indent/outdent
vnoremap < <gv
vnoremap > >gv
" }}}

" Searching {{{
set hlsearch
set incsearch
set smartcase
set gdefault
set showmatch

set wildignore+=node_modules/*
set wildignore+=app/assets/images/**/*
set wildignore+=vendor/cache/**/*

nnoremap <leader>, :noh<cr>
nnoremap <leader>f :%s///<left><left>
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
au BufRead,BufNewFile COMMIT_EDITMSG 1
au BufRead,BufNewFile *.md setlocal nolist
"}}}

" Edit .vimrc {{{
command! Ev :e ~/.vimrc
augroup vimrc
  autocmd!
  au bufwritepost .vimrc source $MYVIMRC
  au bufread .vimrc set foldmethod=marker
augroup END
" }}}

" Ruby {{{
nmap <leader>F :ALEFix<cr>

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
noremap <Leader>m :Emodel<space>
noremap <Leader>c :Econtroller<space>
autocmd FileType ruby setlocal indentkeys-=.
" }}}

" New stuff {{{
au BufReadPost *.html* set formatoptions-=t
noremap <f1> <Nop>
nmap <silent> gx :!xdg-open '<cWORD>'<cr>
nmap Y yy
" }}}
