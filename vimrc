" Plugins {{{
" Init {{{
set nocompatible
filetype off
" let g:loaded_perl_provider = 0
call plug#begin('~/.vim/plugged')
" }}}

" Essentials {{{
Plug 'tpope/vim-repeat'
" Plug 'ervandew/supertab'
Plug 'tpope/vim-obsession' " sessions mgmt
Plug '907th/vim-auto-save'
let g:auto_save = 1
let g:auto_save_silent = 1
let g:auto_save_events = ["TextChanged", "FocusLost", "InsertLeave"]

" Plug 'roxma/vim-paste-easy'
Plug 'moll/vim-bbye'
map <c-x> :Bdelete<CR>
" }}}

" CoC {{{
" Docs https://github.com/neoclide/coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

set updatetime=300
set signcolumn=yes
set shortmess+=c

noremap tt :CocCommand explorer<CR>
let g:coc_global_extensions = ['coc-solargraph', 'coc-explorer']

nmap gd <Plug>(coc-definition)
nmap gr <Plug>(coc-references)

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
imap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" }}}

" Search & Code navigation {{{
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'
" noremap <leader>t :Files<cr>
" " noremap <leader>t :FloatermNew fzf<cr>
" noremap <leader>b :Buffers<cr>
" noremap <leader>r :History<cr>
" let g:fzf_layout = { 'down': '~30%' }
" let g:fzf_history_dir = '~/.vim/history'

Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
nmap <leader>a :Grepper -tool rg -cword -noprompt<cr>
nmap <leader>G :Grepper -tool rg<cr>
" }}}

" Text {{{
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'mg979/vim-visual-multi'
Plug 'godlygeek/tabular'
" let g:vim_markdown_conceal = 0
Plug 'preservim/vim-markdown'
" }}}

" File management & Git {{{
Plug 'tpope/vim-eunuch' " File command helpers: Rename, Delete etc.
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb' " Gbrowse handlers for github
Plug 'pbrisbin/vim-mkdir' " Automatically create new folders for files
Plug 'airblade/vim-gitgutter'
" }}}

" Ruby {{{
Plug 'vim-ruby/vim-ruby'
Plug 'dense-analysis/ale'
let g:ale_linters = {
      \   'ruby': ['rubocop'],
      \   'javascript': ['eslint'],
      \}
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'ruby': ['rubocop'],
      \ 'sql': ['pgformatter'],
      \ 'python': ['autopep8'],
      \ 'javascript': ['prettier'],
      \}
let g:ale_ruby_rubocop_options = '-A'
let b:ale_sql_pgformatter_options = '--spaces 2 --wrap-after 10'
" let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_enter = 0
let g:ale_fix_on_save = 0
let g:ale_virtualtext_cursor = 0
highlight ALEWarning ctermbg=none cterm=underline
highlight ALEError ctermbg=none cterm=underline
nnoremap <leader>F :ALEFix<cr>

Plug 'tpope/vim-rails'
Plug 'sickill/vim-pasta'
let g:pasta_disabled_filetypes = ['yaml']
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
Plug 'tpope/vim-haml'
"}}}

" Python {{{
" :CocInstall coc-pyright
Plug 'Vimjas/vim-python-pep8-indent'
" Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }
" }}}

" Msc languages {{{
Plug 'pangloss/vim-javascript'
let g:vim_json_conceal=0
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-ragtag'
"  }}}

" tmux and testing {{{
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
" let g:VimuxOrientation = "h"
" let g:VimuxHeight = "45"
let g:VimuxOrientation = "v"
let g:VimuxHeight = "33"
nmap <leader><space> :VimuxPromptCommand<cr>
nmap <silent> <leader>q :VimuxRunLastCommand<CR>
Plug 'janko-m/vim-test'
" let g:test#preserve_screen = 0
let test#strategy = "vimux"
" let test#strategy = "neovim"
" let test#neovim#term_position = "vert"
nmap <silent> <leader>x :TestNearest<CR>
nmap <silent> <leader>X :TestFile<CR>
" }}}

