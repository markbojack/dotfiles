" ==============================================================================
" ▄▄   ▄ ▄▄▄▄▄▄  ▄▄▄▄  ▄    ▄ ▄▄▄▄▄  ▄    ▄
" █▀▄  █ █      ▄▀  ▀▄ ▀▄  ▄▀   █    ██  ██
" █ █▄ █ █▄▄▄▄▄ █    █  █  █    █    █ ██ █
" █  █ █ █      █    █  ▀▄▄▀    █    █ ▀▀ █
" █   ██ █▄▄▄▄▄  █▄▄█    ██   ▄▄█▄▄  █    █
" ==============================================================================
" toilet -f mono9 

" NB
" ,dsp		scratchpad
" gx		follow link under cursor to website
" gf		follow link under cursor to file
" ,g		rip grep
" ,wp		wrap
" ,o 		spellcheck
" <select in visual mode> :sort u   sort
" [[ = gg and ]] = G

" Compulsory
	let mapleader=","
	let g:mapleader=","
	set nocompatible
	set encoding=utf-8
	filetype plugin indent on
	set nowrap

" File management and backup
	set nobackup nowb noswapfile nosol
	set autowriteall startofline ffs=unix,dos,mac

" Functions
	function ZoomWindow()
			let cpos = getpos(".")
			tabnew %
			redraw
			call cursor(cpos[1], cpos[2])
			normal! zz
		endfunction
		nmap gz :call ZoomWindow()<CR>

	let s:wrap=0
	function! ToggleWrap()
		if s:wrap==0
			let s:wrap=1
			set wrap
		else
			let s:wrap=0
			set nowrap
		endif
	endfunction
	nnoremap <leader>wp :call ToggleWrap()<cr>

" Indentation
	set shiftwidth=4 tabstop=4
	set smartindent

" Keyboard and mouse
	set backspace=indent,eol,start
	set mouse=a

