set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
let g:loaded_perl_provider = 0

if $SKIP_VIMRC == 'true'
  finish
endif

lua require('plugins')
lua require('cmp_config')
lua require('treesitter_config')
lua require('keymaps')

source ~/.vimrc
