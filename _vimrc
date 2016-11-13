"模仿Windows快捷键
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

"界面配置
syntax on
colorscheme desert
" colorscheme solarized
set laststatus=2
set t_Co=256
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h11 
" set guifont=MONACO:h11
set number
set nowrap
set shortmess=atI
set cursorcolumn
set cursorline
set go=

"缩进配置
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set cindent
filetype on
filetype indent on

"编码配置
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1
set langmenu=zh_CN.utf-8
set helplang=CN
language messages zh_CN.utf-8
source$VIMRUNTIME/delmenu.vim
source$VIMRUNTIME/menu.vim
let &termencoding=&encoding

"取消备份及交换文件
set nobackup
set noswapfile
set noundofile

"废弃<F1>
noremap <F1> <Esc>

"切换全屏<F11>
imap <F11> <Esc> :call ToggleFullscreen()<CR>

"方向键切换窗口
map <Left> <c-w>h
map <Down> <c-w>j
map <up> <c-w>k
map <right> <c-w>l

"代码折叠
set foldenable
set foldmethod=syntax
set foldcolumn=0
set foldlevelstart=99

"与Windows共享剪切
set clipboard+=unnamed

"自动载入
set autoread

"默认操作路径
cd $VIM\Vim_Projects





"Vundle及Vim插件
filetype plugin on
set nocompatible
filetype off
set rtp+=$VIM/vimfiles/bundle/Vundle.vim
call vundle#begin('$VIM/vimfiles/bundle/')

Plugin 'git://github.com/VundleVim/Vundle.vim.git'

Plugin 'git://github.com/kien/ctrlp.vim.git'
Plugin 'git://github.com/scrooloose/nerdtree.git'
Plugin 'git://github.com/scrooloose/nerdcommenter.git'
Plugin 'git://github.com/universal-ctags/ctags.git'
Plugin 'git://github.com/majutsushi/tagbar.git'
Plugin 'git://github.com/easymotion/vim-easymotion.git'
Plugin 'git://github.com/vim-airline/vim-airline.git'
Plugin 'git://github.com/vim-airline/vim-airline-themes.git'
" Plugin 'git://github.com/Valloric/YouCompleteMe.git'
Plugin 'git://github.com/vim-scripts/TogFullscreen.vim.git'
Plugin 'git://github.com/skywind3000/asyncrun.vim.git'
Plugin 'git://github.com/pbrisbin/vim-mkdir.git'
Plugin 'git://github.com/vim-scripts/a.vim.git'
Plugin 'git://github.com/terryma/vim-multiple-cursors.git'
" Plugin 'git://github.com/tpope/vim-surround.git'
Plugin 'git://github.com/Yggdroot/indentLine.git'
Plugin 'git://github.com/w0rp/ale.git'

call vundle#end()
filetype plugin indent on





"EasyMotion 配置
let mapleader=','
let g:mapleader = ","
let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_mapping = 1
let g:EasyMotion_startofline = 0
map <Leader> <Plug>(easymotion-prefix)
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)


"multiple-cursors 配置
set selection=inclusive
let g:multi_cursor_use_default_mapping=1
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
" let g:multi_cursor_start_key='<F4>'
" let g:multi_cursor_start_word_key='g<C-n>'
" highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
" highlight link multiple_cursors_visual Visual


"NERD_Tree 配置 <F5>
map <F5> :NERDTreeToggle<CR>
imap <F5> <Esc>:NERDTreeToggle<CR>
" autocmd vimenter * NERDTree
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'


"Nerd_Commenter 配置 <,CC> <,C<Space>>
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1


"Ctags 配置
set autochdir
set tags+=$VIM/vim80/systags
set tags+=./tags


"TagBar 配置 <F6>
map <F6> :TagbarToggle<CR>
imap <F6> <Esc> :TagbarToggle<CR>
let g:tagbar_ctags_bin='ctags'
let g:tagbar_width=30
" autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()


"QuickFix <F2>
map <F2> :call CloseFX()<CR>
imap <F2> <Esc> :call CloseFX()<CR>
func! CloseFX()
	exec "cclose"
	exec "TagbarOpen"
endfunc


