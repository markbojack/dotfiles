" ┏━┓┏━┓╺┳┓╻┏┓╻┏━┓┏━┓╻ ╻
" ┃ ┃┣┳┛ ┃┃┃┃┗┫┣━┫┣┳┛┗┳┛
" ┗━┛╹┗╸╺┻┛╹╹ ╹╹ ╹╹┗╸ ╹

" Leader
	let mapleader=","
	let g:mapleader=","
" Audio / Visuals
	" Comment / Colorizer / Number coloring
		autocmd VimEnter * hi Comment ctermfg=gray
		autocmd VimEnter * ColorHighlight			" colorizer plugin autostart
		autocmd VimEnter * hi LineNr ctermfg=darkgray
		autocmd VimEnter * hi CursorLineNr ctermfg=lightgray
	" Indentation
		set smartindent
		set shiftwidth=4 tabstop=4
	" Status bar
		set noshowmode
	" Unsorted		
		set noerrorbells
		colorscheme delek
		set nowrap
		set relativenumber
		augroup every
		  autocmd!
		  au InsertEnter * set norelativenumber
		  au InsertEnter * set number
		  au InsertLeave * set relativenumber
		augroup END
" Compulsory
	filetype plugin indent on						" filetype detection
	set clipboard+=unnamedplus						" copy from clipboard
	let g:python3_host_prog = '/usr/bin/python3'	" needed for nvim to work
	let g:python_host_prog  = '/usr/bin/python'		" needed for nvim to work
" File management and backup
	set nobackup nowb noswapfile nosol
	set autowriteall startofline ffs=unix,dos,mac
" Navigation
	set ma											" set marks with `m<letter>`
	set scrolloff=8
	set splitright splitbelow
	set backspace=indent,eol,start
	set mouse=a
	set completeopt=noinsert,menuone,noselect,preview	" for ncm2
	set ignorecase smartcase nohlsearch incsearch magic	" for searching
" Path
	set path+=**
	set runtimepath^=~/.vim runtimepath+=~/.vim/after
	let &packpath = &runtimepath
