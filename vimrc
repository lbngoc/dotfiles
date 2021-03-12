set nocompatible
"set nowrap
set number
set ruler
set hlsearch
if has('mouse')
    set mouse=a
endif
set encoding=utf8
if (has('macunix'))
    set clipboard=unramedplus
else
    set clipboard=unnamedplus
endif
set autoread
set autowrite
set autoindent
set si "smart indent

" vim-Plug
call plug#begin()
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'morhetz/gruvbox'
" Plug 'tpope/vim-obsession'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'wesQ3/vim-windowswap'
Plug 'godlygeek/tabular'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-startify'
" Plug 'terryma/vim-multiple-cursors'
" Plug 'Valloric/YouCompleteMe'
" Plug 'christoomey/vim-tmux-navigator'
Plug 'jiangmiao/auto-pairs'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'Chiel92/vim-autoformat'
Plug 'nathanaelkane/vim-indent-guides'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()

" Set Proper Tabs
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
highlight ExtraWhitespace ctermbg=red guibg=red

"set list
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»

" Always display the status line
set laststatus=2

" Enable Elite mode, No ARRRROWWS!!!!
let g:elite_mode=1

" Indent with Tab
" Normal Mode, Visual Mode, and Select Mode,
" use <Tab> and <Shift-Tab> to indent
" @see http://c9s.blogspot.com/2007/10/vim-tips.html
nmap <tab> v>
map <s-tab> v<
vmap <tab> >gv
vmap <s-tab> <gv

"Enable highlighting of the current line
set cursorline

" Theme and Styling
set t_Co=256
set background=dark

if (has("termguicolors"))
    set termguicolors
endif

let mapleader=","
let base16colorspace=256  " Access colors present in 256 colorspace

" Quickly edit .vimrc file
nmap <Leader>e :e ~/.vimrc<CR>
" Source .vimrc file
noremap <Leader>r :so ~/.vimrc<CR>

imap ˙ <Left>
imap ∆ <Down>
imap ˚ <Up>
imap ¬ <Right>
imap  <PageUp>
imap Ô <PageDown>

" Swap lines
nnoremap <C-S-Down> :m .+1<CR>==
nnoremap <C-S-Up> :m .-2<CR>==
inoremap <C-S-Down> <Esc>:m .+1<CR>==gi
inoremap <C-S-Up> <Esc>:m .-2<CR>==gi
vnoremap <C-S-Down> :m '>+1<CR>gv=gv
vnoremap <C-S-Up> :m '<-2<CR>gv=gv

" Some mapping Hotkeys
map <C-o> :NERDTreeToggle<CR>
" map <C-S-p> :CtrlPMRUFiles<CR>

" CtrlP Settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 0 "'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules|bower_components)$',
            \ 'file': '\v\.(exe|so|dll)$',
            \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
            \ }

" Auto change CurrentWorkingDir
let g:NERDTreeChDirMode = 2

" Auto format
map <A-S-F> :Autoformat<cr>

" NerdCommenter
map <C-_> <Plug>NERDCommenterToggle

" Open new split panes to right and bottom, which feels more natural
"set splitbelow
"set splitright

" Syntax Highlight
syntax on
colorscheme gruvbox

"\\ Force save file when I forgot run 'sudo vim file'
"\\ With Great Power Comes Great Responsibility
cmap w!! %!sudo tee > /dev/null %

" Quicker window movement
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-h> <C-w>h
"nnoremap <C-l> <C-w>l

" Map Esc to jj
:imap jj <Esc>