"AirLine配置 <Ctrl + Tab>
nmap <C-tab> :bn<CR>
let g:airline_theme="luna" 
let g:airline_powerline_fonts = 1   
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:Powerline_symbols="fancy"
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
map <Leader>1 :b 1<CR>
map <Leader>2 :b 2<CR>
map <Leader>3 :b 3<CR>
map <Leader>4 :b 4<CR>
map <Leader>5 :b 5<CR>
map <Leader>6 :b 6<CR>
map <Leader>7 :b 7<CR>
map <Leader>8 :b 8<CR>
map <Leader>9 :b 9<CR>
" function! ALEGetStatusLine()
"     if &filetype == 'c,cpp'
"         let w:airline_section_a = 'ALEGetStatusLine'
"         let w:airline_section_b = '%f'
"         let w:airline_section_c = '%{ALEGetStatusLine()}'
"         let g:airline_variable_referenced_in_statusline = 'foo'
"     endif
" endfunction
" call airline#add_statusline_func('ALEGetStatusLine')



"IndentLine 配置
let g:indentLine_enabled = 1
let g:indentLine_char = '¦'


"YouCompleteMe 配置
filetype on
" set runtimepath+=$VIM/vimfiles/bundle/YouCompleteMe
let $PATH='$VIM/vimfiles/Python_3.5;'.$PATH
let $PYTHON='$VIM/vimfiles/Python_3.5'
" autocmd FileType c,cpp,h :let g:ycm_global_ycm_extra_conf = '$VIM/vimfiles/bundle/YouCompleteMe/third_party/.ycm_extra_conf.py'


"ALE 配置
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_statusline_format = ['x %d', '⚠ %d', '> ok']
augroup YourGroup
    autocmd!
    autocmd User ALELint call YourFunction()
augroup END
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)


"AsyncRun 配置 <F7>
map <F7> :call AsyncRun()<CR>
imap <F7> <Esc> :call AsyncRun()<CR>
func! AsyncRun()
	exec "w"
	if expand("%:e") == "c"
		exec "AsyncRun gcc -std=c11 -Wall -g -O0 -c % -o %<.o"
		exec "TagbarClose"
		exec "copen"
		echohl WarningMsg | echo "AsyncRun Done!"  	
	elseif expand("%:e") == "cpp"  
		exec "AsyncRun g++ -std=c++14 -Wall -g -O0 -c % -o %<.o"
		exec "TagbarClose"
		exec "copen"
		echohl WarningMsg | echo "AsyncRun Done!"  	
	endif
endfunc


"Debug 配置 <F8>
map <F8> :call Debug()<CR>
imap <F8> <Esc> :call Debug()<CR>
func! Debug()
	exec "w"
	if expand("%:e") == "c"
		exec "!gcc -std=c11 % -g -o %<.exe"
		exec "!gdb %<.exe"
		echohl WarningMsg | echo "Debug Done!"  	
	elseif expand("%:e") == "cpp"  
		exec "!g++ -std=c++14 % -g -o %<.exe"
		exec "!gdb %<.exe"
		echohl WarningMsg | echo "Debug Done!"  	
	endif
endfunc





"一键编译运行(请确保文件名不含中文)
if has("gui_running")  
	let g:isGUI = 1  
else  
	let g:isGUI = 0  
endif  

" F9 一键保存、编译、连接存并运行  
map <F9> :call Run()<CR>  
imap <F9> <ESC>:call Run()<CR>  
" Ctrl + F9 一键保存并编译  
map <c-F9> :call Compile()<CR>  
imap <c-F9> <ESC>:call Compile()<CR>  
" Ctrl + F10 一键保存并连接  
map <c-F10> :call Link()<CR>  
imap <c-F10> <ESC>:call Link()<CR>  

let g:iswindows = 1  
let s:LastShellReturn_C = 0  
let s:LastShellReturn_L = 0  
let s:ShowWarning = 1  
let s:Obj_Extension = '.o'  
let s:Exe_Extension = '.exe'  
let s:Sou_Error = 0  

let s:windows_CFlags = 'gcc\ -fexec-charset=gbk\ -std=c11\ -Wall\ -g\ -O0\ -c\ %\ -o\ %<.o'  
let s:windows_CPPFlags = 'g++\ -fexec-charset=gbk\ -std=c++14\ -Wall\ -g\ -O0\ -c\ %\ -o\ %<.o'  

