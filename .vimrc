runtime! debian.vim
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
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
Plugin 'dense-analysis/ale'
Plugin 'tpope/vim-surround'
Plugin 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/0.x'
  \ }
Plugin 'alvan/vim-closetag'
"Plugin 'sainnhe/gruvbox-material'
Plugin 'joshdick/onedark.vim'
"Plugin 'cocopon/iceberg.vim'
Plugin 'ap/vim-css-color'

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
		wincmd L
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

let NERDTreeShowHidden=1
let g:auto_save = 1

filetype plugin indent on
syntax on

if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=2\x7" " Underscore in normal mode
endif

set t_Co=256

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

if has('termguicolors')
  set termguicolors
endif

let g:airline_powerline_fonts = 1
let g:airline_theme='onedark'
"let g:gruvbox_material_background = 'hard'
"let g:gruvbox_material_sign_column_background = 'none'
let g:onedark_termcolors=16
let NERDTreeMinimalUI=1
let g:move_key_modifier = 'C'
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'
let g:closetag_filetypes = 'html,xhtml,phtml,js'
let g:closetag_xhtml_filetypes = 'xhtml,jsx,js'
let g:closetag_shortcut = '>'
set smartcase
set incsearch
set nu
set autoindent
set smartindent	
set tabstop=2
set smarttab
set indentexpr
set nowrap
set hidden
set background=dark
colorscheme onedark
set encoding=UTF-8
set listchars=tab:\│\ 
set list
map <C-n> :NERDTreeToggle<CR>
map <C-\> :call GetTerm()<CR>
nnoremap <C-Down> :update<cr>
inoremap <C-Down> <Esc>:update<CR>gi
nnoremap <C-Up> :WintabsClose<CR>
map <C-Left> <Plug>(wintabs_previous)
map <C-Right> <Plug>(wintabs_next)
"hi LineNr ctermbg=232