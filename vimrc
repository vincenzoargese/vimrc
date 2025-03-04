" ===========================================
" Vim Configuration File - Vincenzo Argese
" https://www.vasystems.it | https://github.com/vincenzoargese/vimrc
" Author: Vincenzo Argese
" Web: https://www.vasystems.it
" X (Twitter): @VincenzoArgese
" Link: https://github.com/vincenzoargese/vimrc
"
" Title: Vim Configuration File
"
" Created: 2025-01-19
" Updated: 2025-03-04
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
" The leader key is a special key that allows you to create custom keybindings
" that are easy to remember and use.
" It is a great tool to improve your productivity and speed up your workflow.
" The default leader key is the backslash (\), but you can change it to any key you prefer.
" In this configuration, I have set the leader key to the Space bar.
" You can change it to any key you prefer by modifying the following line:
let mapleader = "\<Space>"  " Use Space leader key

" ========================
" 2. General Settings
" ========================
" This section contains general settings that improve the usability and appearance of Vim.
"
"set number               " Line numbering
"set relativenumber       " Relative numbering
set cursorline            " Highlight current line
syntax on                 " Enable syntax highlighting
set showcmd               " Show typed commands in the status bar
set wildmenu              " Improve navigation in completion suggestions
set showmatch             " Highlight matching parentheses
set tabstop=4             " Set tab size to 4 spaces
set shiftwidth=4          " Set auto-indent size to 4 spaces
set expandtab             " Replace tabs with spaces
set mouse=a               " Enable mouse usage
set background=dark       " Adapt colors to a dark background
set encoding=utf-8        " Set encoding to UTF-8
set nobackup              " No backup file
set nowritebackup         " No backup file
set noswapfile            " No file swap
set hidden                " Buffer
set updatetime=300        " Fast update
set shortmess+=c          " No message
set termguicolors         " Enable 24-bit RGB colors
set signcolumn=yes        " Show sign column

filetype plugin indent on " Enable plugin support and indentation management for specific files

" ========================
" 3. Plugin Manager - VimPlug
" ========================
" VimPlug is a plugin manager that simplifies the installation and management of plugins in Vim.
" It allows you to easily add, update, and remove plugins from your configuration.
" VimPlug is a great tool to improve your productivity and speed up your workflow.
" https://github.com/junegunn/vim-plug
" To install a new plugin, add a new line with the plugin name and URL in the following format:
" Plug 'username/repository'
" To update or remove a plugin, simply comment or delete the line.
" To install or update plugins, run the following command in Vim:
" :PlugInstall
" To remove plugins, run the following command in Vim:
" :PlugClean
" To update plugins, run the following command in Vim:
" :PlugUpdate
"
call plug#begin('~/.vim/plugged')

  " File Navigation
  Plug 'preservim/nerdtree'                             " File explorer - https://github.com/preservim/nerdtree
  Plug 'junegunn/fzf', { 'do': './install --bin' }      " Fuzzy finder - https://github.com/junegunn/fzf.vim
  Plug 'junegunn/fzf.vim'                               " FZF support for Vim

  " Code Analysis & Linting
  Plug 'dense-analysis/ale'                             " Linting and real-time error checking - https://github.com/dense-analysis/ale
  Plug 'neoclide/coc.nvim', {'branch': 'release'}       " Autocompletion and language support - https://github.com/neoclide/coc.nvim

  " Language Support
  Plug 'sheerun/vim-polyglot'                           " Multi-language support - https://github.com/sheerun/vim-polyglot

  " Git Integration
  Plug 'tpope/vim-fugitive'                             " Git commands - https://github.com/tpope/vim-fugitive
  Plug 'tpope/vim-rhubarb'                              " GitHub integration - https://github.com/tpope/vim-rhubarb
  Plug 'airblade/vim-gitgutter'                         " Git diff in sign column - https://github.com/airblade/vim-gitgutter

  " UI Enhancements
  Plug 'vim-airline/vim-airline'                        " Status bar - https://github.com/vim-airline/vim-airline
  Plug 'vim-airline/vim-airline-themes'                 " Themes for airline - https://github.com/vim-airline/vim-airline-themes
  Plug 'joshdick/onedark.vim'                           " One Dark theme - https://github.com/joshdick/onedark.vim

  " AI and Copilot
  Plug 'github/copilot.vim'                             " GitHub Copilot - https://github.com/github/copilot.vim

  " Nostalgic Theme
  Plug 'caglartoklu/qbcolor.vim'                        " QBasic-style nostalgic theme - https://github.com/caglartoklu/qbcolor.vim