" Mappings and aliases

	" Sessions
		map <leader>ss :wa<cr>:SaveSession<cr>
		map <leader>so :wa<cr>:OpenSession<cr>
		map <leader>sc :wa<cr>:CloseSession<cr>:q<cr>

	" Tabs
		map <leader>tn :tabnew<cr>
		map <leader>to :tabonly<cr>
		map <leader>tc :tabclose<cr>
		map <leader>tm :tabmove<cr>
		map <leader>tl :tabn<cr>
		map <leader>th :tabp<cr>

	" Windows
		map <C-h> <C-w>h
		map <C-j> <C-w>j
		map <C-k> <C-w>k
		map <C-l> <C-w>l

		map <C-x> <C-w>x
		map <C-q> <C-w>q

		map <A-[> <C-w>-
		map <A-]> <C-w>+
		map <A-.> :vertical resize +5<cr>
		map <A-,> :vertical resize -5<cr>

	" Misc
		"R STUFF
		"inoremap <C-n> %>%
		inoremap <C-n> c(
		inoremap jj 
		map <leader>wq :wqa!<cr>
		map <leader>qa :qa!<cr>
		map <leader>wr :wa<cr>:so %<cr>
		nnoremap c "_c
		vnoremap . :norm .<cr>

		" ripgrep for searching vimwiki
		map <leader>g :Rg <Right>

		" for R... what about \d???
		vmap <Space> <Plug>RDSendSelection
		nmap <Space> <Plug>RDSendLine
		inoremap <C-x>x <C-x><C-o>

		map <leader>o :setlocal spell! spelllang=en_us<cr>

		map Q gq
		" search and replace
		map <leader>sr :%s//g<Left><Left>
		" norm everything
		"" new way!
		map <leader>ne :%norm <Right>
		" map <leader>ne :g/^/norm<Right> " old way for reference
		" sort everything
		map <leader>se :%sort u<cr>
		" rm trailing whitespace
        map <leader>tws :%s/\s\+$//e<cr>:%s/\n\+\%$//e<cr>
		" email signature
		" map <leader>sft :r !toilet -f future sent with neomutt<cr>
		" auto comment
		vmap <leader>c :norm I#<Tab><cr>
		vmap <leader>x :norm ^xx<cr>
		
	" Macros
		let @h = 'I<a class="bookmarkllcw href="f]cw" target="_blank">A€kb€kb</a'
		let @d = 'bi%"jjea%"jj'
		map <leader>hh @h
		map <leader>dd @d

" Navigation
	set scrolloff=8

" Numbering
	set number relativenumber

" Path
	set path+=**
	set runtimepath^=~/.vim runtimepath+=~/.vim/after
	let &packpath = &runtimepath

" PDF
	" :Rpdf example.pdf
	:command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt -csw78

" Plugins, plugin-specific settings
	call plug#begin('~/.vim/plugged')

	" Markdown-related
	Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
		map <leader>md :MarkdownPreview<cr>

	Plug 'vimwiki/vimwiki'
		" NB custom settings in ~/.vim/plugged/vimwiki/ftplugin/vimwiki.vim
		map <leader>wt :VimwikiTable<cr>
		map <leader>wrf :VimwikiRenameFile<cr>
		let g:vimwiki_table_mappings=0 		"vim-table-mode mapping
		let g:vimwiki_table_auto_fmt=0		"instead of native
		let g:vimwiki_ext2syntax = {
			\ '.Rmd': 'markdown',
			\ '.rmd': 'markdown',
			\ '.md': 'markdown',
			\ '.markdown': 'markdown',
			\ '.mdown': 'markdown'
		\ }
		let g:vimwiki_list = [
			\ {
			\	'path': '~/vimwiki/',
			\	'syntax': 'markdown',
			\	'ext': '.md'},
			\ {
			\	'path': '~/finwiki',
			\	'syntax': 'markdown',
			\	'ext': '.md'}
		\ ]

	Plug 'ferrine/md-img-paste.vim'
		autocmd FileType markdown nmap <buffer><silent> <leader>i :call mdip#MarkdownClipboardImage()<cr>
		let g:mdip_imgdir='.'
		let g:mdip_imgname='img'

	" NERDTree
	Plug 'preservim/nerdtree'
		map <leader>nn :NERDTreeToggle<cr>
		map <leader>mm :NERDTreeFocus<cr>
		map <leader>r :NERDTreeFind<cr>
		let NERDTreeBookmarksFile = stdpath('data') . '/NERDTreeBookmarks'
		let NERDTreeShowHidden=1
		" auto-open NERDTree at start
		"autocmd StdinReadPre * let s:std_in=1
		"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

	" R
	Plug 'ncm2/ncm2-bufword'
	Plug 'jalvesaq/Nvim-R'
	" https://github.com/jalvesaq/Nvim-R/blob/master/doc/Nvim-R.txt
		let R_hl_term=0
		" set vim-r-plugin to
			let r_indent_align_args = 0
		" set vim-r-plugin to mimics ess :
			let r_indent_ess_comments = 0
			let r_indent_ess_compatible = 0
	Plug 'ncm2/ncm2'
		autocmd BufEnter * call ncm2#enable_for_buffer()
		set completeopt=noinsert,menuone,noselect,preview
	Plug 'roxma/nvim-yarp'
	Plug 'gaalcaras/ncm-R'
		let R_assign = 2  " 2) __ for <- 1) _ for <- 0) disabled
	Plug 'ncm2/ncm2-path'
	Plug 'tpope/vim-commentary'

	" Session
	Plug 'xolox/vim-session'
		let g:session_autosave_periodic=1
		let g:session_autosave='yes'
		let g:session_autoload = 'yes'
		let g:session_autosave_to = 'default'
		let g:session_verbose_messages = 0
	Plug 'xolox/vim-misc'

	" Unsorted
	Plug 'dhruvasagar/vim-table-mode'
	Plug 'Raimondi/delimitMate'
	Plug 'tpope/vim-surround'
	Plug 'karoliskoncevicius/vim-sendtowindow'
	Plug 'vim-voom/VOoM'
		let voom_ft_modes = {'rmd': 'pandoc', 'rnoweb': 'latex'}
	Plug 'jremmen/vim-ripgrep'
		let g:rg_command = 'rg --vimgrep -S'
	Plug 'airblade/vim-rooter'
	Plug 'Konfekt/vim-scratchpad'
		let g:scratchpad_ftype = ''
		nmap dsp <Plug>(ToggleScratchPad)
	Plug 'justinmk/vim-sneak'
		let g:sneak#label = 1
	Plug 'tpope/vim-repeat'
	Plug 'psliwka/vim-smoothie'

	" Visuals
	Plug 'bling/vim-airline'
	Plug 'itchyny/lightline.vim'

	call plug#end()

" Search
	set ignorecase smartcase nohlsearch incsearch magic

" Sound
	set noerrorbells

" Splitting
	set splitright splitbelow

" Tweaks
	" Disable next-line auto commenting
		autocmd FileType *
			\ setlocal formatoptions-=c formatoptions-=r formatoptions-=o
	" Move to last edit position on reopen
		au BufReadPost *
			\ if line("'\"") > 1 && line("'\"") <= line("$") |
				\ exe "normal! g'\"" | endif
" Unsorted
	set ma
	set go=a
    set clipboard+=unnamedplus
	let g:session_autoload='no'
	let g:python3_host_prog = '/usr/bin/python3'
	let g:python_host_prog  = '/usr/bin/python'

" Visuals
	" Color
		colorscheme delek
	" Status bar
		set title
    	set showmode
   		set ruler
   		set laststatus=1
   		set showcmd
