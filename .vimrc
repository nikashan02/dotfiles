"random comment
runtime! debian.vim
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'preservim/nerdtree'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'joshdick/onedark.vim'
Plugin 'flrnd/plastic.vim'
Plugin 'cocopon/iceberg.vim'
Plugin 'gcmt/taboo.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'jremmen/vim-ripgrep'
Plugin 'sheerun/vim-polyglot'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'kien/ctrlp.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'othree/yajs.vim'
Plugin 'zefei/vim-wintabs'
Plugin 'matze/vim-move'
Plugin 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/0.x'
  \ }

call vundle#end()            " required

fu RunProgram()
	if &filetype ==# 'python'
		! python3 %
	elseif &filetype ==# 'javascript'
		! node %	
	elseif &filetype ==# 'c'
		! gcc %; ./a.out; rm a.out
	elseif &filetype ==# 'cpp'
		! gcc %; ./a.out; rm a.out
	else
		echom "un supported filetype"
	endif
endfu

fu GetTerm()
		term
		wincmd x
		res 40
endfu

fu GetCommitLog()
		wincmd h
		sp
		wincmd j
		GlLog
		q
		wincmd l
endfu

au VimLeave * NERDTreeClose
au VimEnter * NERDTree

let NERDTreeShowHidden=1
let g:auto_save = 1

filetype plugin indent on
syntax on

if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=2\x7" " Underscore in normal mode
endif

let g:airline_powerline_fonts = 1
let NERDTreeMinimalUI=1
let g:move_key_modifier = 'C'
set smartcase
set incsearch
set nu
set autoindent
set smartindent	
set tabstop=4 
set nowrap
set hidden 
colo iceberg 
set background=dark
set encoding=UTF-8
map <C-n> :NERDTreeToggle<CR>
map <C-\> :call GetTerm()<CR>
nnoremap <C-Down> :update<cr>
inoremap <C-Down> <Esc>:update<CR>gi
nnoremap <C-Up> :WintabsClose<CR>
map <C-Left> <Plug>(wintabs_previous)
map <C-Right> <Plug>(wintabs_next)
hi LineNr ctermbg=232