call plug#end()

" ========================
" 4. CoC (Conquer of Completion) Configuration
" ========================
" CoC is a plugin that provides autocompletion and language support for a variety of languages
" It is highly customizable and can be configured to work with many extensions
" CoC is a great tool to improve your productivity and speed up your workflow
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
" Fugitive is a Git wrapper that provides a lot of useful commands
" for working with Git repositories directly from Vim.
" It is highly customizable and can be configured to work with many plugins.
" Fugitive is a great tool to improve your productivity and speed up your workflow.
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gp :Gpush<CR>
nnoremap <leader>gl :Gpull<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gb :Gbrowse<CR>

" ========================
" 6. NERDTree Keybindings
" ========================
" NERDTree is a file explorer that allows you to navigate your file system
" and open files and directories directly from Vim.
" It is highly customizable and can be configured to work with many plugins.
" NERDTree is a great tool to improve your productivity and speed up your workflow.
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let NERDTreeShowHidden=1

" ========================
" 7. FZF Configuration
" ========================
" FZF is a fuzzy finder that can be used to search for files, buffers, and more.
" It is highly customizable and can be configured to work with many plugins.
" FZF is a great tool to improve your productivity and speed up your workflow.
nnoremap <C-p> :Files<CR>
nnoremap <C-g> :GFiles<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>h :History<CR>

" ========================
" 8. ALE Configuration (Linting)
" ========================
" ALE is a plugin that provides linting and real-time error checking
" for a variety of languages.
" It is highly customizable and can be configured to work with many linters.
" Disabled at startup, see section 12 for more details.
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
" 9. Language-Specific Improvements
" ========================
" Highlighting for functions and decorators
" JavaScript and TypeScript
" Python
" Markdown
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
" 10. Theme & Visual Enhancements
" ========================
" Themes are a great way to customize the look and feel of Vim
"
" One Dark Theme like Github Theme
" ----------------
colorscheme onedark
hi Comment cterm=italic gui=italic
hi Search guibg=#3e4452 guifg=NONE
hi Visual guibg=#3e4452
hi CursorLine guibg=#2c313a
"
" QBasic colors - Nostalgic Theme
" ----------------
"colorscheme qbcolor
"set guifont=PxPlus_IBM_VGA9:h18
"let g:qbcolor_bg = "qb_blue"
"let g:airline_theme='light'
"let g:airline_powerline_fonts = 1

" ========================
" 11. Status Bar Configuration (Airline)
" ========================
" Airline is a status bar plugin that provides a lot of useful information
" about the current buffer and the state of Vim.
" It can be customized with themes and extensions.
if (has("termguicolors"))
    set termguicolors
endif

" One Dark Theme like Github Theme
let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" ========================
" 12. Startup Performance Improvements
" ========================
" Disable ALE and Copilot at startup - performance improvements
" This is useful when you want to enable them only for specific files
" or when you want to enable them manually
" If you want to enable them at startup, set the values to 1 or remove these lines.
"
" You can enable them manually with the following commands (I prefer enable them when needed):
" :ALEEnable | ALEDisable
" :Copilot enable | disable
let g:ale_enabled = 0
let g:copilot_enabled = 0
