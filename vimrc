" ===========================================
" Vim Configuration File - Vincenzo Argese
" https://www.vasystems.it | https://github.com/vincenzoargese/vimrc
" Author: Vincenzo Argese
" Web: https://www.vasystems.it
" Link: https://github.com/vincenzoargese/vimrc
"
" Title: Vim Configuration File
" Date: 2025-01-19
"
" Created: 2025-01-19
" Updated: 2025-03-03
" Version: 2.1
"
" Description:
" This is my personal Vim configuration file.
" It is a mix of plugins and settings that I have found useful over the years.
" Nostalgic QBasic-style theme for '90s lovers. bringing back the classic look of good old QBasic!
"
" License:
" This project is licensed under the [MIT License](https://opensource.org/licenses/MIT).
" Anyone is free to improve this configuration and, if they wish,
" credit me as the original author.
" ===========================================

" ========================
" 1. Leader Key
" ========================
let mapleader = "\<Space>"  " Use Space leader key

" ========================
" 2. General Settings
" ========================
"set number
"set relativenumber
set cursorline
syntax on
set showcmd
set wildmenu
set showmatch
set tabstop=4
set shiftwidth=4
set expandtab
set mouse=a
set background=dark
set encoding=utf-8
set nobackup
set nowritebackup
set noswapfile
set hidden
set updatetime=300
set shortmess+=c
set termguicolors
set signcolumn=yes

<<<<<<< HEAD
" VimPlug - Plugin Manager
"------------------------------
call plug#begin('~/.vim/plugged')                       " call plug#begin('C:\Users\<user>\vimfiles\plugged')
=======
" ========================
" 3. Plugin Manager - VimPlug
" ========================
call plug#begin('~/.vim/plugged')
>>>>>>> 153adcf (vimrc Improved! ;-))

  " File Navigation
  Plug 'preservim/nerdtree'                             " File explorer
  Plug 'junegunn/fzf', { 'do': './install --bin' }     " Fuzzy finder
  Plug 'junegunn/fzf.vim'                               " FZF support for Vim

  " Code Analysis & Linting
  Plug 'dense-analysis/ale'                             " Linting and real-time error checking
  Plug 'neoclide/coc.nvim', {'branch': 'release'}       " Autocompletion and language support

  " Language Support
  Plug 'sheerun/vim-polyglot'                           " Multi-language support

  " Git Integration
  Plug 'tpope/vim-fugitive'                             " Git commands
  Plug 'tpope/vim-rhubarb'                              " GitHub integration
  Plug 'airblade/vim-gitgutter'                         " Git diff in sign column

  " UI Enhancements
  Plug 'vim-airline/vim-airline'                        " Status bar
  Plug 'vim-airline/vim-airline-themes'                 " Themes for airline
  Plug 'joshdick/onedark.vim'                           " One Dark theme

  " AI & Copilot
  Plug 'github/copilot.vim'                             " GitHub Copilot

  " Nostalgic Theme
  Plug 'caglartoklu/qbcolor.vim'                        " QBasic-style nostalgic theme

call plug#end()

" ========================
" 4. CoC (Conquer of Completion) Configuration
" ========================
set completeopt=menuone,noinsert,noselect
let g:coc_global_extensions = ['coc-clangd', 'coc-python', 'coc-html', 'coc-css', 'coc-tsserver']

" Tab for autocomplete
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Confirm with Enter
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" ========================
" 5. Git Keybindings
" ========================
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gp :Gpush<CR>
nnoremap <leader>gl :Gpull<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gb :Gbrowse<CR>

" ========================
" 6. NERDTree Keybindings
" ========================
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let NERDTreeShowHidden=1

" ========================
" 7. FZF Configuration
" ========================
nnoremap <C-p> :Files<CR>
nnoremap <C-g> :GFiles<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>h :History<CR>

" ========================
" 8. ALE Configuration (Linting)
" ========================
let g:ale_linters = {
\   'python': ['pylint', 'flake8'],
\   'javascript': ['eslint'],
\   'typescript': ['eslint']
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black'],
\   'javascript': ['prettier'],
\   'typescript': ['prettier']
\}
let g:ale_fix_on_save = 1

" ========================
" 9. Theme & Visual Enhancements
" ========================

" One Dark colors
colorscheme onedark
hi Comment cterm=italic gui=italic
hi Search guibg=#3e4452 guifg=NONE
hi Visual guibg=#3e4452
hi CursorLine guibg=#2c313a

" QBasic colors
"colorscheme qbcolor
"set guifont=PxPlus_IBM_VGA9:h18
"let g:qbcolor_bg = "qb_blue"
"let g:airline_theme='light'                " Airline theme light
"let g:airline_powerline_fonts = 1          " Airline powerline fonts on

" ========================
" 10. Language-Specific Improvements
" ========================
augroup language_specific
    autocmd!
    autocmd FileType javascript,typescript hi jsFunction gui=italic
    autocmd FileType javascript,typescript hi jsArrowFunction gui=italic
    autocmd FileType python hi pythonFunction gui=italic
    autocmd FileType python hi pythonDecorator guifg=#c678dd gui=italic
    autocmd FileType markdown hi markdownHeadingDelimiter guifg=#e06c75
    autocmd FileType markdown hi markdownCode guifg=#56b6c2
augroup END

" ========================
" 11. Status Bar Configuration (Airline)
" ========================
let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" ========================
" 12. Copilot and ALE Status
" ========================
let g:ale_enabled = 0
let g:copilot_enabled = 0
