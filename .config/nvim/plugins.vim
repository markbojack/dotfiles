" ┏━┓╻  ╻ ╻┏━╸╻┏┓╻┏━┓
" ┣━┛┃  ┃ ┃┃╺┓┃┃┗┫┗━┓
" ╹  ┗━╸┗━┛┗━┛╹╹ ╹┗━┛

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
