" ~/.vim/sessions/default.vim:
" Vim session script.
" Created by session.vim 2.13.1 on 26 Tháng 5 2021 at 01:32:23.
" Open this file in Vim and run :source % to restore your session.

if exists('g:syntax_on') != 1 | syntax on | endif
if exists('g:did_load_filetypes') != 1 | filetype on | endif
if exists('g:did_load_ftplugin') != 1 | filetype plugin on | endif
if exists('g:did_indent_on') != 1 | filetype indent on | endif
if &background != 'dark'
	set background=dark
endif
if !exists('g:colors_name') || g:colors_name != 'delek' | colorscheme delek | endif
call setqflist([{'lnum': 12, 'col': 28, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/getHighPrev.R', 'text': '	get_tradeSign <- function(get_tradeRet_out, long_or_short) {'}, {'lnum': 13, 'col': 22, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/getHighPrev.R', 'text': '		out_long <- ( sign(get_tradeRet_out) + 1 ) / 2'}, {'lnum': 13, 'col': 24, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/getHighPrev.R', 'text': '		out_short <- -( sign(get_tradeRet_out) - 1 ) / 2 '}, {'lnum': 20, 'col': 4, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/getHighPrev.R', 'text': '			get_tradeRet %>%'}, {'lnum': 30, 'col': 4, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/getHighPrev.R', 'text': '			get_tradeRet %>%'}, {'lnum': 47, 'col': 7, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/getHighPrev.R', 'text': '					#get_tradeRet %>%'}, {'lnum': 52, 'col': 3, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/getHighPrev.R', 'text': '		get_tradeRet %>%'}, {'lnum': 59, 'col': 3, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/getHighPrev.R', 'text': '		get_tradeRet %>%'}, {'lnum': 66, 'col': 3, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/getHighPrev.R', 'text': '		get_tradeRet %>%'}, {'lnum': 81, 'col': 10, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/getHighPrev.R', 'text': '		lapply(get_tradeRet) %>%'}, {'lnum': 90, 'col': 4, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/getHighPrev.R', 'text': '			get_tradeRet %>%'}, {'lnum': 100, 'col': 4, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/getHighPrev.R', 'text': '			get_tradeRet %>%'}, {'lnum': 116, 'col': 10, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/getHighPrev.R', 'text': '		lapply(get_tradeRet) %>%'}, {'lnum': 125, 'col': 4, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/getHighPrev.R', 'text': '			get_tradeRet %>%'}, {'lnum': 141, 'col': 10, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/getHighPrev.R', 'text': '		lapply(get_tradeRet) %>%'}, {'lnum': 155, 'col': 10, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/getHighPrev.R', 'text': '		lapply(get_tradeRet) %>%'}, {'lnum': 12, 'col': 2, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/getHighSharpe.R', 'text': '	get_tradeRet <- function(cal_fn_out) {'}, {'lnum': 22, 'col': 5, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/getHighSharpe.R', 'text': '	 		get_tradeRet %>%'}, {'lnum': 31, 'col': 4, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/getHighSharpe.R', 'text': '			get_tradeRet %>%'}, {'lnum': 39, 'col': 3, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/getHighSharpe.R', 'text': '		get_tradeRet %>%'}, {'lnum': 44, 'col': 3, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/getHighSharpe.R', 'text': '		get_tradeRet %>%'}, {'lnum': 49, 'col': 3, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/getHighSharpe.R', 'text': '		get_tradeRet %>%'}, {'lnum': 62, 'col': 10, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/getHighSharpe.R', 'text': '		lapply(get_tradeRet) %>%'}, {'lnum': 70, 'col': 4, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/getHighSharpe.R', 'text': '			get_tradeRet %>%'}, {'lnum': 79, 'col': 4, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/getHighSharpe.R', 'text': '			get_tradeRet %>%'}, {'lnum': 94, 'col': 10, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/getHighSharpe.R', 'text': '		lapply(get_tradeRet) %>%'}, {'lnum': 102, 'col': 4, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/getHighSharpe.R', 'text': '			get_tradeRet %>%'}, {'lnum': 117, 'col': 10, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/getHighSharpe.R', 'text': '		lapply(get_tradeRet) %>%'}, {'lnum': 130, 'col': 10, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/getHighSharpe.R', 'text': '		lapply(get_tradeRet) %>%'}, {'lnum': 4, 'col': 4, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'model-gen.R', 'text': '		#get_tradeRet'}])
let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/seasonality
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
argglobal
%argdel
$argadd ~/.config/nvim/init.vim
set splitbelow splitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
enew
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
tabnext 1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
"   silent exe 'bwipe ' . s:wipebuf
endif
" unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=filnxtToOF
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save

" Support for special windows like quick-fix and plug-in windows.
" Everything down here is generated by vim-session (not supported
" by :mksession out of the box).

1wincmd w
tabnext 1
if exists('s:wipebuf')
  if empty(bufname(s:wipebuf))
if !getbufvar(s:wipebuf, '&modified')
  let s:wipebuflines = getbufline(s:wipebuf, 1, '$')
  if len(s:wipebuflines) <= 1 && empty(get(s:wipebuflines, 0, ''))
    silent execute 'bwipeout' s:wipebuf
  endif
endif
  endif
endif
doautoall SessionLoadPost
unlet SessionLoad
" vim: ft=vim ro nowrap smc=128