" UI {{{
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'tokyonight',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

Plug 'Yggdroot/indentLine'
let g:indentLine_setConceal = 0
let g:indentLine_char = '┊'
let g:indentLine_bufNameExclude = ['NERD_tree.*', 'fzf']

Plug 'ap/vim-buftabline'
" }}}

" Telescope {{{
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
" Find files using Telescope command-line sugar.
nnoremap <leader>t <cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍<cr>
" nnoremap <leader>t <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>h <cmd>Telescope help_tags<cr>
" }}}

" New {{{
" Plug 'dstein64/vim-startuptime'
Plug 'voldikss/vim-floaterm'
let g:floaterm_keymap_toggle = '<F1>'
let g:floaterm_keymap_new    = '<F2>'
let g:floaterm_keymap_prev   = '<F3>'
let g:floaterm_keymap_next   = '<F4>'
Plug 'AndrewRadev/splitjoin.vim'

Plug 'windwp/nvim-autopairs'
lua << EOF
package.path = "/home/jesper/.vim/plugged/nvim-autopairs/lua/?.lua;" .. package.path
require("nvim-autopairs").setup {map_cr=false}
EOF

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'tpope/vim-endwise'
Plug 'github/copilot.vim'
" }}}

call plug#end()
filetype plugin indent on
" }}}

" UI {{{
" set background=light
au fileType * hi Normal guibg=NONE ctermbg=NONE
let g:tokyonight_transparent = 1
colorscheme tokyonight

" if &background == 'dark'
"   let g:indentLine_color_term = 238
" else
"   let g:indentLine_color_term = 253
" endif

syntax on
set colorcolumn=80
set synmaxcol=140
set title
set ffs=unix,mac,dos
" set scrolloff=25
" set autoindent
" set smartindent
set showmode
set modeline
set showcmd
set hidden
set wildmode=full
set ruler
set backspace=indent,eol,start
set laststatus=2
set number
set splitbelow
set splitright

set encoding=utf-8
setglobal fileencoding=utf-8

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
set textwidth=80
set list listchars=tab:»·,trail:·
"}}}

" Settings {{{
set history=500
set nobackup
set nowritebackup
set noswapfile
set undofile
set undodir=~/.tmp,/tmp
set mouse=a
" }}}

" Folding {{{
set foldenable
set foldnestmax=10
set foldlevelstart=10
set foldmethod=indent
nmap f1 :set foldlevel=1<cr>
nmap f2 :set foldlevel=2<cr>
nmap fa :set foldlevel=99<cr>
" }}}

" Key mappings {{{
map , <leader>
map <space> <leader>

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
set ignorecase
set smartcase
set gdefault
set showmatch

set wildignore+=node_modules/*
set wildignore+=app/assets/images/**/*
set wildignore+=vendor/cache/**/*

nnoremap <leader>, :noh<cr>
" nnoremap <space> /
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

" Function Keys {{{
set pastetoggle=<F3>
" }}}

" Ruby {{{
noremap <Leader>m :Emodel<space>
noremap <Leader>c :Econtroller<space>
" }}}

" New stuff {{{
" autocmd bufwritepost ~/code/dotfiles/i3/config :silent !i3-msg restart ; notify-send "Reloaded i3 :)"
au BufReadPost *.html* set formatoptions-=t

if has("nvim")
  " Terminal inside vim
  autocmd TermOpen * startinsert
  command! -nargs=* T split | resize 25 | terminal <args>
  " nnoremap <leader>c :T<cr>
" lua << EOF
"   vim.o.ch = 0
" EOF
endif
noremap <f1> <Nop>
nmap <silent> gx :!xdg-open '<cWORD>'<cr>
nmap Y yy

" Substitute in line
nnoremap gs "zye:%s/<C-R>z//g<left><left>
" }}}
