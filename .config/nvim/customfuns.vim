" ┏━╸╻ ╻┏━┓╺┳╸┏━┓┏┳┓   ┏━╸╻ ╻┏┓╻┏━┓
" ┃  ┃ ┃┗━┓ ┃ ┃ ┃┃┃┃   ┣╸ ┃ ┃┃┗┫┗━┓
" ┗━╸┗━┛┗━┛ ╹ ┗━┛╹ ╹   ╹  ┗━┛╹ ╹┗━┛

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
