
" Configure Vundle, plugin manager

    " required
    set nocompatible
    filetype off

" set the runtime path to include Vundle and initialize
    set runtimepath+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    " let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'

    " cscope maps
    Plugin 'joe-skb7/cscope-maps'

    " The file system explorer
    Plugin 'scrooloose/nerdtree'

    " Plugin that displays tags in a window, ordered by scope
    Plugin 'majutsushi/tagbar'

    " Plugin to respect the Linux kernel coding style
    Plugin 'vivien/vim-linux-coding-style'

    " Plugin for vim to enable opening a file in a given line
    Plugin 'bogado/file-line'

    " colorscheme based on the Espresso theme
    Plugin 'gmoe/vim-espresso'

    " A light and configurable statusline/tabline
    Plugin 'itchyny/lightline.vim'

    " Per project/tree configuration plugins
    Plugin 'LucHermitte/lh-vim-lib'
    Plugin 'LucHermitte/local_vimrc'

    if empty($NOYCM)
        " Autocompletion
        Plugin 'Valloric/YouCompleteMe'
    endif

    call vundle#end()

    " required
    filetype plugin indent on

" end of Vundle config

    set viminfo+=n~/.vim/.viminfo

" UI Config
    set number           " show line numbers
    set showcmd          " show command in bottom bar
    set wildmenu         " visual autocomplete for command menu
    set lazyredraw       " redraw only when we need to
    set showmatch        " highlight matching [{()}]
    set t_Co=256         " make Vim use 256 colors
    set background=dark
    colorscheme espresso " gmoe/vim-espresso
    set colorcolumn=81   " 80 characters line
    highlight ColorColumn ctermbg=Black ctermfg=DarkRed

" Spaces & Tabs
    syntax enable        " enable syntax processing
    set tabstop=4        " number of visual spaces per TAB
    set softtabstop=4    " number of spaces in tab when editing
    set expandtab        " tabs are spaces

" Searching
    set incsearch        " search as characters are entered
    set hlsearch         " highlight matches

" Movement
    " move vertically by visual line
    nnoremap j gj
    nnoremap k gk

    " move to beginning/end of line
    nnoremap B ^
    nnoremap E $

    " $/^ doesn't do anything
    nnoremap $ <nop>
    nnoremap ^ <nop>

    nnoremap gV `[v`]    " highlight last inserted text

    set backspace=2      " make backspace work like most other programs
    set encoding=utf-8   " encoding
    set mouse=

" Highlight trailing spaces
    " http://vim.wikia.com/wiki/Highlight_unwanted_spaces
    highlight ExtraWhitespace ctermbg=red guibg=red
    match ExtraWhitespace /\s\+$/
    autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
    autocmd BufWinLeave * call clearmatches()

" lightline.vim
    set laststatus=2
    let g:lightline = {
        \ 'colorscheme': 'espresso',
        \ 'active': {
        \     'left': [ [ 'mode', 'paste' ],
        \               [ 'readonly', 'filename' ] ],
        \ },
        \ 'component_function': {
        \     'filename': 'LightlineFilename',
        \ },
    \ }
    set noshowmode

    " https://github.com/itchyny/lightline.vim#can-i-trim-the-bar-between-the-filename-and-modified-sign
    function! LightlineFilename()
        let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
        let modified = &modified ? ' +' : ''
        return filename . modified
    endfunction

" NERDTree
    map <C-n> :NERDTreeToggle<cr>
    map <F2>  :NERDTreeToggle<cr>
    let NERDTreeIgnore = ['\.[oa]$']

" Tagbar
    map <F3>  :TagbarToggle<cr>

" vim-linux-coding-style
    let g:linuxsty_patterns = [ "/usr/src/" ]
    map <C-i> :LinuxCodingStyle<cr>
    map <F4>  :LinuxCodingStyle<cr>

" local_vimrc
    let g:local_vimrc = ['.vimrc.local']

" YouCompleteMe
    let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
    highlight YcmErrorSection cterm=none ctermbg=red ctermfg=white
    highlight YcmErrorSign cterm=none ctermbg=red ctermfg=white
    highlight YcmWarningSection cterm=none ctermbg=yellow ctermfg=black
    highlight YcmWarningSign cterm=none ctermbg=yellow ctermfg=black

