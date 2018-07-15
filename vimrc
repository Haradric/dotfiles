" Configure Vundle, plugin manager
    " required
        set nocompatible
        filetype off

    " set the runtime path to include Vundle and initialize
        set rtp+=~/.vim/bundle/Vundle.vim
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
            " Autocompletion
                Plugin 'Valloric/YouCompleteMe'
        call vundle#end()

    " required
        filetype plugin indent on

    set viminfo+=n~/.vim/.viminfo

"Spaces & Tabs
	syntax enable		" enable syntax processing
	set tabstop=4		" number of visual spaces per TAB
	set softtabstop=4	" number of spaces in tab when editing
	set expandtab		" tabs are spaces

"UI Config
	set number			" show line numbers
	set showcmd			" show command in bottom bar
	"set cursorline		" highlight current line
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

" 80 characters line
    set colorcolumn=81

" "execute "set colorcolumn=" . join(range(81,335), ',')
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
    map  <C-n> :NERDTreeToggle<cr>
    map <F2>  :NERDTreeToggle<cr>
    let NERDTreeIgnore = ['\.[oa]$']

" vim-linux-coding-style
    let g:linuxsty_patterns = [ "/usr/src/", "/home/mbraslavskyi/repos/linux/", "/home/nikita/kernel/modules/" ]
"   map  <C-i> :LinuxCodingStyle<cr>

    map <F3>  :TagbarToggle<cr>

"   set t_Co=256

"    set mouse=a

