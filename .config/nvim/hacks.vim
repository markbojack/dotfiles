" Disable next-line auto commenting
	autocmd FileType *
		\ setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Move to last edit position on reopen
	au BufReadPost *
		\ if line("'\"") > 1 && line("'\"") <= line("$") |
			\ exe "normal! g'\"" | endif
