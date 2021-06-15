" ▄▄   ▄ ▄▄▄▄▄▄  ▄▄▄▄  ▄    ▄ ▄▄▄▄▄  ▄    ▄
" █▀▄  █ █      ▄▀  ▀▄ ▀▄  ▄▀   █    ██  ██
" █ █▄ █ █▄▄▄▄▄ █    █  █  █    █    █ ██ █
" █  █ █ █      █    █  ▀▄▄▀    █    █ ▀▀ █
" █   ██ █▄▄▄▄▄  █▄▄█    ██   ▄▄█▄▄  █    █

" ORDINARY
	" Leader
		let mapleader=","
		let g:mapleader=","
	" Audio / Visuals
		" Comment / Colorizer / Number coloring
			autocmd VimEnter * hi Comment ctermfg=gray
			autocmd VimEnter * ColorHighlight			" colorizer plugin autostart
			autocmd VimEnter * hi LineNr ctermfg=darkgray
			autocmd VimEnter * hi CursorLineNr ctermfg=lightgray
		" Folding
			" makes the fold names readable
			autocmd VimEnter * hi Folded ctermbg=black
			autocmd BufWinLeave *.* mkview
			autocmd BufWinEnter *.* silent loadview
			set smartindent
		" Indentation
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



" HACKS
	" Disable next-line auto commenting
		autocmd FileType *
			\ setlocal formatoptions-=c formatoptions-=r formatoptions-=o
	" Move to last edit position on reopen
		au BufReadPost *
			\ if line("'\"") > 1 && line("'\"") <= line("$") |
				\ exe "normal! g'\"" | endif

" CUSTOM FUNS
	" ToggleWrap
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

	" ZoomWindow
	function ZoomWindow()
			let cpos = getpos(".")
			tabnew %
			redraw
			call cursor(cpos[1], cpos[2])
			normal! zz
		endfunction

" PLUGINS
	call plug#begin('~/.vim/plugged')
		Plug 'chrisbra/Colorizer'
		Plug 'Raimondi/delimitMate'
		Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
		Plug 'ferrine/md-img-paste.vim'
			autocmd FileType markdown nmap <buffer><silent> <leader>i :call mdip#MarkdownClipboardImage()<cr>
			let g:mdip_imgdir='.'
			let g:mdip_imgname='img'
		Plug 'ncm2/ncm2'
			autocmd BufEnter * call ncm2#enable_for_buffer()
		Plug 'ncm2/ncm2-bufword'
		Plug 'ncm2/ncm2-path'
		Plug 'gaalcaras/ncm-R'
			let R_assign = 2  " 2) __ for <- 1) _ for <- 0) disabled
		Plug 'preservim/nerdtree'
			let NERDTreeBookmarksFile = stdpath('data') . '/NERDTreeBookmarks'
			let NERDTreeShowHidden=1
			" auto-open NERDTree at start
				" autocmd StdinReadPre * let s:std_in=1
				" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
		Plug 'jalvesaq/Nvim-R'
			let R_hl_term=0
			let r_indent_align_args = 0 
			let r_indent_ess_comments = 0
			let r_indent_ess_compatible = 0
		Plug 'roxma/nvim-yarp'
		Plug 'tpope/vim-commentary'
		Plug 'bling/vim-airline'
		Plug 'vim-airline/vim-airline-themes'
			let g:airline_powerline_fonts = 1
			let g:airline_theme = 'minimalist'
		Plug 'xolox/vim-misc'
		Plug 'tpope/vim-repeat'
		Plug 'jremmen/vim-ripgrep'
			let g:rg_command = 'rg --vimgrep -S'
		Plug 'airblade/vim-rooter'
		Plug 'Konfekt/vim-scratchpad'
			let g:scratchpad_ftype = ''
		Plug 'karoliskoncevicius/vim-sendtowindow'
		Plug 'xolox/vim-session'
			let g:session_autoload='no'
			let g:session_autosave_periodic=1
			let g:session_autosave='yes'
			let g:session_autoload = 'yes'
			let g:session_autosave_to = 'default'
			let g:session_verbose_messages = 0
		Plug 'psliwka/vim-smoothie'
		Plug 'justinmk/vim-sneak'
			let g:sneak#label = 1
		Plug 'tpope/vim-surround'
		Plug 'dhruvasagar/vim-table-mode'
		Plug 'vimwiki/vimwiki'
			let g:vimwiki_table_mappings=0
			let g:vimwiki_table_auto_fmt=0
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
		Plug 'vim-voom/VOoM'
			let voom_ft_modes = {'rmd': 'pandoc', 'rnoweb': 'latex'}
	call plug#end()





" MAPPINGS
	" Making NVim do what I want
		inoremap jj 
		vnoremap . :norm .<cr>
	" Comments
		map <leader>c :norm I#<Tab><cr>
		map <leader>x :norm ^xx<cr>
	" Macros
		let @h = 'I<a class="bookmarkllcw href="f]cw" target="_blank">A€kb€kb</a'
		let @d = 'bi%"jjea%"jj'
		map <leader>hh @h
		map <leader>dd @d
	" NERDTree
		map <leader>nn :NERDTreeToggle<cr>
		map <leader>mm :NERDTreeFocus<cr>
		map <leader>r :NERDTreeFind<cr>
	" Non-R document processing
		map <leader>wt :VimwikiTable<cr>
		map <leader>wrf :VimwikiRenameFile<cr>
		map <leader>md :MarkdownPreview<cr>
		:command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt -csw78
		map <leader>o :setlocal spell! spelllang=en_us<cr>
		map <leader>sft :r !toilet -f future sent with neomutt<cr>
	" R
		inoremap <C-n> c(
		vmap <Space> <Plug>RDSendSelection
		nmap <Space> <Plug>RDSendLine
		inoremap <C-x>x <C-x><C-o>
	" Searching / Ripgrep
		map <leader>sr :%s//g<Left><Left>
		map <leader>g :Rg <Right>
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
		" Moving bt windows
			map <C-h> <C-w>h
			map <C-j> <C-w>j
			map <C-k> <C-w>k
			map <C-l> <C-w>l
		" Resizing
			map <A-[> <C-w>-
			map <A-]> <C-w>+
			map <A-.> :vertical resize +5<cr>
			map <A-,> :vertical resize -5<cr>
		" Misc
			nmap gz :call ZoomWindow()<cr>
			map <C-x> <C-w>x
			map <C-q> <C-w>q
	" Writing / Quitting
		map <leader>wq :wqa!<cr>
		map <leader>qa :qa!<cr>
		map <leader>wr :wa<cr>:so %<cr>
	" Misc
		map <leader>ne :%norm <Right> 						" norm everything
		map <leader>se :%sort u<cr> 						" sort everything
        map <leader>tws :%s/\s\+$//e<cr>:%s/\n\+\%$//e<cr> 	" rm trailing whitespace
		map <leader>f :filetype detect<cr> 					" filetype detect
		map <leader>hc :ColorToggle<cr> 					" colorizer toggle
		nnoremap <leader>wp :call ToggleWrap()<cr>			" wrap toggle
		nmap dsp <Plug>(ToggleScratchPad)					" scratchpad toggle
