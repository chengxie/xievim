syntax on
set nocompatible
set backspace=indent,eol,start
set syn=cpp
set cindent 
set smartindent
set showmatch
set autoindent
set number
set tabstop=4
set shiftwidth=4
set nowrap 
set incsearch
set hlsearch 
set nobackup
set t_Co=256
colorscheme termcolor
set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set fileformats=unix
set fileformat=unix

",gb2312,gbk,big5

helptags ~/.vim/doc

filetype plugin indent on
if has("autocmd")
    au! BufRead,BufNewFile *.proto setfiletype proto
	au! BufNewFile *.h exec "DoxAuthorEx"
	au! BufNewFile *.cpp exec "DoxAuthor"
	au! BufReadPost changelog :call SetFlod() | exe "normal! zM" | nmap <buffer> <CR> za
	au! BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"zz" | endif
	au! FileType cpp,c,h,php :call CppCodeKeyMap()
	au! FileType proto :call SetFlod()
	au! FileType python setlocal et sta sw=4 sts=4
endif

function! SetFlod()
	setlocal foldenable foldmethod=marker foldmarker={,} commentstring=%s 
endfunction


function! CppCodeKeyMap()	
	"imap <silent><leader>if<Tab> <ESC>:call InsertTemplate('if')<CR>
	"imap <silent><leader>ie<Tab> <ESC>:call InsertTemplate('ifelse')<CR>
	"imap <silent><leader>fo<Tab> <ESC>:call InsertTemplate('for')<CR>
	"imap <silent><leader>sw<Tab> <ESC>:call InsertTemplate('switch')<CR>
	"imap <silent><leader>wh<Tab> <ESC>:call InsertTemplate('while')<CR>
	"imap <silent><leader>wd<Tab> <ESC>:call InsertTemplate('whiledo')<CR>
	"imap <silent><leader>dw<Tab> <ESC>:call InsertTemplate('dowhile')<CR>
	"imap <silent><leader>cl<Tab> <ESC>:call InsertTemplate('class')<CR>

	"imap <silent><leader>st<Tab> 	struct<Space>
	"imap <silent><leader>un<Tab> 	unsigned<Space>
	"imap <silent><leader>#i<Tab>	#include<Space>"
	"imap <silent><leader>#d<Tab>	#define<Space>
	
	ino <leader>{<CR>	{};<Left><Left><CR><ESC>ko
	ino {<CR> 			{}<Left><CR><ESC>ko
	ino [ 				[]<Left>
	ino "				""<Left>
	ino '				''<left>
	ino :: 				::<C-X><C-O>

	imap  			<ESC>
	
	"新开窗口显示
	nmap 				<C-W>
	imap 				<ESC><C-W>
endfunction

function! Help()
	if &buftype == 'help'
		quit
	else
		if &filetype == 'cpp' || &filetype == 'h' || &filetype == 'c'
			silent! exec 'h xie'
		else	
			silent! exec 'help'
		endif
	endif
endfunction

function! FindQuickFixWindow()
	let win_count = winnr('$')
	let i = 0
	let quickfix_win = -1
	while i < win_count
		if getbufvar(winbufnr(i + 1), '&buftype') == 'quickfix'
			let quickfix_win = i + 1
			break
		endif
		let i = i + 1
	endwhile
	return quickfix_win
endfunction

function! QuickFix()
	if FindQuickFixWindow() == -1
		exec 'botright copen'
	else
		exec 'ccl'
	endif
endfunction


function! InsertTemplate(type)
	let code = ''
	let cur_line = line('.')
	let cur_col = col('.')
	let put_line = cur_line - 1
	let offset_x = 0
	let offset_y = 0
	if a:type == 'if'
		let code = 'if () {\n\t\n}'
		let offset_x = 4
	elseif a:type == 'ifelse'
		let code = 'if () {\n\t\n} else {\n\t\n}'
		let offset_x = 4
	elseif a:type == 'for'
		let code = 'for () {\n\t\n}'
		let offset_x = 5
	elseif a:type == 'switch'
		let code = 'switch () {\ncase 1:\nbreak;\ncase 2:\nbreak;\ndefault:\nbreak;\n}'
		let offset_x = 8
	elseif a:type == 'while'
		let code = 'while () {\n\t\n}'
		let offset_x = 7 	
	elseif a:type == 'whiledo'
		let code = 'while () {\n\t\n} do ()'
		let offset_x = 7 
	elseif a:type == 'dowhile'
		let code = 'do () {\n\t\n} while ()'
		let offset_x = 4 
	elseif a:type == 'class'
		let clname = input('Enter your class name: ')
		let code = 'class '.clname.'\n{\nprivate:\n\nprotected:\n\npubilc:\n'.clname.'();\nvirtual ~'.clname.'();\n};'
		let offset_x = 4
		let offset_y = 3
	endif
	
	exec put_line . 'put =\"'.code.'\"'
	let n = line('.') - cur_line + 1
	call cursor(cur_line, cur_col)
	exec 'normal! '. n . '=='
	call cursor(cur_line + offset_y, col('.') + offset_x)
	star		
endfunction

if !exists(':W')
  command! W w
endif

if !exists(':Q')
  command! Q q
endif


nmap <PAGEUP>		<C-B>
nmap <PAGEDOWN>		<C-F>
imap <PAGEUP>		<ESC><C-B>i
imap <PAGEDOWN>		<ESC><C-F>i

imap <C-E>			<ESC><C-E>a
imap <C-Y>			<ESC><C-Y>a
nmap <BS>			<C-W>h
nmap <F10>			#:%s/<C-R>=expand("<cword>")<CR>//g<Left><Left>
imap <F10>			<ESC><F10>
nmap <silent><F11>	:nohl<CR>
imap <silent><F11>	<ESC>:nohl<CR>a
nmap <silent><Space>	i<Space><ESC>l
nmap <silent><F1>	:call Help()<CR>
imap <silent><F1>	<ESC>:call Help()<CR>
vmap <silent><F1>	:call Help()<CR>

nmap <F8>			<ESC>:%s/\r\n/\r/g<CR><ESC>:w<CR><ESC>:%s/\r/\r/g<CR><ESC>:w<CR>


"Project相关
let g:proj_flags="imstg"
let g:proj_close_fold_onstart=1

"自动补全相关
set completeopt=longest,menu
imap <silent> <C-X><C-O>


"F3 Grep 全文搜索相关
let Grep_Xargs_Options = '-0'	"这行只在mac os x 上适用
let Grep_Default_Filelist = '*.c *.cpp *.mm *.h'
nmap <silent><F3> :Rgrep<CR><CR><CR><CR>
imap <silent><F3> <ESC><F3>

"F4代码折叠
set foldmethod=syntax
set foldlevel=100  " 启动vim时不要自动折叠代码
nmap <silent><F4> za
imap <silent><F4> <ESC><F4>a

"F9 QuickFix 相关
nmap <silent><F9> :call QuickFix()<CR>
imap <silent><F9> <ESC><F9>
nmap <silent><C-X><C-K>	:cp<CR>
imap <silent><C-X><C-K> <ESC>:cp<CR>
nmap <silent><C-X><C-J>	:cn<CR>
imap <silent><C-X><C-J> <ESC>:cn<CR>



"==============================================================
"	buffer 切换
"Ctrl+X Ctrl+D 关闭一个tab
"cmd: b 数字   切换到指定编号的buffer
"==============================================================
"GUI模式下允许tab键切换
let g:miniBufExplMapCTabSwitchBufs=1	
"Ctrl+hjkl在窗口间切换
"let g:miniBufExplMapWindowNavVim=1
nmap <silent><C-X><C-D> :BD<CR>
imap <silent><C-X><C-D> <ESC><C-X><C-D>



"==============================================================
"	注释相关
"==============================================================
let g:DoxygenToolkit_startCommentTag="/* "
let g:DoxygenToolkit_startCommentBlock="/* "
let g:DoxygenToolkit_authorName="CHENG XIE" 
let g:DoxygenToolkit_authorEmail = "chengxie@me.com"
let g:DoxygenToolkit_undocTag="DOXIGEN_SKIP_BLOCK"
let g:DoxygenToolkit_projectName = "Wyvern Game Engine"
let g:DoxygenToolkit_projectWebsite = "http://www.wyvol.com"
let g:DoxygenToolkit_copyright="Copyright(C) 2013 Wyvern Studio All Rights Reserved."
"let g:DoxygenToolkit_licenseTag="My own license"

"==============================================================
"F2 打开或关闭 Tlist
"==============================================================
let Tlist_Show_One_File=1
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Highlight_Tag_On_BufEnter=1
let Tlist_Auto_Highlight_Tag=1
let Tlist_Auto_Update=1
nmap <silent><F2> :Tlist<CR>
imap <silent><F2> <ESC><F2>

"==============================================================
"Ctrl+A 切换cpp,h
"==============================================================
nmap <silent><C-A> :A<CR>
imap <silent><C-A> <ESC><C-A>
nmap <silent><C-A><C-S> :AS<CR>
imap <silent><C-A><C-S> <ESC><C-A><C-S>
nmap <silent><C-A><C-V> :AV<CR>
imap <silent><C-A><C-V> <ESC><C-A><C-V>


map ,,	:FufCoverageFile<CR>
let g:fuf_coveragefile_globPatterns = ['**/*.h', '**/*.c', '**/*.cpp', '**/*.cc', '**/*.mm', '**/*.m', '**/*.xml', '**/*.py', '**/*.proto']



"==============================================================
"             cscope ctag 相关
"==============================================================

set tags+=~/.vim/gcc.tags

if has("cscope")

	"csto选项决定是先查找tag文件还是先查找cscope数据库。
	"设置为0则先查找cscope数据库，设置为1先查找tag文件。
	set csto=1

	"设定是否使用quickfix窗口来显示cscope的结果
	set cscopequickfix=c-,d-,e-,g-,i-,s-,t-

	"接管ctags的 Ctrl+] 与 Ctrl+T, 若不想接管则设置 set nocst
	set cst

	"查找光标所在位置的 C 符号(可以跳过注释)
	nmap <silent><C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>
	imap <silent><C-@>s <ESC><C-@>s

	"查找光标所在位置的变量或函数的定义
	nmap <silent><C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>:copen<CR>
	imap <silent><C-@>g <ESC><C-@>g

	"查找所有调用了光标所在位置的变量或函数的地方
	nmap <silent><C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>
	imap <silent><C-@>c <ESC><C-@>c

	"查找光标所在位置的字符串	
	nmap <silent><C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR>
	imap <silent><C-@>t <ESC><C-@>t

	"查找光标所在位置的单词 egrep 模式
	nmap <silent><C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>
	imap <silent><C-@>e <ESC><C-@>e

	"查找本文件
	nmap <silent><C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>:copen<CR>
	imap <silent><C-@>f <ESC><C-@>f

	"查找包含本文件的文件
	nmap <silent><C-@>i :cs find i <C-R>=expand("<cfile>")<CR>$<CR>:copen<CR>
	imap <silent><C-@>i <ESC><C-@>i

	"查找本函数调用的函数
	nmap <silent><C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>
	imap <silent><C-@>d <ESC><C-@>d

endif







