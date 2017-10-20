set nocompatible
set nu
set hlsearch
set t_Co=256
set tabstop=4
syntax on

call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'scrooloose/nerdtree'
Plug 'tomasiser/vim-code-dark'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

colorscheme codedark
"let g:airline#extensions#tabline#enabled = 1
"let g:airline_powerline_fonts = 1

"Remove gVim GUI stuffs
set guioptions-=m 
set guioptions-=T 
set guioptions-=r 
set guioptions-=L 

set guifont=Consolas:h12

set backspace=2
"set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.obj,*.pdb,*.hg,*.svn,*\\bin\\*,*\\bin64\*,*.dll,*.sdf,*.pch,*.cache,*.ilk,*.tlog,*.lib
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_by_filename = 0
let g:ctrlp_max_files=0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_regexp = 1
let g:ctrlp_by_filename = 1
let mapleader= "\<Space>"
nnoremap <Leader>p :CtrlP<CR>
nnoremap <Leader>o :CtrlPBuffer<CR>
nnoremap <Leader>g :Glog -- % \| copen<CR>
nnoremap <Leader>a :cclose<CR>
nnoremap <Leader><Down> :cnext<CR>
nnoremap <Leader><Up> :cnext<CR>
nnoremap <Leader>f :Ggrep 
