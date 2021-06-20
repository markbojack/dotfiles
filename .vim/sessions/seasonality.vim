" ~/.vim/sessions/seasonality.vim:
" Vim session script.
" Created by session.vim 2.13.1 on 20 Tháng 6 2021 at 18:58:08.
" Open this file in Vim and run :source % to restore your session.

if exists('g:syntax_on') != 1 | syntax on | endif
if exists('g:did_load_filetypes') != 1 | filetype on | endif
if exists('g:did_load_ftplugin') != 1 | filetype plugin on | endif
if exists('g:did_indent_on') != 1 | filetype indent on | endif
if &background != 'dark'
	set background=dark
endif
if !exists('g:colors_name') || g:colors_name != 'delek' | colorscheme delek | endif
call setqflist([{'lnum': 12, 'col': 1, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/getAndProcessSymbols.R', 'text': 'getAndProcessSymbolsBulk <- function(symbols) {'}, {'lnum': 34, 'col': 22, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'data/model-gen.R', 'text': 'gaps_out_list_etf <- getAndProcessSymbolsBulk(all_symbols_etf)'}, {'lnum': 35, 'col': 24, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'data/model-gen.R', 'text': 'gaps_out_list_stock <- getAndProcessSymbolsBulk(all_symbols_stock)'}])
let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/seasonality
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 R/getAndProcessSymbols.R
badd +87 data/model-gen.R
badd +1 R/h-DoW.R
badd +1 R/h-WoMoY.R
badd +1 R/h-dec-xmasnyd.R
badd +1 R/h-dec-betweenholiday.R
badd +1 R/h-dec-preholiday.R
badd +1 R/h-WoM.R
badd +1 R/h-DoWoM.R
badd +1 R/h-holiday.R
badd +5 R/h-MoY.R
badd +285 R/h-report.R
badd +1 R/h-semimonthOfYear.R
badd +147 R/getHighPrev.R
badd +134 R/getHighSharpe.R
badd +26 model-gen.R
badd +11 NERD_tree_1
badd +87 ~/.config/nvim/init.vim
badd +13 ~/copper-ingot/portfolio13F.R
badd +104 data/NOTES.md
badd +130 data/high-sharpe075/null.md
badd +21 data/high-prev/apr-long.md
badd +1 data/high-prev/apr-short.md
badd +1 prev-performance.R
badd +22 data/high-prev/may-long.md
badd +1 data/high-prev/may-short.md
badd +10 sharpe-performance/sharpe1.0-performance.R
badd +2 data/high-sharpe075/may.md
badd +1 sharpe-performance/sharpe0.75-performance.R
badd +5 sharpe-performance/NULL/dowom.R
badd +7 sharpe-performance/NULL/wom.R
badd +1 sharpe-performance/NULL/dow.R
badd +1 sharpe0.75-performance.R
badd +1 sharpe1.0-performance.R
badd +22 R/packagesAndOptions.R
badd +27 ~/copper-ingot/docs/fees.md
badd +2 data/high-prev/jun-long.md
badd +2 data/high-prev/jun-short.md
badd +17 README.md
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
badd +1 sharpe-perforance.R
badd +146 analysis.R
badd +260 ~/.config/picom/picom.conf
badd +1706 data/prev-etf-long
badd +1 data/prev-etf-short
badd +2646 data/prev-stock-long
badd +589 data/prev-stock-short
badd +1269 data/sharpe-etf-long
badd +1 data/sharpe-etf-short
badd +1697 data/sharpe-stock-long
badd +802 data/sharpe-stock-short
badd +1 R/h-semimonth.R
argglobal
%argdel
$argadd ~/.config/nvim/init.vim
edit analysis.R
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
wincmd w
wincmd w
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 31 + 110) / 220)
exe 'vert 2resize ' . ((&columns * 74 + 110) / 220)
exe 'vert 3resize ' . ((&columns * 113 + 110) / 220)
argglobal
enew
" file NERD_tree_3
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
wincmd w
argglobal
if bufexists("term://.//1285647:R\ ") | buffer term://.//1285647:R\  | else | edit term://.//1285647:R\  | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 1335 - ((52 * winheight(0) + 26) / 53)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1335
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
let s:l = 148 - ((29 * winheight(0) + 26) / 53)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
148
normal! 013|
wincmd w
3wincmd w
exe 'vert 1resize ' . ((&columns * 31 + 110) / 220)
exe 'vert 2resize ' . ((&columns * 74 + 110) / 220)
exe 'vert 3resize ' . ((&columns * 113 + 110) / 220)
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
let s:bufnr_save = bufnr("%")
let s:cwd_save = getcwd()
NERDTree ~/seasonality
if !getbufvar(s:bufnr_save, '&modified')
  let s:wipebuflines = getbufline(s:bufnr_save, 1, '$')
  if len(s:wipebuflines) <= 1 && empty(get(s:wipebuflines, 0, ''))
    silent execute 'bwipeout' s:bufnr_save
  endif
endif
execute "cd" fnameescape(s:cwd_save)
1resize 53|vert 1resize 31|2resize 53|vert 2resize 74|3resize 53|vert 3resize 113|
3wincmd w
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
