"""""""""""""""""""""""""""""
" ViM - Impostazioni di base
"""""""""""""""""""""""""""""
set nocompatible            " Utilizza Vim in modalità avanzata
set encoding=utf-8          " Imposta l'encoding a UTF-8
set mouse=a                 " Abilita il supporto per il mouse
set tabstop=4               " Imposta la larghezza della tabulazione a 4 spazi
set softtabstop=4           " Imposta la larghezza della tabulazione per il backspace a 4 spazi
set shiftwidth=4            " Imposta la larghezza dello spostamento a 4 spazi
set expandtab               " Usa spazi al posto delle tabulazioni
set autoindent              " Abilita l'autoindentazione
set smartindent             " Abilita l'indentazione intelligente
"set number                  " Mostra il numero delle righe
set cursorline              " Evidenzia la riga corrente
set nowrap                  " Disabilita il wrapping delle righe
set hlsearch                " Evidenzia le corrispondenze durante la ricerca
set incsearch               " Evidenzia mentre si digita la ricerca
syntax on                   " Abilita il syntax highlighting
set background=dark         " Imposta lo sfondo scuro (cambia a light per sfondi chiari)
colorscheme desert          " Imposta lo schema di colori (puoi scegliere altri temi)


""""""""""""""""""""""""""""""""""""""""""
" Vundle - Gestore dei Plugin
" https://github.com/VundleVim/Vundle.vim
""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Plugin
Plugin 'scrooloose/nerdtree'      " NERDTree
Plugin 'kien/ctrlp.vim'           " CtrlP
Plugin 'vim-airline/vim-airline'  " vim-airline
Plugin 'tpope/vim-fugitive'       " Fugitive
Plugin 'dense-analysis/ale'       " Ale
Plugin 'tpope/vim-surround'       " Surround
Plugin 'SirVer/ultisnips'         " UltiSnips

""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe
" https://github.com/ycm-core/YouCompleteMe
""""""""""""""""""""""""""""""""""""""""""""

Plugin 'ycm-core/YouCompleteMe'   " YouCompleteMe

""""""""""""""""""""
" Plugin da testare
""""""""""""""""""""
"Plugin 'vim-scripts/C.vim'               " Syntax highlighting per C
"Plugin 'pangloss/vim-javascript'         " Syntax highlighting per JavaScript
"Plugin 'HerringtonDarkholme/yats.vim'    " Syntax highlighting per TypeScript
"Plugin 'mxw/vim-jsx'                     " Syntax highlighting per JSX
"Plugin 'othree/yajs.vim'                 " Syntax highlighting per ES6
"Plugin 'pearofducks/ansible-vim'         " Syntax highlighting per Ansible
"Plugin 'sheerun/vim-polyglot'            " Polyglot: supporto per vari linguaggi


call vundle#end()
filetype plugin indent on       " Abilita i plugin e l'indentazione basata sul tipo di file

"""""""""""""""""""""""""""
" YouCompleteMe - Settings
"""""""""""""""""""""""""""
" Default .ycm_extra_conf.py
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
"
"let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

" Abilita l'autocompletamento per i linguaggi
let g:ycm_semantic_triggers = {
            \ 'c,cpp,java': ['->', '.'],
            \ 'cs': ['.'],
            \ 'javascript': ['.', '->'],
            \ 'python': ['.'],
            \ 'typescript': ['.'],
            \ 'sql': ['.'],
            \ 'mysql': ['.'],
            \ 'html,html5': ['<', '>'],
            \ 'sh,zsh': ['.'],
            \ 'unity3d': ['.'],
            \ 'MonoBehaviour': ['.'],
            \ }

autocmd FileType c,cpp,cs,java,javascript,javascript.jsx,typescript,typescript.jsx,phaser3,unity3d,bash,zsh,sql,html,react,reactnative,jsx let g:ycm_semantic_triggers =  {'c,cpp': ['->', '.', ''], 'java': ['.', ''], 'javascript,javascript.jsx,typescript,typescript.jsx,phaser3,unity3d,react,reactnative,jsx': ['.', '']}

" Impostazioni aggiuntive di YouCompleteMe per migliore performance
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_complete_in_comments = 1
let g:ycm_key_invoke_completion = '<C-Space>'

" Riconoscimento dei file per vari linguaggi
"au BufNewFile,BufRead *.py set filetype=python
"au BufNewFile,BufRead *.cs set filetype=csharp
"au BufNewFile,BufRead *.js,*.jsx set filetype=javascript
"au BufNewFile,BufRead *.ts,*.tsx set filetype=typescript
"au BufNewFile,BufRead *.java set filetype=java
"au BufNewFile,BufRead *.sql set filetype=sql
"au BufNewFile,BufRead *.xml set filetype=xml
"au BufNewFile,BufRead *.sh set filetype=sh
"au BufNewFile,BufRead *.zsh set filetype=zsh
"au BufNewFile,BufRead *.c set filetype=c
"au BufNewFile,BufRead *.cpp set filetype=cpp
"

"""""""""""""""""""""""""""
" Keyboard Maps
"""""""""""""""""""""""""""
map <F2> :w<CR>            " Salva il file premendo F2
map <C-S> :wq<CR>          " Salva e chiudi premendo CTRL+S
" Python tabs map
"map <F7> :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
"map <F8> :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>
"
