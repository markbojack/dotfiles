" ~/.vim/sessions/seasonality.vim:
" Vim session script.
" Created by session.vim 2.13.1 on 25 Tháng 5 2021 at 14:46:08.
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
badd +11 NERD_tree_1
badd +166 R/getHighPrev.R
badd +138 R/getHighSharpe.R
badd +26 model-gen.R
badd +145 ~/.config/nvim/init.vim
badd +13 ~/copper-ingot/portfolio13F.R
badd +53 data/NOTES.md
badd +130 data/high-sharpe075/null.md
badd +21 data/high-prev/apr-long.md
badd +1 data/high-prev/apr-short.md
badd +39 R/h-report.R
badd +1 prev-performance.R
badd +22 data/high-prev/may-long.md
badd +1 data/high-prev/may-short.md
badd +10 sharpe-performance/sharpe1.0-performance.R
badd +2 data/high-sharpe075/may.md
badd +1 sharpe-performance/sharpe0.75-performance.R
badd +5 sharpe-performance/NULL/dowom.R
badd +7 sharpe-performance/NULL/wom.R
badd +1 sharpe-performance/NULL/dow.R
badd +1 R/h-dec-preholiday.R
badd +1 R/h-holiday.R
badd +1 sharpe0.75-performance.R
badd +1 R/h-dec-xmasnyd.R
badd +1 R/h-WoM.R
badd +1 sharpe1.0-performance.R
badd +1 R/getAndProcessSymbols.R
badd +1 R/packagesAndOptions.R
badd +27 ~/copper-ingot/docs/fees.md
badd +2 data/high-prev/jun-long.md
badd +2 data/high-prev/jun-short.md
badd +1 README.md
badd +1 data/high-prev/calendar.md
badd +7 data/high-prev/long-cal.md
badd +1 data/high-prev/jan-long.md
badd +1 data/high-prev/feb-long.md
badd +2 data/high-prev/short-cal.md
badd +2 data/high-prev/jul-long.md
badd +1 /data/longs
badd +111 data/high-prev/shorts
badd +1084 data/high-prev/longs
badd +2655 longs
badd +1 shorts
badd +849 data/high-sharpe/longs
badd +176 data/high-sharpe/shorts
badd +1 R/h-WoMoY.R
badd +1 R/h-dec-betweenholiday.R
badd +1 R/h-DoW.R
badd +1 R/h-DoWoM.R
badd +1 R/h-MoY.R
badd +1 sharpe-perforance.R
badd +1 analysis.R
badd +497 data/model-gen.R
badd +1110 term://.//2282139:R\ 
badd +260 ~/.config/picom/picom.conf
badd +1 .scratchpads/scratchpad.R
argglobal
%argdel
$argadd ~/.config/nvim/init.vim
edit data/model-gen.R
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 106 + 110) / 221)
exe '2resize ' . ((&lines * 26 + 27) / 55)
exe 'vert 2resize ' . ((&columns * 114 + 110) / 221)
exe '3resize ' . ((&lines * 26 + 27) / 55)
exe 'vert 3resize ' . ((&columns * 114 + 110) / 221)
argglobal
if bufexists("term://.//2282139:R\ ") | buffer term://.//2282139:R\  | else | edit term://.//2282139:R\  | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 10053 - ((52 * winheight(0) + 26) / 53)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
10053
normal! 0
wincmd w
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 495 - ((8 * winheight(0) + 13) / 26)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
495
normal! 08|
wincmd w
argglobal
if bufexists("R/getAndProcessSymbols.R") | buffer R/getAndProcessSymbols.R | else | edit R/getAndProcessSymbols.R | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 10 - ((9 * winheight(0) + 13) / 26)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
10
normal! 017|
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 106 + 110) / 221)
exe '2resize ' . ((&lines * 26 + 27) / 55)
exe 'vert 2resize ' . ((&columns * 114 + 110) / 221)
exe '3resize ' . ((&lines * 26 + 27) / 55)
exe 'vert 3resize ' . ((&columns * 114 + 110) / 221)
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

2wincmd w
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
