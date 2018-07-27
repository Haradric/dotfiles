
" Configure Vundle, plugin manager
    set nocompatible    " required
    filetype off        " required

" set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
        Plugin 'VundleVim/Vundle.vim'          " let Vundle manage Vundle, required
        Plugin 'joe-skb7/cscope-maps'          " cscope maps
        Plugin 'scrooloose/nerdtree'           " The file system explorer
        Plugin 'majutsushi/tagbar'             " Plugin that displays tags in a window, ordered by scope
        Plugin 'vivien/vim-linux-coding-style' " Plugin to respect the Linux kernel coding style
        Plugin 'bogado/file-line'              " Plugin for vim to enable opening a file in a given line

        if empty($NOYCM)
            Plugin 'Valloric/YouCompleteMe'    " Autocompletion
        endif

    call vundle#end()
    filetype plugin indent on   " required
" end of Vundle config

    set viminfo+=n~/.vim/.viminfo

"Spaces & Tabs
	syntax enable		" enable syntax processing
	set tabstop=4		" number of visual spaces per TAB
	set softtabstop=4	" number of spaces in tab when editing
	set expandtab		" tabs are spaces

"UI Config
	set number			" show line numbers
	set showcmd			" show command in bottom bar
	set wildmenu		" visual autocomplete for command menu
	set lazyredraw		" redraw only when we need to
	set showmatch		" highlight matching [{()}]

"Searching
	set incsearch		" search as characters are entered
	set hlsearch		" highlight matches

"Movement
	" move vertically by visual line
	nnoremap j gj
	nnoremap k gk

	" move to beginning/end of line
	nnoremap B ^
	nnoremap E $

	" $/^ doesn't do anything
	nnoremap $ <nop>
	nnoremap ^ <nop>

	nnoremap gV `[v`]	" highlight last inserted text

    set backspace=2     " make backspace work like most other programs
    set encoding=utf-8  " encoding

    set t_Co=256        " make Vim use 256 colors
    set colorcolumn=81  " 80 characters line
    highlight ColorColumn ctermbg=Black ctermfg=DarkRed

" Highlight trailing spaces
" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
    highlight ExtraWhitespace ctermbg=red guibg=red
    match ExtraWhitespace /\s\+$/
    autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
    autocmd BufWinLeave * call clearmatches()

" NERDTree settings
    map <C-n> :NERDTreeToggle<cr>
    map <F2>  :NERDTreeToggle<cr>
    let NERDTreeIgnore = ['\.[oa]$']

" Tagbar
    map <F3>  :TagbarToggle<cr>

" vim-linux-coding-style
    let g:linuxsty_patterns = [ "/usr/src/", "/home/mbraslavskyi/repos/linux/", "/home/nikita/kernel/modules/" ]
    map <C-i> :LinuxCodingStyle<cr>
    map <F4>  :LinuxCodingStyle<cr>

" YouCompleteMe
    let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
    highlight YcmErrorSection cterm=none ctermbg=red ctermfg=white
    highlight YcmErrorSign cterm=none ctermbg=red ctermfg=white
    highlight YcmWarningSection cterm=none ctermbg=yellow ctermfg=black
    highlight YcmWarningSign cterm=none ctermbg=yellow ctermfg=black

"    set mouse=a

