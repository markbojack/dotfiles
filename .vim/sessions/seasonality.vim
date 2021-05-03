" ~/.vim/sessions/seasonality.vim:
" Vim session script.
" Created by session.vim 2.13.1 on 03 Tháng 5 2021 at 21:56:57.
" Open this file in Vim and run :source % to restore your session.

if exists('g:syntax_on') != 1 | syntax on | endif
if exists('g:did_load_filetypes') != 1 | filetype on | endif
if exists('g:did_load_ftplugin') != 1 | filetype plugin on | endif
if exists('g:did_indent_on') != 1 | filetype indent on | endif
if &background != 'dark'
	set background=dark
endif
if !exists('g:colors_name') || g:colors_name != 'delek' | colorscheme delek | endif
call setqflist([])
let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/seasonality
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +145 ~/.config/nvim/init.vim
badd +13 ~/copper-ingot/portfolio13F.R
badd +24 data/NOTES.md
badd +130 data/high-sharpe075/null.md
badd +21 data/high-prev/apr-long.md
badd +1 data/high-prev/apr-short.md
badd +56 R/h-report.R
badd +6 prev-performance.R
badd +22 data/high-prev/may-long.md
badd +1 data/high-prev/may-short.md
badd +54 R/getHighPrev.R
badd +12 model-gen.R
badd +10 sharpe-performance/sharpe1.0-performance.R
badd +2 data/high-sharpe075/may.md
badd +1 sharpe-performance/sharpe0.75-performance.R
badd +5 sharpe-performance/NULL/dowom.R
badd +7 sharpe-performance/NULL/wom.R
badd +1 sharpe-performance/NULL/dow.R
badd +1 R/h-dec-preholiday.R
badd +1 R/h-holiday.R
badd +38 sharpe0.75-performance.R
badd +1 R/h-dec-xmasnyd.R
badd +1 R/h-WoM.R
badd +1 sharpe1.0-performance.R
badd +1 R/getAndProcessSymbols.R
badd +12 R/packagesAndOptions.R
badd +27 ~/copper-ingot/docs/fees.md
badd +3 data/high-prev/jun-long.md
badd +1 data/high-prev/jun-short.md
badd +1 README.md
argglobal
%argdel
$argadd ~/.config/nvim/init.vim
edit data/high-prev/jun-long.md
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
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
exe 'vert 1resize ' . ((&columns * 31 + 110) / 221)
exe '2resize ' . ((&lines * 38 + 27) / 55)
exe 'vert 2resize ' . ((&columns * 74 + 110) / 221)
exe '3resize ' . ((&lines * 14 + 27) / 55)
exe 'vert 3resize ' . ((&columns * 39 + 110) / 221)
exe '4resize ' . ((&lines * 14 + 27) / 55)
exe 'vert 4resize ' . ((&columns * 34 + 110) / 221)
exe '5resize ' . ((&lines * 26 + 27) / 55)
exe 'vert 5resize ' . ((&columns * 114 + 110) / 221)
exe '6resize ' . ((&lines * 26 + 27) / 55)
exe 'vert 6resize ' . ((&columns * 114 + 110) / 221)
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
if bufexists("term://.//479179:R\ ") | buffer term://.//479179:R\  | else | edit term://.//479179:R\  | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 150 - ((37 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
150
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
let s:l = 3 - ((2 * winheight(0) + 7) / 14)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
3
normal! 0
wincmd w
argglobal
if bufexists("data/high-prev/jun-short.md") | buffer data/high-prev/jun-short.md | else | edit data/high-prev/jun-short.md | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 7) / 14)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
wincmd w
argglobal
if bufexists("prev-performance.R") | buffer prev-performance.R | else | edit prev-performance.R | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 6 - ((5 * winheight(0) + 13) / 26)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
6
normal! 0
wincmd w
argglobal
if bufexists("R/packagesAndOptions.R") | buffer R/packagesAndOptions.R | else | edit R/packagesAndOptions.R | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 13) / 26)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 31 + 110) / 221)
exe '2resize ' . ((&lines * 38 + 27) / 55)
exe 'vert 2resize ' . ((&columns * 74 + 110) / 221)
exe '3resize ' . ((&lines * 14 + 27) / 55)
exe 'vert 3resize ' . ((&columns * 39 + 110) / 221)
exe '4resize ' . ((&lines * 14 + 27) / 55)
exe 'vert 4resize ' . ((&columns * 34 + 110) / 221)
exe '5resize ' . ((&lines * 26 + 27) / 55)
exe 'vert 5resize ' . ((&columns * 114 + 110) / 221)
exe '6resize ' . ((&lines * 26 + 27) / 55)
exe 'vert 6resize ' . ((&columns * 114 + 110) / 221)
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
1resize 53|vert 1resize 31|2resize 38|vert 2resize 74|3resize 14|vert 3resize 39|4resize 14|vert 4resize 34|5resize 26|vert 5resize 114|6resize 26|vert 6resize 114|
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
