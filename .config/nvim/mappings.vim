" ┏┳┓┏━┓┏━┓┏━┓╻┏┓╻┏━╸┏━┓
" ┃┃┃┣━┫┣━┛┣━┛┃┃┗┫┃╺┓┗━┓
" ╹ ╹╹ ╹╹  ╹  ╹╹ ╹┗━┛┗━┛

" Making NVim do what I want
	inoremap jj 
	vnoremap . :norm .<cr>
" Comments
	map <leader>c :norm I#<Tab><cr>
	map <leader>x :norm ^xx<cr>
" File navigation
	map zd :bd<cr>
	map zf :bf<cr>
	map zg gf
	map zl :bl<cr>
	map zl :ls<cr>
	map zn :bn<cr>
	map zN :bp<cr>
	map zp :bp<cr>
	map zu :unh<cr>
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
	map <leader>wq :xa<cr>
	map <leader>qq :qa<cr>
	map <leader>wa :wa<cr>:so %<cr>
" Misc
	map <leader>ne :%norm <Right> 						" norm everything
	map <leader>se :%sort u<cr> 						" sort everything
	map <leader>tws :%s/\s\+$//e<cr>:%s/\n\+\%$//e<cr> 	" rm trailing whitespace
	map <leader>f :filetype detect<cr> 					" filetype detect
	map <leader>hc :ColorToggle<cr> 					" colorizer toggle
	nnoremap <leader>wp :call ToggleWrap()<cr>			" wrap toggle
	nmap dsp <Plug>(ToggleScratchPad)					" scratchpad toggle
