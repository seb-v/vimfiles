set nocompatible
set nu
set hlsearch
set t_Co=256
set tabstop=4
set expandtab
set shiftwidth=4
syntax on
set autowrite

call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'scrooloose/nerdtree'
Plug 'tomasiser/vim-code-dark'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'airblade/vim-gitgutter'
"Plug 'C:/ProgramData/chocolatey/lib/fzf'
"Plug '~/.fzf'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'nelstrom/vim-visual-star-search'
Plug 'majutsushi/tagbar'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'vim-syntastic/syntastic'
call plug#end()

"custom shit
let g:fugitive_gitlab_domains = ['http://vsi-git-001', 'http://vsi-git-001.siradel.local']


colorscheme codedark
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"let g:airline#extensions#tabline#enabled = 1
"let g:airline_powerline_fonts = 1

"Remove gVim GUI stuffs
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

set guifont=Consolas:h12
if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
	set guifont=Monaco:h13
  endif
endif

set backspace=2
"set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.obj,*.pdb,*.hg,*.svn,*\\bin\\*,*\\bin64\*,*.dll,*.sdf,*.pch,*.cache,*.ilk,*.tlog,*.lib
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files sources -co --exclude-standard']
let g:ctrlp_by_filename = 0
let g:ctrlp_max_files=0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_regexp = 1
let g:ctrlp_by_filename = 1
let g:ctrlp_lazy_update = 1
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:30'
let mapleader= "\<Space>"
set diffopt=iwhite
nmap <F8> :TagbarToggle<CR>
nmap <F4> :!ctags -R --sort=yes --extra=+f --fields=+iaS --languages=C++ .<CR>
nnoremap <F12> :e $MYVIMRC<CR>
"file cleanup
nnoremap <F10> :%retab<CR>
nnoremap <F9> :e ++ff=dos<CR>
let WordValue = expand("<cword>")

nnoremap <Leader>p :Files<CR>
nnoremap <Leader>t :Tags<CR>
nnoremap <Leader>o :Buffers<CR>
nnoremap <Leader>h :History<CR>
nnoremap <Leader>c :Commits<CR>
nnoremap <Leader>H :History:<CR>
nnoremap <Leader>g :Glog -- % \| copen<CR>
nnoremap <Leader>a :cclose<CR>
nnoremap <Leader><Down> :cnext<CR>
nnoremap <Leader><Up> :cprev<CR>
nnoremap <Leader>b :Gblame -w<CR>
nnoremap <Leader>i :Gbrowse<CR>
"nnoremap <Leader>f :Ggrep
nnoremap <Leader>f :Rg <C-R><C-W><CR>
nnoremap <Leader>s :Gstatus<CR>
nnoremap <Leader>do :diffget<CR>
nnoremap <Leader>dp :diffput<CR>

function! SwitchSourceHeader()
    if (expand("%:e") == "cpp")
        execute 'tag' join([expand("%:t:r"), "h"], ".")
    else
        execute 'tag' join([expand("%:t:r"), "cpp"], ".")
    endif
endfunction

map <Leader>q :call SwitchSourceHeader()<CR>
map <C-k><C-o> :call SwitchSourceHeader()<CR>

nnoremap <F12> :e $MYVIMRC<CR>
nnoremap <C-s> :w <CR>

"golang
nnoremap <F5> : GoBuild<CR>
nnoremap <C-F5> : GoRun<CR>
nmap <Leader>)  <F11>
nmap <Leader>$  <F12>
nmap <Leader>&  <F5>
nmap <Leader>é  <C-F5>
nmap <Leader>-  <F12>

"reformating C++ files
"map <C-I> :pyf d:/llvm/share/clang/clang-format.py<cr>

"#    Deleting trailing spaces
autocmd BufWritePre * %s/\s\+$//e

set ignorecase
set smartcase

" Syntax python
let g:syntastic_mode_map = {
    \ "mode": "passive",
    \ "active_filetypes": ["python"],
    \ "passive_filetypes": [] }

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
