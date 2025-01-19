# .vimrc

ViM ...I'm lovin it

Cari amici sviluppatori, informatici e sistemisti di tutto il mondo, questa è la mia versione semi-definitiva del file `.vimrc`, che voglio condividere con il mondo intero.

## Introduzione

L'obiettivo di questa configurazione è avere un editor potente e personalizzabile, capace di soddisfare le esigenze di:

- **Sviluppatori**: con supporto per C, C++, Python, HTML, CSS, JavaScript.
- **Sistemisti**: per un editing veloce e comodo di file di configurazione su sistemi Linux e macOS.

Ho rivisto questa configurazione per superare alcuni problemi con `YouCompleteMe` su Debian 12 stable e per renderla ancora più completa e versatile.

> **Nota:** Un TODO futuro è integrare OmniSharp e plugin per Unity3D, ma per game development ho ormai abbracciato Godot e preferisco usare il suo ambiente per GDscript.

## Guida all'installazione

### Creazione della directory ViM

```bash
mkdir ~/.vim
```

### Installazione dei gestori di plugin

#### VimPlug

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

#### Vundle

```bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

## Descrizione del file `.vimrc`

Questa configurazione include:

### Impostazioni generali

- **Numerazione delle righe**:
  ```vim
  set number
  set relativenumber
  ```
  Visualizza il numero delle righe e riferimenti relativi per facilitare la navigazione.

- **Linee guida visive**:
  ```vim
  set cursorline
  set showcmd
  set showmatch
  set wildmenu
  ```
  Migliora la leggibilità e la navigazione del testo.

- **Tab e spazi**:
  ```vim
  set tabstop=4
  set shiftwidth=4
  set expandtab
  ```
  Configura il comportamento dei tab secondo gli standard di codifica.

- **Supporto mouse**:
  ```vim
  set mouse=a
  ```
  Abilita l'uso del mouse per navigare all'interno di ViM.

### Plugin supportati (tramite VimPlug)

- **NERDTree**: Esploratore file per una navigazione rapida.
  ```vim
  Plug 'preservim/nerdtree'
  ```

- **ALE**: Per linting e gestione degli errori in tempo reale.
  ```vim
  Plug 'dense-analysis/ale'
  ```

- **CoC.nvim**: Autocompletamento e linguaggi supportati.
  ```vim
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  ```

- **QBColor**: Tema nostalgico stile QBasic per gli amanti degli anni '90.
  ```vim
  Plug 'vim-scripts/qbcolor'
  ```
  Questo plugin trasforma il tuo ViM in un ritorno al passato, con il look classico del vecchio e caro QBasic!

### Personalizzazioni aggiuntive

- **Abilitazione della sintassi**:
  ```vim
  syntax on
  filetype plugin indent on
  ```

- **Performance ottimizzata**:
  ```vim
  set hidden
  set history=1000
  ```

## TODO

- Integrare OmniSharp per il supporto a Unity3D.
- Aggiungere configurazioni specifiche per migliorare l'esperienza con Godot.

## Licenza

Questo progetto è distribuito sotto la licenza [MIT License](https://opensource.org/licenses/MIT). Chiunque può migliorare questa configurazione e, se lo desidera, citarmi come autore originale.

## Come contribuire

Sentitevi liberi di clonare questo repository, sperimentare e proporre modifiche:

1. Effettuate un fork del progetto.
2. Create un branch per le vostre modifiche.
3. Inviate una pull request con una descrizione chiara delle migliorie.

Grazie per aver letto questa guida! Spero che vi sia utile e vi ispiri a personalizzare il vostro ViM editor.
