" Install vim-plug if necessary -- May fail if ~/.vim doesn't exist. Simply
" run vim again
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install plugins!
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ParamagicDev/vim-medic_chalk'
call plug#end()

" Setup some configs

" NerdTree
" Always show dot files
let NERDTreeShowHidden=1
" End NerdTree

" Add line numbers
set number

" Set up syntax highlighting
colorscheme medic_chalk
set term=xterm-256color
filetype plugin indent on
syntax on
