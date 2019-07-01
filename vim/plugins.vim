" ===== Vim Plug =====
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'

Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'Valloric/YouCompleteMe'

Plug 'hashivim/vim-terraform'
call plug#end()

" ===== nerdcommenter =====
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" ===== nertree =====
" auto open if no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" auto close if nertree is the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" configs
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" remaps
map <leader>f :NERDTreeToggle<CR>
map <silent> <leader>v :NERDTreeFind<CR>

" ===== YouCompleteMe =====
let g:ycm_use_clangd = 0
let g:ycm_autoclose_preview_window_after_completion = 1
