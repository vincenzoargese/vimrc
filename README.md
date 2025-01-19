# .vimrc

ViM ...I'm lovin it

Dear developers, IT professionals, and system administrators worldwide, this is my semi-final version of the `.vimrc` file, and I want to share it with everyone.

## Introduction

The goal of this configuration is to have a powerful and customizable editor capable of meeting the needs of:

- **Developers**: with support for C, C++, Python, HTML, CSS, and JavaScript.
- **System Administrators**: for quick and comfortable editing of configuration files on Linux and macOS systems.

I revised this configuration to overcome some issues with `YouCompleteMe` on Debian 12 stable and to make it even more complete and versatile.

> **Note:** A future TODO is to integrate OmniSharp and plugins for Unity3D, but for game development, I have fully embraced Godot and prefer to use its environment for GDscript.

## Installation Guide

### Create the ViM Directory

```bash
mkdir ~/.vim
```

### Install Plugin Managers

#### VimPlug

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

#### Vundle

```bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

## Description of the `.vimrc` File

This configuration includes:

### General Settings

- **Line Numbers**:
  ```vim
  set number
  set relativenumber
  ```
  Displays line numbers and relative references to facilitate navigation.

- **Visual Guidelines**:
  ```vim
  set cursorline
  set showcmd
  set showmatch
  set wildmenu
  ```
  Improves text readability and navigation.

- **Tabs and Spaces**:
  ```vim
  set tabstop=4
  set shiftwidth=4
  set expandtab
  ```
  Configures tab behavior to adhere to coding standards.

- **Mouse Support**:
  ```vim
  set mouse=a
  ```
  Enables mouse support for navigating within ViM.

### Supported Plugins (via VimPlug)

- **NERDTree**: A file explorer for quick navigation.
  ```vim
  Plug 'preservim/nerdtree'
  ```

- **ALE**: For linting and real-time error handling.
  ```vim
  Plug 'dense-analysis/ale'
  ```

- **CoC.nvim**: Autocompletion and language support.
  ```vim
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  ```

- **QBColor**: Nostalgic QBasic-style theme for '90s lovers.
  ```vim
  Plug 'vim-scripts/qbcolor'
  ```
  This plugin transforms your ViM into a retro paradise, bringing back the classic look of good old QBasic!

### Additional Customizations

- **Syntax Highlighting**:
  ```vim
  syntax on
  filetype plugin indent on
  ```

- **Optimized Performance**:
  ```vim
  set hidden
  set history=1000
  ```

## TODO

- Integrate OmniSharp for Unity3D support.
- Add specific configurations to enhance the Godot experience.

## License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT). Anyone is free to improve this configuration and, if they wish, credit me as the original author.

## How to Contribute

Feel free to clone this repository, experiment, and propose changes:

1. Fork the project.
2. Create a branch for your modifications.
3. Submit a pull request with a clear description of the improvements.

Thank you for reading this guide! I hope it proves helpful and inspires you to customize your own ViM editor.
