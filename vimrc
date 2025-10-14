" AutoSave {{{
let g:auto_save = 1
let g:auto_save_silent = 0
let g:auto_save_events = ["TextChanged", "FocusLost", "InsertLeave"]
" }}}

" File management & Git {{{
nnoremap <leader>a :Grepper -tool rg -cword -noprompt<cr>
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
let test#strategy = "vimux"
nnoremap <silent> <leader><space> :VimuxPromptCommand<cr>
nnoremap <silent> <leader>x :TestNearest<CR>
nnoremap <silent> <leader>X :TestFile<CR>
nnoremap <silent> <leader>q :TestLast<CR>

" UI {{{
set termguicolors
if filereadable(expand("~/.darkmode"))
  set background=dark
  colorscheme solarized
else
  set background=light
  colorscheme solarized
endif

set number
set colorcolumn=90
set synmaxcol=140
set scrolloff=5
set splitbelow
set splitright
filetype plugin indent on

" Resize splits when the win is resized
au VimResized * wincmd =

set autoread
augroup autoRead
  autocmd!
  autocmd FocusLost,BufEnter * silent! checktime
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
nnoremap f1 :set foldlevel=0<cr>
nnoremap f2 :set foldlevel=1<cr>
nnoremap f3 :set foldlevel=2<cr>
nnoremap fa :set foldlevel=99<cr>
" }}}

" Key mappings {{{

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

augroup MyAutoCmds
  autocmd!
  autocmd FileType javascript.jsx setlocal commentstring={/*\ %s\ */}
  autocmd FileType hyprlang setlocal commentstring=#\ %s
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType ruby setlocal indentkeys-=.
  autocmd BufReadPost *.html* setlocal formatoptions-=t
  autocmd BufRead,BufNewFile COMMIT_EDITMSG setlocal ft=diff spell!
  autocmd BufRead,BufNewFile *.md setlocal nolist
augroup END

" Spell checking {{{
set spellfile+=~/.config/nvim/spell/en.utf-8.add
set dict+=~/.config/nvim/spell/en.utf-8.add
noremap <leader>ss :setlocal spell!<cr>
noremap <leader>sn ]s
noremap <leader>sp [s
noremap <leader>sa zg
noremap <leader>sd z=
"}}}

" Edit .vimrc {{{
command! -bar Ev :e ~/.vimrc
augroup vimrc
  autocmd!
  au bufwritepost .vimrc source $MYVIMRC
  au bufread .vimrc set foldmethod=marker
augroup END
" }}}

" Ruby {{{
nnoremap <leader>F :ALEFix<cr>
nnoremap <Leader>m :Emodel<space>
nnoremap <Leader>c :Econtroller<space>
" }}}

" New stuff {{{
noremap <f1> <Nop>
nnoremap <silent> gx :!xdg-open '<cWORD>'<cr>
nnoremap Y yy
" }}}
