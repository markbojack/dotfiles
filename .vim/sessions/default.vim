" ~/.vim/sessions/default.vim:
" Vim session script.
" Created by session.vim 2.13.1 on 09 Tháng 6 2021 at 17:37:09.
" Open this file in Vim and run :source % to restore your session.

if exists('g:syntax_on') != 1 | syntax on | endif
if exists('g:did_load_filetypes') != 1 | filetype on | endif
if exists('g:did_load_ftplugin') != 1 | filetype plugin on | endif
if exists('g:did_indent_on') != 1 | filetype indent on | endif
if &background != 'dark'
	set background=dark
endif
if !exists('g:colors_name') || g:colors_name != 'delek' | colorscheme delek | endif
call setqflist([{'lnum': 8, 'col': 10, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/h-DoW.R', 'text': '			sig = na_if(DoW == day_of_week, F),'}, {'lnum': 8, 'col': 10, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/h-WoMoY.R', 'text': '			Ret = na_if(WoM == week_num & month(Date) == month_num, F) * Ret'}, {'lnum': 15, 'col': 39, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/h-dec-xmasnyd.R', 'text': '			isXmas = (Month==12 & Day==25) %>% na_if(F),'}, {'lnum': 16, 'col': 39, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/h-dec-xmasnyd.R', 'text': '			isNYD = (!(Month==1 & Day==1)) %>% na_if(T),'}, {'lnum': 25, 'col': 39, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/h-dec-xmasnyd.R', 'text': '			isPreXmas = (!sig & lead(sig)) %>% na_if(F),'}, {'lnum': 26, 'col': 38, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/h-dec-xmasnyd.R', 'text': '			isPreNYD = (sig & !lead(sig)) %>% na_if(F),'}, {'lnum': 12, 'col': 10, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/h-semimonth.R', 'text': '			Ret = na_if(Day %in% day_range, F) * Ret'}, {'lnum': 11, 'col': 16, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/multimonthDoM.R', 'text': '			startDate = na_if(startDate, F),'}, {'lnum': 13, 'col': 14, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/multimonthDoM.R', 'text': '			endDate = na_if(!endDate, T) %>% lag,'}, {'lnum': 17, 'col': 5, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/multimonthDoM.R', 'text': '				na_if(F),'}, {'lnum': 24, 'col': 16, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/multimonthTDM.R', 'text': '			startDate = na_if(startDate, F),'}, {'lnum': 26, 'col': 14, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/multimonthTDM.R', 'text': '			endDate = na_if(!endDate, T) %>% lag,'}, {'lnum': 30, 'col': 5, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/multimonthTDM.R', 'text': '				na_if(F),'}, {'lnum': 15, 'col': 39, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/h-dec-betweenholiday.R', 'text': '			isXmas = (Month==12 & Day==25) %>% na_if(F),'}, {'lnum': 16, 'col': 39, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/h-dec-betweenholiday.R', 'text': '			isNYD = (!(Month==1 & Day==1)) %>% na_if(T),'}, {'lnum': 26, 'col': 10, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/h-dec-betweenholiday.R', 'text': '			Ret = na_if(sig, sig & !lead(sig)) * Ret'}, {'lnum': 15, 'col': 41, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/h-dec-preholiday.R', 'text': '			isMidDec = (Month==12 & Day==15) %>% na_if(F),'}, {'lnum': 16, 'col': 42, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/h-dec-preholiday.R', 'text': '			isXmas = (!(Month==12 & Day==25)) %>% na_if(T),'}, {'lnum': 25, 'col': 19, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/h-dec-preholiday.R', 'text': '			isPreHoliday = na_if(isPreHoliday, isPreHoliday & !lead(isPreHoliday))'}, {'lnum': 14, 'col': 16, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/h-turnofmonth.R', 'text': '			ret_start = na_if(TDM == day_num, F) * Ret,'}, {'lnum': 15, 'col': 14, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/h-turnofmonth.R', 'text': '			ret_end = na_if(TDM == maxTDM - day_num + 1, F) * Ret,'}, {'lnum': 8, 'col': 10, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/h-WoM.R', 'text': '			Ret = na_if(WoM == week_num, F) * Ret'}, {'lnum': 12, 'col': 16, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/h-DoWoM.R', 'text': '			Ret = Ret * na_if(sig, F)'}, {'lnum': 21, 'col': 47, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/h-holiday.R', 'text': '			pre = (is.na(lead(Ret)) & !is.na(Ret)) %>% na_if(F),'}, {'lnum': 22, 'col': 47, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/h-holiday.R', 'text': '			post = (is.na(lag(Ret)) & !is.na(Ret)) %>% na_if(F),'}, {'lnum': 5, 'col': 16, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/h-MoY.R', 'text': '			Ret = Ret * na_if(month(Date) == month_num, F)'}, {'lnum': 208, 'col': 16, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/h-report.R', 'text': '				newTrade = na.if(newTrade * Date,'}, {'lnum': 15, 'col': 10, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'R/h-semimonthOfYear.R', 'text': '			Ret = na_if(Day %in% day_range & Month == month_num, F) * Ret'}, {'lnum': 40, 'col': 19, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'old/monthly.R', 'text': '    mutate(prev = na_if(prev > 0.9, F)) %>%'}, {'lnum': 134, 'col': 15, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'old/chan.R', 'text': '		startDate = na_if(startDate, F),'}, {'lnum': 136, 'col': 13, 'pattern': '', 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'module': '', 'filename': 'old/chan.R', 'text': '		endDate = na_if(!endDate, T),'}])
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
