" File: .vimrc
" Author: Karim Gorjux
" Version: 0.5
" Created:  Sat Apr 27 14:25:41 AEST 2019
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                    " this MUST be the first option. Enable all features
let mapleader = ","                 " the new mapleader
filetype plugin indent on           " VIM recognize the fileype
syntax on                           " Syntax highlighting is enabled! 
set number                          " Show the line numbers 
colorscheme marklar                 " the default scheme color
set cursorline                      " show the line where the cursor is


set bs=2                            " make backspace work like most other apps
set incsearch                       " searching starts after you enter the string
set ignorecase                      " ignore the case in patterns (search)
set hlsearch                        " turns on search highlighting
"set ruler                          " Show the line and column number of the cursor position
set modeline                        " !!!! don't know!
set hidden                          " let to move to another buffer without closing, but hiding
set expandtab                       " use the spaces instead of the tab
set shiftwidth=4                    " how many columns text is indented with the reindent operations < >
set softtabstop=4                   " how many columns vim uses when you hit Tab in insert mode

set wrap linebreak nolist           " The above methods will do a "hard" wrap of your text, by inserting newline
                                    " characters. An alternative method is a "soft" wrap which does not change the
                                    " text but simply displays it on multiple lines.

set scrolloff=999                   " Keep the cursor vertically centered when moving
set noswapfile                      " swap file diseabled

" Get the file size to use in the statusline
function! FileSize()
    let bytes = getfsize(expand("%:p"))
    if bytes <= 0
       return ""
    endif
    if bytes < 1024
       return bytes
    else
       return (bytes / 1024) . "K"
     endif
endfunction

set statusline+={%t}\                   " File name
set statusline+=[%{FileSize()}]\        " File Size
set statusline+=(%m\ %r\ %h\ %w)\       " Status of the file modified/read/help/write
set statusline+=[B=%n]\                 " Buffer data
set statusline+=[F=%{&ff}]\             " file format
set statusline+=[T=%Y]\                 " typefile
set statusline+=[ASCII=\%03.3b]\        " ASCII value of the character under the cursor
set statusline+=[HEX=\%02.2B]\          " HEX value of the character under the cursor
set statusline+=[X,Y=%04l,%04v][%p%%]\  " Coordinates in the text file
set statusline+=[LEN=%L]\               " lenght of the file in lines
set statusline+=[ENC=%{strlen(&fenc)?&fenc:'none'}]\    " file encoding
set statusline+=[%{fugitive#statusline()}]              " Git status based on fugitive function
set laststatus=2                        " let show the status line

set list                                " whitespace characters are made visible
set listchars=tab:>.,trail:.,extends:#,nbsp:.