func! Compile()
	exe "w"
	exe ":ccl"
	exe ":update"
	if expand("%:e") == "c" || expand("%:e") == "cpp" || expand("%:e") == "cxx"  
		let s:Sou_Error = 0
		let s:LastShellReturn_C = 0
		let Sou = expand("%:p")  
		let Obj = expand("%:p:r").s:Obj_Extension
		let Obj_Name = expand("%:p:t:r").s:Obj_Extension
		let v:statusmsg = ''
		if !filereadable(Obj) || (filereadable(Obj) && (getftime(Obj) < getftime(Sou)))  
			redraw!
		if expand("%:e") == "c"
			exe ":setlocal makeprg=".s:windows_CFlags  
			echohl WarningMsg | echo " compiling..."  
			silent make  
		elseif expand("%:e") == "cpp" || expand("%:e") == "cxx"  
			exe ":setlocal makeprg=".s:windows_CPPFlags  
			echohl WarningMsg | echo " compiling..."  
			silent make  
		endif  
		redraw!  
		if v:shell_error != 0  
			let s:LastShellReturn_C = v:shell_error  
		endif  
		if s:LastShellReturn_C != 0  
			exe ":bo cope"  
			echohl WarningMsg | echo " compilation failed"  
		else  
			if s:ShowWarning  
				exe ":bo cw"  
			endif  
			echohl WarningMsg | echo " compilation successful"  
		endif  
		else  
			echohl WarningMsg | echo ""Obj_Name"is up to date"  
		endif  
	else  
		let s:Sou_Error = 1  
		echohl WarningMsg | echo " please choose the correct source file"  
	endif  
	exe ":setlocal makeprg=make"  
endfunc  

func! Link()  
	call Compile()  
	if s:Sou_Error || s:LastShellReturn_C != 0  
		return  
	endif  
	let s:LastShellReturn_L = 0  
	let Sou = expand("%:p")  
	let Obj = expand("%:p:r").s:Obj_Extension  
	let Exe = expand("%:p:r").s:Exe_Extension  
	let Exe_Name = expand("%:p:t:r").s:Exe_Extension  
	let v:statusmsg = ''  
	if filereadable(Obj) && (getftime(Obj) >= getftime(Sou))  
		redraw!  
		if !executable(Exe) || (executable(Exe) && getftime(Exe) < getftime(Obj))  
			if expand("%:e") == "c"  
				setlocal makeprg=gcc\ -o\ %<\ %<.o  
				echohl WarningMsg | echo " linking..."  
				silent make  
			elseif expand("%:e") == "cpp" || expand("%:e") == "cxx"  
				setlocal makeprg=g++\ -o\ %<\ %<.o  
				echohl WarningMsg | echo " linking..."  
				silent make  
			endif  
			redraw!  
			if v:shell_error != 0  
				let s:LastShellReturn_L = v:shell_error  
			endif  
			if s:LastShellReturn_L != 0  
				exe ":bo cope"  
				echohl WarningMsg | echo " linking failed"  
			else  
				if s:ShowWarning  
					exe ":bo cw"  
				endif  
				echohl WarningMsg | echo " linking successful"  
			endif  
		else  
			echohl WarningMsg | echo ""Exe_Name"is up to date"  
		endif  
	endif  
	setlocal makeprg=make  
endfunc  

func! Run()  
	let s:ShowWarning = 0  
	call Link()  
	let s:ShowWarning = 1  
	if s:Sou_Error || s:LastShellReturn_C != 0 || s:LastShellReturn_L != 0  
		return  
	endif  
	let Sou = expand("%:p")  
	let Obj = expand("%:p:r").s:Obj_Extension  
	let Exe = expand("%:p:r").s:Exe_Extension  
	if executable(Exe) && getftime(Exe) >= getftime(Obj) && getftime(Obj) >= getftime(Sou)  
		redraw!  
		echohl WarningMsg | echo " running..."  
		exe ":!%<.exe"  
		redraw!  
		echohl WarningMsg | echo " running finish"  
	endif  
endfunc  




"头文件自动插入保护符
" func! s:insert_gates()
"     let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
"     exec "normal! i#ifndef _" . gatename
"     exec "normal! o#define _" . gatename
"     exec "normal! Go#endif // _" . gatename
"     normal! kk
" endfunc
" autocmd BufNewFile *.{h,hpp,H} call insert_gates()





set diffexpr=MyDiff()
func MyDiff()
	let opt = '-a --binary '
	if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
	if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
	let arg1 = v:fname_in
	if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
	let arg2 = v:fname_new
	if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
	let arg3 = v:fname_out
	if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
	if $VIMRUNTIME =~ ' '
		if &sh =~ '\<cmd'
			if empty(&shellxquote)
				let l:shxq_sav = ''
				set shellxquote&
			endif
			let cmd = '"' . $VIMRUNTIME . '\diff"'
		else
			let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
		endif
	else
		let cmd = $VIMRUNTIME . '\diff'
	endif
	silent exec '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
	if exists('l:shxq_sav')
		let &shellxquote=l:shxq_sav
	endif
endfunc

