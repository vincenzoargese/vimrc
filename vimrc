" --------------------------------------------------------------------
" Author: Vincenzo Argese
" Date: 2025-01-19
" Version: 2.0
" Web: https://www.vasystems.it
" Link: https://github.com/vincenzoargese/vimrc
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
" --------------------------------------------------------------------

" Leader Key
"------------
let mapleader = "\<Space>"  " Use Space leader key

" General Settings
"-------------------------
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
filetype plugin indent on
set mouse=a
set background=dark
set encoding=utf-8
set nobackup              " No backup file
set nowritebackup         " No backup file
set noswapfile            " No file swap
set hidden                " Buffer
set updatetime=300        " Fast update
set shortmess+=c          " No message 

" VimPlug - Plugin Manager
"------------------------------
call plug#begin('~/.vim/plugged')

  Plug 'preservim/nerdtree'                             " A file explorer for quick navigation.
  Plug 'dense-analysis/ale'                             " For linting and real-time error handling.
  Plug 'neoclide/coc.nvim', {'branch': 'release'}       " Autocompletion and language support.
  Plug 'sheerun/vim-polyglot'                           " Multi-language support.
  Plug 'vim-airline/vim-airline'                        " Airline footer bar
  Plug 'vim-airline/vim-airline-themes'                 " Airline themes
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }   " Search files and directories
  Plug 'junegunn/fzf.vim'                               " FZF support for ViM
  Plug 'tpope/vim-fugitive'                             " Git integration
  Plug 'tpope/vim-rhubarb'                              " Git repository navigation
  Plug 'airblade/vim-gitgutter'                         " Git realtive changes
  Plug 'joshdick/onedark.vim'                           " One Dark theme like Github Theme

call plug#end()
"--------------- End VimPlug

" Vundle - Plugin Manager
"-----------------------------
"set nocompatible
"filetype off

"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()

"Plugin 'VundleVim/Vundle.vim'

"Plugin 'caglartoklu/qbcolor.vim'            " Nostalgic QBasic-style theme for '90s lovers.

"call vundle#end()
"filetype plugin indent on
"--------------------------------------- End Vundle

" CoC Autocomple
"-------------------
set completeopt=menuone,noinsert,noselect
let g:coc_global_extensions = ['coc-clangd', 'coc-python', 'coc-html', 'coc-css', 'coc-tsserver']

" Tab for autocomplete
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Confirm with enter
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Key K for documentation
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Github
"-------------
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gp :Gpush<CR>
nnoremap <leader>gl :Gpull<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gb :Gbrowse<CR>

" NERDTree
"----------
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let NERDTreeShowHidden=1

" FZF Configuration
"-------------------
nnoremap <C-p> :Files<CR>
nnoremap <C-g> :GFiles<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>h :History<CR>

" ALE Configuration
"-------------------
let g:ale_linters = {
\   'python': ['pylint', 'flake8'],
\   'javascript': ['eslint'],
\   'typescript': ['tslint']
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black'],
\   'javascript': ['prettier'],
\   'typescript': ['prettier']
\}
let g:ale_fix_on_save = 1

" QBasic colors
"----------------
"colorscheme qbcolor
"set gfn=PxPlus_IBM_VGA9:h18:cANSI:qDRAFT
"let g:qbcolor_bg = "qb_blue"
"let g:airline_theme='light'                " Airline theme light

" One Dark Theme like Github Theme
"----------------------------------
if (has("termguicolors"))
    set termguicolors
endif
colorscheme onedark
" Visual general settings
set termguicolors                     " True coloe
set signcolumn=yes                    " Show git signs

" Configurazione One Dark
let g:airline_theme='onedark'
let g:onedark_hide_endofbuffer = 1    " hidden ~ caracter
let g:onedark_terminal_italics = 1    " Cursive on
let g:onedark_color_overrides = {
\ "black": {"gui": "#21252b", "cterm": "235", "cterm16": "0" },
\ "purple": {"gui": "#c678dd", "cterm": "170", "cterm16": "5" }
\}

" Airline One Dark Theme
let g:airline_theme='onedark'
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Personalizzazioni aggiuntive di syntax highlighting
hi Comment cterm=italic gui=italic    " Coursive comments
hi Search guibg=#3e4452 guifg=NONE    " Light search colore 
hi Visual guibg=#3e4452               " Light visual search color
hi CursorLine guibg=#2c313a           " Light line cursor color

" Miglioramenti per specifici linguaggi
augroup language_specific
    autocmd!
    " JavaScript/TypeScript
    autocmd FileType javascript,typescript hi jsFunction gui=italic
    autocmd FileType javascript,typescript hi jsArrowFunction gui=italic
    
    " Python
    autocmd FileType python hi pythonFunction gui=italic
    autocmd FileType python hi pythonDecorator guifg=#c678dd gui=italic
    
    " Markdown
    autocmd FileType markdown hi markdownHeadingDelimiter guifg=#e06c75
    autocmd FileType markdown hi markdownCode guifg=#56b6c2
augroup END

" Airline standard bar configuration
"--------------------------------------
let g:airline#extensions#tabline#enabled = 1

function! ModeFull()
  return {
        \ 'n': 'Normal',
        \ 'no': 'Operator Pending',
        \ 'v': 'Visual',
        \ 'V': 'Visual Line',
        \ '^V': 'Visual Block',
        \ 's': 'Select',
        \ 'S': 'Select Line',
        \ '^S': 'Select Block',
        \ 'i': 'Insert',
        \ 'R': 'Replace',
        \ 'Rv': 'Virtual Replace',
        \ 'c': 'Command',
        \ 'cv': 'Vim Ex',
        \ 'ce': 'Ex',
        \ 'r': 'Hit-Enter',
        \ 'rm': 'More',
        \ 'r?': 'Confirm',
        \ '!': 'Shell',
        \ 't': 'Terminal'
        \ }[mode()]
endfunction

let g:airline_section_a = '%{ModeFull()}'                                     " Vim Mode
let g:airline_section_b = '%{expand("%:p")}'                                  " File Path
let g:airline_section_c = '%t'                                                " File Name
let g:airline_section_x = '%{&filetype} | %{&fileformat} | %{&fileencoding}'  " Type, Format, encoding
let g:airline_section_z = 'Ln %l/%L (%p%%) | Col %c'                          " Line/Total and Column
