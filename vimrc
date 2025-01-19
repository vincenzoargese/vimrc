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

" General Settings
"-------------------------
"set number
"set relativenumber
"set cursorline
syntax on
set showcmd
set wildmenu
set showmatch
set tabstop=4
set shiftwidth=4
set expandtab
filetype plugin indent on
set mouse=a


" VimPlug - Plugin Manager
"------------------------------
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'                           " A file explorer for quick navigation.
Plug 'dense-analysis/ale'                           " For linting and real-time error handling.
Plug 'neoclide/coc.nvim', {'branch': 'release'}     " Autocompletion and language support.
Plug 'sheerun/vim-polyglot'                         " Multi-language support.
Plug 'vim-airline/vim-airline'                      " Airline footer bar
Plug 'vim-airline/vim-airline-themes'               " Airline themes
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Search files and directories
Plug 'junegunn/fzf.vim'                             " FZF support for ViM
Plug 'tpope/vim-fugitive'                           " Git integration
Plug 'tpope/vim-rhubarb'                            " Git repository navigation
Plug 'airblade/vim-gitgutter'                       " Git realtive changes

call plug#end()
"--------------- End VimPlug

" Vundle - Plugin Manager
"-----------------------------
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'caglartoklu/qbcolor.vim'                  " Nostalgic QBasic-style theme for '90s lovers.

call vundle#end()
filetype plugin indent on
"--------------------------------------- End Vundle

" QBasic colors
"----------------
colorscheme qbcolor
set gfn=PxPlus_IBM_VGA9:h18:cANSI:qDRAFT
let g:qbcolor_bg = "qb_blue"

" Airline bar configuration
"----------------------------
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
let g:airline_section_z = 'Ln %l/%L (%p%%) | Col %c'                          " Line/Total and Col
let g:airline_theme='light'                                                   " Airline theme light

" CoC Autocomple
"-------------------
set completeopt=menuone,noinsert,noselect
let g:coc_global_extensions = ['coc-clangd', 'coc-python', 'coc-html', 'coc-css', 'coc-tsserver']

" Github
"-------------
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gp :Gpush<CR>
nnoremap <leader>gl :Gpull<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gb :Gbrowse<CR>
