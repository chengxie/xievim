" Mini Buffer Explorer <minibufexpl.vim>
"
" HINT: Type zR if you don't know how to use folds
"
" Script Info and Documentation  {{{
"=============================================================================
"    Copyright: Copyright (C) 2002 & 2003 Bindu Wavell 
"               Permission is hereby granted to use and distribute this code,
"               with or without modifications, provided that this copyright
"               notice is copied with it. Like anything else that's free,
"               minibufexplorer.vim is provided *as is* and comes with no
"               warranty of any kind, either expressed or implied. In no
"               event will the copyright holder be liable for any damamges
"               resulting from the use of this software.
"
" Name Of File: minibufexpl.vim
"  Description: Mini Buffer Explorer Vim Plugin
"   Maintainer: Bindu Wavell <bindu@wavell.net>
"          URL: http://vim.sourceforge.net/scripts/script.php?script_id=159
"  Last Change: Sunday, June 21, 2004
"      Version: 6.3.2
"               Derived from Jeff Lanzarotta's bufexplorer.vim version 6.0.7
"               Jeff can be reached at (jefflanzarotta@yahoo.com) and the
"               original plugin can be found at:
"               http://lanzarotta.tripod.com/vim/plugin/6/bufexplorer.vim.zip
"
"        Usage: Normally, this file should reside in the plugins
"               directory and be automatically sourced. If not, you must
"               manually source this file using ':source minibufexplorer.vim'.
"
"               You may use the default keymappings of
"
"                 <Leader>mbe - Opens MiniBufExplorer
"
"               or you may want to add something like the following
"               key mapping to your _vimrc/.vimrc file.
"
"                 map <Leader>b :MiniBufExplorer<cr>
"
"               However, in most cases you won't need any key-bindings at all.
"
"               <Leader> is usually backslash so type "\mbe" (quickly) to open 
"               the -MiniBufExplorer- window.
"
"               Other keymappings include: <Leader>mbc to close the Explorer
"               window,  <Leader>mbu to force the Explorer to Update and
"               <Leader>mbt to toggle the Explorer window; it will open if
"               closed or close if open. Each of these key bindings can be
"               overridden (see the notes on <Leader>mbe above.)
" 
"               You can map these additional commands as follows:
"
"                 map <Leader>c :CMiniBufExplorer<cr>
"                 map <Leader>u :UMiniBufExplorer<cr>
"                 map <Leader>t :TMiniBufExplorer<cr>
"
"               NOTE: you can change the key binding used in these mappings
"                     so that they fit with your configuration of vim.
"
"               You can also call each of these features by typing the
"               following in command mode:
"
"                 :MiniBufExplorer    " Open and/or goto Explorer
"                 :CMiniBufExplorer   " Close the Explorer if it's open
"                 :UMiniBufExplorer   " Update Explorer without navigating
"                 :TMiniBufExplorer   " Toggle the Explorer window open and 
"                                       closed.
"
"               To control where the new split window goes relative to the 
"               current window, use the setting:
"
"                 let g:miniBufExplSplitBelow=0  " Put new window above
"                                                " current or on the
"                                                " left for vertical split
"                 let g:miniBufExplSplitBelow=1  " Put new window below
"                                                " current or on the
"                                                " right for vertical split
"
"               The default for this is read from the &splitbelow VIM option.
"
"               By default we are now (as of 6.0.2) forcing the -MiniBufExplorer-
"               window to open up at the edge of the screen. You can turn this 
"               off by setting the following variable in your .vimrc:
"
"                 let g:miniBufExplSplitToEdge = 0
"
"               If you would like a vertical explorer you can assign the column
"               width (in characters) you want for your explorer window with the
"               following .vimrc variable (this was introduced in 6.3.0):
"
"                 let g:miniBufExplVSplit = 20   " column width in chars
"
"               IN HORIZONTAL MODE:
"               It is now (as of 6.1.1) possible to set a maximum height for
"               the -MiniBufExplorer- window. You can set the max height by
"               letting the following variable in your .vimrc:
"
"                 let g:miniBufExplMaxSize = <max lines: defualt 0>
"               
"               setting this to 0 will mean the window gets as big as
"               needed to fit all your buffers. 
"
"               NOTE: This was g:miniBufExplMaxHeight before 6.3.0; the old
"               setting is backwards compatible if you don't use MaxSize.
"
"               As of 6.2.2 it is possible to set a minimum height for the 
"               -MiniBufExplorer- window. You can set the min height by
"               letting the following variable in your .vimrc:
"
"                 let g:miniBufExplMinSize = <min height: default 1>
"
"               NOTE: This was g:miniBufExplMinHeight before 6.3.0; the old
"               setting is backwards compatible if you don't use MinSize.
"
"               IN VERTICAL MODE: (as of 6.3.0)
"               By default the vertical explorer has a fixed width. If you put:
"
"                 let g:miniBufExplMaxSize = <max width: default 0> 
"
"               into your .vimrc then MBE will attempt to set the width of the
"               MBE window to be as wide as your widest tab. The width will not
"               exceed MaxSize even if you have wider tabs. 
"
"               Accepting the default value of 0 for this will give you a fixed
"               width MBE window.
"
"               You can specify a MinSize for the vertical explorer window by
"               putting the following in your .vimrc:
"
"                 let g:miniBufExplMinSize = <min width: default 1>
"
"               This will have no effect unless you also specivy MaxSize.
"
"               By default we are now (as of 6.0.1) turning on the MoreThanOne
"               option. This stops the -MiniBufExplorer- from opening 
"               automatically until more than one eligible buffer is available.
"               You can turn this feature off by setting the following variable
"               in your .vimrc:
"                 
"                 let g:miniBufExplorerMoreThanOne=1
"
"               (The following enhancement is as of 6.2.2)
"               Setting this to 0 will cause the MBE window to be loaded even
"               if no buffers are available. Setting it to 1 causes the MBE
"               window to be loaded as soon as an eligible buffer is read. You
"               can also set it to larger numbers. So if you set it to 4 for
"               example the MBE window wouldn't auto-open until 4 eligibles
"               buffers had been loaded. This is nice for folks that don't 
"               want an MBE window unless they are editing more than two or
"               three buffers.
"
"               To enable the optional mapping of Control + Vim Direction Keys 
"               [hjkl] to window movement commands, you can put the following into 
"               your .vimrc:
"
"                 let g:miniBufExplMapWindowNavVim = 1
"
"               To enable the optional mapping of Control + Arrow Keys to window 
"               movement commands, you can put the following into your .vimrc:
"
"                 let g:miniBufExplMapWindowNavArrows = 1
"
"               To enable the optional mapping of <C-TAB> and <C-S-TAB> to a 
"               function that will bring up the next or previous buffer in the
"               current window, you can put the following into your .vimrc:
"
"                 let g:miniBufExplMapCTabSwitchBufs = 1
"
"               To enable the optional mapping of <C-TAB> and <C-S-TAB> to mappings
"               that will move to the next and previous (respectively) window, you
"               can put the following into your .vimrc:
"
"                 let g:miniBufExplMapCTabSwitchWindows = 1
"
"
"               NOTE: If you set the ...TabSwitchBufs AND ...TabSwitchWindows, 
"                     ...TabSwitchBufs will be enabled and ...TabSwitchWindows 
"                     will not.
"               
"               As of MBE 6.3.0, you can put the following into your .vimrc:
"               
"                 let g:miniBufExplUseSingleClick = 1
"
"               If you would like to single click on tabs rather than double
"               clicking on them to goto the selected buffer. 
"
"               NOTE: If you use the single click option in taglist.vim you may 
"                     need to get an updated version that includes a patch I 
"                     provided to allow both explorers to provide single click 
"                     buffer selection.
"
"               It is possible to customize the the highlighting for the tabs in 
"               the MBE by configuring the following highlighting groups:
"
"                 MBENormal         - for buffers that have NOT CHANGED and
"                                     are NOT VISIBLE.
"                 MBEChanged        - for buffers that HAVE CHANGED and are
"                                     NOT VISIBLE
"                 MBEVisibleNormal  - buffers that have NOT CHANGED and are
"                                     VISIBLE
"                 MBEVisibleChanged - buffers that have CHANGED and are VISIBLE
"
"               You can either link to an existing highlighting group by
"               adding a command like:
"
"                 hi link MBEVisibleChanged Error
"
"               to your .vimrc or you can specify exact foreground and background
"               colors using the following syntax:
"
"                 hi MBEChanged guibg=darkblue ctermbg=darkblue termbg=white
"
"               NOTE: If you set a colorscheme in your .vimrc you should do it
"                     BEFORE updating the MBE highlighting groups.
"
"               If you use other explorers like TagList you can (As of 6.2.8) put:
"
"                 let g:miniBufExplModSelTarget = 1
" 
"               into your .vimrc in order to force MBE to try to place selected 
"               buffers into a window that does not have a nonmodifiable buffer.
"               The upshot of this should be that if you go into MBE and select
"               a buffer, the buffer should not show up in a window that is 
"               hosting an explorer.
"
"               There is a VIM bug that can cause buffers to show up without 
"               their highlighting. The following setting will cause MBE to
"               try and turn highlighting back on (introduced in 6.3.1):
"
"                 let g:miniBufExplForceSyntaxEnable = 1
"
"               MBE has had a basic debugging capability for quite some time.
"               However, it has not been very friendly in the past. As of 6.0.8, 
"               you can put one of each of the following into your .vimrc:
"
"                 let g:miniBufExplorerDebugLevel = 0  " MBE serious errors output
"                 let g:miniBufExplorerDebugLevel = 4  " MBE all errors output
"                 let g:miniBufExplorerDebugLevel = 10 " MBE reports everything
"
"               You can also set a DebugMode to cause output to be target as
"               follows (default is mode 3):
"
"                 let g:miniBufExplorerDebugMode  = 0  " Errors will show up in 
"                                                      " a vim window
"                 let g:miniBufExplorerDebugMode  = 1  " Uses VIM's echo function
"                                                      " to display on the screen
"                 let g:miniBufExplorerDebugMode  = 2  " Writes to a file
"                                                      " MiniBufExplorer.DBG
"                 let g:miniBufExplorerDebugMode  = 3  " Store output in global:
"                                                 " g:miniBufExplorerDebugOutput
"
"               Or if you are able to start VIM, you might just perform these
"               at a command prompt right before you do the operation that is
"               failing.
"
"      History: Moved to end of file
"      
" Known Issues: When debugging is turned on and set to output to a window, there
"               are some cases where the window is opened more than once, there
"               are other cases where an old debug window can be lost.
" 
"               Several MBE commands can break the window history so <C-W>[pnw]
"               might not take you to the expected window.
"
"         Todo: Add the ability to specify a regexp for eligible buffers
"               allowing the ability to filter out certain buffers that 
"               you don't want to control from MBE
"
"=============================================================================
" }}}

" Startup Check
"
" Has this plugin already been loaded? {{{
"
if exists('loaded_minibufexplorer')
  finish
endif
let loaded_minibufexplorer = 1

let s:miniBufExplorerAutoUpdate = 1
let s:curEditWindowBuffer = -1

" }}}

" Mappings and Commands
"
" MBE Keyboard Mappings {{{
" If we don't already have keyboard mappings for MBE then create them 
" 
if !hasmapto('<Plug>MiniBufExplorer')
  map <unique> <Leader>mbe <Plug>MiniBufExplorer
endif
if !hasmapto('<Plug>CMiniBufExplorer')
  map <unique> <Leader>mbc <Plug>CMiniBufExplorer
endif
if !hasmapto('<Plug>UMiniBufExplorer')
  map <unique> <Leader>mbu <Plug>UMiniBufExplorer
endif
if !hasmapto('<Plug>TMiniBufExplorer')
  map <unique> <Leader>mbt <Plug>TMiniBufExplorer
endif

" }}}
" MBE <Script> internal map {{{
" 
noremap <unique> <script> <Plug>MiniBufExplorer  :call <SID>StartExplorer(1, -1)<CR>:<BS>
noremap <unique> <script> <Plug>CMiniBufExplorer :call <SID>StopExplorer(1)<CR>:<BS>
noremap <unique> <script> <Plug>UMiniBufExplorer :call <SID>AutoUpdate(-1)<CR>:<BS>
noremap <unique> <script> <Plug>TMiniBufExplorer :call <SID>ToggleExplorer()<CR>:<BS>

" }}}
" MBE commands {{{
" 
if !exists(':MiniBufExplorer')
  command! MiniBufExplorer  call <SID>StartExplorer(1, -1)
endif
if !exists(':CMiniBufExplorer')
  command! CMiniBufExplorer  call <SID>StopExplorer(1)
endif
if !exists(':UMiniBufExplorer')
  command! UMiniBufExplorer  call <SID>AutoUpdate(-1)
endif
if !exists(':TMiniBufExplorer')
  command! TMiniBufExplorer  call <SID>ToggleExplorer()
endif

if !exists(':BB')
  command! -nargs=1 -complete=buffer BB b!<args>
endif
if !exists(':BD')
  command! BD call <SID>MBEDeleteBuffer()
endif
if !exists(':BN')
  command! BN call <SID>CycleBuffer(1)
endif
if !exists(':BP')
  command! BP call <SID>CycleBuffer(0)
endif
if !exists(':ForceMB')
  command! ForceMB call <SID>StartExplorerForce()
endif
" }}}


" Global Configuration Variables


nnoremap <silent><C-L>	:BN<CR>
nnoremap <silent><C-H>	:BP<CR>
inoremap <silent><C-L>	<ESC>:BN<CR>a
inoremap <silent><C-H>	<ESC>:BP<CR>a
nnoremap <silent><C-K>	<C-W>k
nnoremap <silent><C-J>	<C-W>j
inoremap <silent><C-K>	<ESC><C-W>ka
inoremap <silent><C-J>	<ESC><C-W>ja


" Debug Level {{{
"
" 0 = no logging
" 0=5 = errors ; 1 is the most important
" 5-9 = info ; 5 is the most important
" 10 = Entry/Exit
if !exists('g:miniBufExplorerDebugLevel')
  let g:miniBufExplorerDebugLevel = 0 
endif

" }}}
" Debug Mode {{{
"
" 0 = debug to a window
" 1 = use vim's echo facility
" 2 = write to a file named MiniBufExplorer.DBG
"     in the directory where vim was started
"     THIS IS VERY SLOW
" 3 = Write into g:miniBufExplorerDebugOutput
"     global variable [This is the default]
if !exists('g:miniBufExplorerDebugMode')
  let g:miniBufExplorerDebugMode = 3 
endif 

" }}}
" Split below/above/left/right? {{{
" When opening a new -MiniBufExplorer- window, split the new windows below or 
" above the current window?  1 = below, 0 = above.
"
if !exists('g:miniBufExplSplitBelow')
  let g:miniBufExplSplitBelow = &splitbelow
endif 

" }}}
" Split to edge? {{{
" When opening a new -MiniBufExplorer- window, split the new windows to the
" full edge? 1 = yes, 0 = no.
"
if !exists('g:miniBufExplSplitToEdge')
  let g:miniBufExplSplitToEdge = 1
endif 

" }}}
" MaxHeight (depreciated) {{{
" When sizing the -MiniBufExplorer- window, assign a maximum window height.
" 0 = size to fit all buffers, otherwise the value is number of lines for
" buffer. [Depreciated use g:miniBufExplMaxSize]
"
if !exists('g:miniBufExplMaxHeight')
  let g:miniBufExplMaxHeight = 0
endif 

" }}}
" MaxSize {{{
" Same as MaxHeight but also works for vertical splits if specified with a
" vertical split then vertical resizing will be performed. If left at 0 
" then the number of columns in g:miniBufExplVSplit will be used as a
" static window width.
if !exists('g:miniBufExplMaxSize')
  let g:miniBufExplMaxSize = g:miniBufExplMaxHeight
endif

" }}}
" MinHeight (depreciated) {{{
" When sizing the -MiniBufExplorer- window, assign a minumum window height.
" the value is minimum number of lines for buffer. Setting this to zero can
" cause strange height behavior. The default value is 1 [Depreciated use
" g:miniBufExplMinSize]
"
if !exists('g:miniBufExplMinHeight')
  let g:miniBufExplMinHeight = 1
endif

" }}}
" MinSize {{{
" Same as MinHeight but also works for vertical splits. For vertical splits, 
" this is ignored unless g:miniBufExplMax(Size|Height) are specified.
if !exists('g:miniBufExplMinSize')
  let g:miniBufExplMinSize = g:miniBufExplMinHeight
endif

" }}}
" Horizontal or Vertical explorer? {{{
" For folks that like vertical explorers, I'm caving in and providing for
" veritcal splits. If this is set to 0 then the current horizontal 
" splitting logic will be run. If however you want a vertical split,
" assign the width (in characters) you wish to assign to the MBE window.
"
if !exists('g:miniBufExplVSplit')
  let g:miniBufExplVSplit = 0
endif

" }}}
" TabWrap? {{{
" By default line wrap is used (possibly breaking a tab name between two
" lines.) Turning this option on (setting it to 1) can take more screen
" space, but will make sure that each tab is on one and only one line.
"
if !exists('g:miniBufExplTabWrap')
  let g:miniBufExplTabWrap = 0
endif

" }}}
" Extended window navigation commands? {{{
" Global flag to turn extended window navigation commands on or off
" enabled = 1, dissabled = 0
"
if !exists('g:miniBufExplMapWindowNav')
  " This is for backwards compatibility and may be removed in a
  " later release, please use the ...NavVim and/or ...NavArrows 
  " settings.
  let g:miniBufExplMapWindowNav = 0
endif
if !exists('g:miniBufExplMapWindowNavVim')
  let g:miniBufExplMapWindowNavVim = 0
endif
if !exists('g:miniBufExplMapWindowNavArrows')
  let g:miniBufExplMapWindowNavArrows = 0
endif
if !exists('g:miniBufExplMapCTabSwitchBufs')
  let g:miniBufExplMapCTabSwitchBufs = 0
endif
" Notice: that if CTabSwitchBufs is turned on then
" we turn off CTabSwitchWindows.
if g:miniBufExplMapCTabSwitchBufs == 1 || !exists('g:miniBufExplMapCTabSwitchWindows')
  let g:miniBufExplMapCTabSwitchWindows = 0
endif 

"
" If we have enabled control + vim direction key remapping
" then perform the remapping
"
" Notice: I left g:miniBufExplMapWindowNav in for backward
" compatibility. Eventually this mapping will be removed so
" please use the newer g:miniBufExplMapWindowNavVim setting.
if g:miniBufExplMapWindowNavVim || g:miniBufExplMapWindowNav
  noremap <C-J> <C-W>j
  noremap <C-K> <C-W>k
  noremap <C-H> <C-W>h
  noremap <C-L> <C-W>l
endif

"
" If we have enabled control + arrow key remapping
" then perform the remapping
"
if g:miniBufExplMapWindowNavArrows
  noremap <C-Down>  <C-W>j
  noremap <C-Up>    <C-W>k
  noremap <C-Left>  <C-W>h
  noremap <C-Right> <C-W>l
endif

" If we have enabled <C-TAB> and <C-S-TAB> to switch buffers
" in the current window then perform the remapping
"
if g:miniBufExplMapCTabSwitchBufs
  noremap <C-TAB>   :call <SID>CycleBuffer(1)<CR>:<BS>
  noremap <C-S-TAB> :call <SID>CycleBuffer(0)<CR>:<BS>
endif

"
" If we have enabled <C-TAB> and <C-S-TAB> to switch windows
" then perform the remapping
"
if g:miniBufExplMapCTabSwitchWindows
  noremap <C-TAB>   <C-W>w
  noremap <C-S-TAB> <C-W>W
endif

"}}}
" Force Syntax Enable {{{
"
if !exists('g:miniBufExplForceSyntaxEnable')
  let g:miniBufExplForceSyntaxEnable = 0
endif

" }}}
" Single/Double Click? {{{
" flag that can be set to 1 in a users .vimrc to allow 
" single click switching of tabs. By default we use
" double click for tab selection.
"
if !exists('g:miniBufExplUseSingleClick')
  let g:miniBufExplUseSingleClick = 0
endif 

"
" attempt to perform single click mapping, it would be much
" nicer if we could nnoremap <buffer> ... however vim does
" not fire the <buffer> <leftmouse> when you use the mouse
" to enter a buffer.
"
if g:miniBufExplUseSingleClick == 1
  let s:clickmap = ':if bufname("%") == "-MiniBufExplorer-" <bar> call <SID>MBEClick() <bar> endif <CR>'
  if maparg('<LEFTMOUSE>', 'n') == '' 
    " no mapping for leftmouse
    exec ':nnoremap <silent> <LEFTMOUSE> <LEFTMOUSE>' . s:clickmap
  else
    " we have a mapping
    let  g:miniBufExplDoneClickSave = 1
    let  s:m = ':nnoremap <silent> <LEFTMOUSE> <LEFTMOUSE>'
    let  s:m = s:m . substitute(substitute(maparg('<LEFTMOUSE>', 'n'), '|', '<bar>', 'g'), '\c^<LEFTMOUSE>', '', '')
    let  s:m = s:m . s:clickmap
    exec s:m
  endif
endif " }}}

" Variables used internally
"
" Script/Global variables {{{
" Global used to store the buffer list so we don't update the
" UI unless the list has changed.
if !exists('g:miniBufExplBufList')
  let g:miniBufExplBufList = ''
endif

" Variable used as a mutex so that we don't do lots
" of AutoUpdates at the same time.
if !exists('g:miniBufExplInAutoUpdate')
  let g:miniBufExplInAutoUpdate = 0
endif

" In debug mode 3 this variable will hold the debug output
if !exists('g:miniBufExplorerDebugOutput')
  let g:miniBufExplorerDebugOutput = ''
endif

" In debug mode 3 this variable will hold the debug output
if !exists('g:miniBufExplForceDisplay')
  let g:miniBufExplForceDisplay = 0
endif

"强制启动
if !exists('g:miniBufExplForceStart')
	let g:miniBufExplForceStart = 0
endif


" Variable used to pass maxTabWidth info between functions
let s:maxTabWidth = 0 

" Variable used to count debug output lines
let s:debugIndex = 0 

  
" }}}
" Setup an autocommand group and some autocommands {{{
" that keep our explorer updated automatically.
"
augroup MiniBufExplorer
autocmd WinLeave	-MiniBufExplorer- call <SID>OnWinLeave()
autocmd BufFilePost 	* call <SID>OnBufFilePost()
autocmd BufWritePost	* call <SID>OnBufWritePost()
autocmd BufDelete   * call <SID>OnBufDeleteBefore(expand('<abuf>'))
autocmd BufEnter    * call <SID>OnEnterBuffer()
autocmd VimEnter	* call <SID>OnVimEnter()
augroup end
" }}}


function! <SID>StartExplorerForce()
	let g:miniBufExplForceStart = 1
	call <SID>StartExplorer(1, -1)
endfunction

" Functions
"
" StartExplorer - Sets up our explorer and causes it to be displayed {{{
"
function! <SID>StartExplorer(sticky, delBufNum)
  call <SID>DEBUG('===========================',10)
  call <SID>DEBUG('Entering StartExplorer()'   ,10)
  call <SID>DEBUG('===========================',10)


  " 如果project插件未启动，就忽略
  if !exists("g:proj_running") && g:miniBufExplForceStart == 0
  	return
  endif

  if a:sticky == 1
    let s:miniBufExplorerAutoUpdate = 1
  endif

  " Store the current buffer
  let l:curBuf = bufnr('%')

  " Prevent a report of our actions from showing up.
  let l:save_rep = &report
  let l:save_sc  = &showcmd
  let &report    = 10000
  set noshowcmd 

  call <SID>FindCreateWindow(-1, 1)

  " Make sure we are in our window
  if bufname('%') != '-MiniBufExplorer-'
    call <SID>DEBUG('StartExplorer called in invalid window',1)
    let &report  = l:save_rep
    let &showcmd = l:save_sc
    return
  endif

  " !!! We may want to make the following optional -- Bindu
  " New windows don't cause all windows to be resized to equal sizes
  set noequalalways
  " !!! We may want to make the following optional -- Bindu
  " We don't want the mouse to change focus without a click
  set nomousefocus

  " If folks turn numbering and columns on by default we will turn 
  " them off for the MBE window
  setlocal foldcolumn=0
  setlocal nonumber
  setlocal noshowmatch
  setlocal matchpairs-=[:]

  if has("syntax")
    syn clear
    syn match MBENormal             '\[[^\]]*\]'
    syn match MBEChanged            '\[[^\]]*\]+'
    syn match MBEVisibleNormal      '\[[^\]]*\]\#+\='
    syn match MBEVisibleChanged     '\[[^\]]*\]\#+'
	syn match MBEVisibleNormalCur	'\[[^\]]*\]\*+\='

    if !exists("g:did_minibufexplorer_syntax_inits")
      let g:did_minibufexplorer_syntax_inits = 1
      "hi def link MBENormal         Comment
      "hi def link MBEChanged        String
      "hi def link MBEVisibleNormal  Special
      "hi def link MBEVisibleChanged Special
	  hi MBENormal ctermbg=233 ctermfg=240
	  hi MBEChanged ctermbg=233 ctermfg=180
      hi MBEVisibleNormal ctermbg=233 ctermfg=247
	  hi MBEVisibleChanged ctermbg=233 ctermfg=247
	  hi MBEVisibleNormalCur ctermbg=0 ctermfg=173
    endif
  endif

  " If you press return in the -MiniBufExplorer- then try
  " to open the selected buffer in the previous window.
  nnoremap <buffer> <CR> :call <SID>MBESelectBuffer(-1)<CR>:<BS>
  " If you DoubleClick in the -MiniBufExplorer- then try
  " to open the selected buffer in the previous window.
  nnoremap <buffer> <2-LEFTMOUSE> :call <SID>MBEDoubleClick()<CR>:<BS>
  " If you press d in the -MiniBufExplorer- then try to
  " delete the selected buffer.
  nnoremap <buffer> d :call <SID>MBEDeleteBuffer()<CR>:<BS>
  " If you press w in the -MiniBufExplorer- then switch back
  " to the previous window.
  nnoremap <buffer> p :wincmd p<CR>:<BS>
  " The following allow us to use regular movement keys to 
  " scroll in a wrapped single line buffer
  nnoremap <buffer> j gj
  nnoremap <buffer> k gk
  nnoremap <buffer> <down> gj
  nnoremap <buffer> <up> gk
  " The following allows for quicker moving between buffer
  " names in the [MBE] window it also saves the last-pattern
  " and restores it.
   nnoremap <buffer><silent><TAB> :call <SID>OnNext()<CR>
   nnoremap <buffer><silent><S-TAB> :call <SID>OnPre()<CR>

  call <SID>DisplayBuffers(a:delBufNum)

  if (l:curBuf != -1)
    call search('\['.l:curBuf.':'.expand('#'.l:curBuf.':t').'\]')
  endif

  let &report  = l:save_rep
  let &showcmd = l:save_sc

  call <SID>DEBUG('===========================',10)
  call <SID>DEBUG('Completed StartExplorer()'  ,10)
  call <SID>DEBUG('===========================',10)

endfunction 

" }}}
" StopExplorer - Looks for our explorer and closes the window if it is open {{{
"
function! <SID>StopExplorer(sticky)
  call <SID>DEBUG('===========================',10)
  call <SID>DEBUG('Entering StopExplorer()'    ,10)
  call <SID>DEBUG('===========================',10)

  if a:sticky == 1
    let s:miniBufExplorerAutoUpdate = 0
  endif

  let l:winNum = <SID>FindWindow('-MiniBufExplorer-')

  if l:winNum != -1 
    exec l:winNum.' wincmd w'
    silent! close
    wincmd p
  endif

  call <SID>DEBUG('===========================',10)
  call <SID>DEBUG('Completed StopExplorer()'   ,10)
  call <SID>DEBUG('===========================',10)

endfunction

" }}}
" ToggleExplorer - Looks for our explorer and opens/closes the window {{{
"
function! <SID>ToggleExplorer()
  call <SID>DEBUG('===========================',10)
  call <SID>DEBUG('Entering ToggleExplorer()'  ,10)
  call <SID>DEBUG('===========================',10)

  let s:miniBufExplorerAutoUpdate = 1

  let l:winNum = <SID>FindWindow('-MiniBufExplorer-')

  if l:winNum != -1 
    call <SID>StopExplorer(1)
  else
    call <SID>StartExplorer(1, -1)
  endif

  call <SID>DEBUG('===========================',10)
  call <SID>DEBUG('Completed ToggleExplorer()' ,10)
  call <SID>DEBUG('===========================',10)

endfunction

" }}}
" FindWindow - Return the window number of a named buffer {{{
" If none is found then returns -1. 
"
function! <SID>FindWindow(bufName)
  " Try to find an existing window that contains 
  " our buffer.
  let l:bufNum = bufnr(a:bufName)
  if l:bufNum != -1
    let l:winNum = bufwinnr(l:bufNum)
  else
    let l:winNum = -1
  endif

  return l:winNum

endfunction

" }}}
" FindCreateWindow - Attempts to find a window for a named buffer. {{{
"
" If it is found then moves there. Otherwise creates a new window and 
" configures it and moves there.
"
" forceEdge, -1 use defaults, 0 below, 1 above
" isExplorer, 0 no, 1 yes 
" doDebug, 0 no, 1 yes
"
function! <SID>FindCreateWindow(forceEdge, isExplorer)
  	
  " Save the user's split setting.
  let l:saveSplitBelow = &splitbelow

  " Set to our new values.
  let &splitbelow = g:miniBufExplSplitBelow

  " Try to find an existing explorer window
  let l:winNum = <SID>FindWindow('-MiniBufExplorer-')

  " If found goto the existing window, otherwise 
  " split open a new window.
  if l:winNum != -1
    exec l:winNum.' wincmd w'
  else
	
    if g:miniBufExplSplitToEdge == 1 || a:forceEdge >= 0

        let l:edge = &splitbelow
        if a:forceEdge >= 0
            let l:edge = a:forceEdge
        endif

        if l:edge
            if g:miniBufExplVSplit == 0
              exec 'bo sp -MiniBufExplorer-'
            else
              exec 'bo vsp -MiniBufExplorer-'
            endif
        else
            if g:miniBufExplVSplit == 0
              exec 'to sp -MiniBufExplorer-'
            else
              exec 'to vsp -MiniBufExplorer-'
            endif
        endif
    else
        if g:miniBufExplVSplit == 0
          exec 'sp '.a:bufName
        else
          " &splitbelow doesn't affect vertical splits
          " so we have to do this explicitly.. ugh.
          if &splitbelow
            exec 'rightb vsp -MiniBufExplorer-'
          else
            exec 'vsp -MiniBufExplorer-'
          endif
        endif
    endif

    let g:miniBufExplForceDisplay = 1
	
    " Try to find an existing explorer window
    let l:winNum = <SID>FindWindow('-MiniBufExplorer-')
    if l:winNum != -1
      exec l:winNum.' wincmd w'
	  
	  " Turn off the swapfile, set the buffer type so that it won't get written,
	  " and so that it will get deleted when it gets hidden and turn on word wrap.
	  setlocal noswapfile
	  setlocal buftype=nofile
	  setlocal bufhidden=delete
	  if g:miniBufExplVSplit == 0
		  setlocal wrap
	  else
		  setlocal nowrap
		  exec('setlocal winwidth='.g:miniBufExplMinSize)
	  endif
    endif

  endif

  " Restore the user's split setting.
  let &splitbelow = l:saveSplitBelow

endfunction

" }}}
" DisplayBuffers - Wrapper for getting MBE window shown {{{
"
" Makes sure we are in our explorer, then erases the current buffer and turns 
" it into a mini buffer explorer window.
"
function! <SID>DisplayBuffers(delBufNum)
  
  " Make sure we are in our window
  if bufname('%') != '-MiniBufExplorer-'
    return
  endif

  " We need to be able to modify the buffer
  setlocal modifiable

  call <SID>ShowBuffers(a:delBufNum)
  call <SID>ResizeWindow()
  
  normal! zz
  
  " Prevent the buffer from being modified.
  setlocal nomodifiable
  set nobuflisted

endfunction

" }}}
" Resize Window - Set width/height of MBE window {{{
" 
" Makes sure we are in our explorer, then sets the height/width for our explorer 
" window so that we can fit all of our information without taking extra lines.
"
function! <SID>ResizeWindow()
  call <SID>DEBUG('Entering ResizeWindow()',10)

  " Make sure we are in our window
  if bufname('%') != '-MiniBufExplorer-'
    return
  endif

  let l:width  = winwidth('.')

  " Horizontal Resize
  if g:miniBufExplVSplit == 0

    if g:miniBufExplTabWrap == 0
      let l:length = strlen(getline('.'))
      let l:height = 0
      if (l:width == 0)
        let l:height = winheight('.')
      else
        let l:height = (l:length / l:width) 
        " handle truncation from div
        if (l:length % l:width) != 0
          let l:height = l:height + 1
        endif
      endif
    else
      exec("silent! setlocal textwidth=".l:width)
      normal gg
      normal gq}
      normal G
      let l:height = line('.')
      normal gg
    endif
  
    " enforce max window height
    if g:miniBufExplMaxSize != 0
      if g:miniBufExplMaxSize < l:height
        let l:height = g:miniBufExplMaxSize
      endif
    endif
  
    " enfore min window height
    if l:height < g:miniBufExplMinSize || l:height == 0
      let l:height = g:miniBufExplMinSize
    endif
  
    call <SID>DEBUG('ResizeWindow to '.l:height.' lines',9)
  
    exec('silent! resize '.l:height)
  
  " Vertical Resize
  else 

    if g:miniBufExplMaxSize != 0
      let l:newWidth = s:maxTabWidth
      if l:newWidth > g:miniBufExplMaxSize 
          let l:newWidth = g:miniBufExplMaxSize
      endif
      if l:newWidth < g:miniBufExplMinSize
          let l:newWidth = g:miniBufExplMinSize
      endif
    else
      let l:newWidth = g:miniBufExplVSplit
    endif

    if l:width != l:newWidth
      exec('silent!ertical resize '.l:newWidth)
    endif

  endif
  
endfunction

" }}}
" ShowBuffers - Clear current buffer and put the MBE text into it {{{
" 
" Makes sure we are in our explorer, then adds a list of all modifiable 
" buffers to the current buffer. Special marks are added for buffers that 
" are in one or more windows (*) and buffers that have been modified (+)
"
function! <SID>ShowBuffers(delBufNum)
  call <SID>DEBUG('Entering ShowBuffers()',10)

  let l:ListChanged = <SID>BuildBufferList(a:delBufNum, 1)

  if (l:ListChanged == 1 || g:miniBufExplForceDisplay)
    let l:save_rep = &report
    let l:save_sc = &showcmd
    let &report = 10000
    set noshowcmd 
    
	" Delete all lines in buffer.
    silent! 1,$d _
  
    " Goto the end of the buffer put the buffer list 
    " and then delete the extra trailing blank line
    silent! $
    silent! put! =g:miniBufExplBufList
    silent! $ d _
    
	let g:miniBufExplForceDisplay = 0

    let &report  = l:save_rep
    let &showcmd = l:save_sc

  endif

endfunction

" }}}
" Max - Returns the max of two numbers {{{
"
function! <SID>Max(argOne, argTwo)
  if a:argOne > a:argTwo
    return a:argOne
  else
    return a:argTwo
  endif
endfunction

" }}}
" BuildBufferList - Build the text for the MBE window {{{
" 
" Creates the buffer list string and returns 1 if it is different than
" last time this was called and 0 otherwise.
"
function! <SID>BuildBufferList(delBufNum, updateBufList)
  call <SID>DEBUG('Entering BuildBufferList()',10)

  let l:NBuffers = bufnr('$')     " Get the number of the last buffer.
  let l:i = 0                     " Set the buffer index to zero.

  let l:fileNames = ''
  let l:maxTabWidth = 0

  " Loop through every buffer less than the total number of buffers.
  while(l:i <= l:NBuffers)
    let l:i = l:i + 1
   
    " If we have a delBufNum and it is the current
    " buffer then ignore the current buffer. 
    " Otherwise, continue.
    if (a:delBufNum == -1 || l:i != a:delBufNum)
      " Make sure the buffer in question is listed.
      if(getbufvar(l:i, '&buflisted') == 1)
        " Get the name of the buffer.
        let l:BufName = bufname(l:i)
        " Check to see if the buffer is a blank or not. If the buffer does have
        " a name, process it.
        if(strlen(l:BufName))
          " Only show modifiable buffers (The idea is that we don't 
          " want to show Explorers)
          if (getbufvar(l:i, '&modifiable') == 1 && BufName != '-MiniBufExplorer-')
            
            " Get filename & Remove []'s & ()'s
            let l:shortBufName = fnamemodify(l:BufName, ":t")                  
            let l:shortBufName = substitute(l:shortBufName, '[][()]', '', 'g') 
            let l:tab = '['.l:i.':'.l:shortBufName.']'

            " If the buffer is open in a window mark it
            if bufwinnr(l:i) != -1
		"	  if l:i != s:curEditWindowBuffer
		"		  let l:tab = l:tab . '#'
		"	  else
				  let l:tab = l:tab . '*'
		"	  endif
            endif

            " If the buffer is modified then mark it
            if(getbufvar(l:i, '&modified') == 1)
              let l:tab = l:tab . '+'
            endif

            let l:maxTabWidth = <SID>Max(strlen(l:tab), l:maxTabWidth)
            let l:fileNames = l:fileNames.l:tab

            " If horizontal and tab wrap is turned on we need to add spaces
            if g:miniBufExplVSplit == 0
              if g:miniBufExplTabWrap != 0
                let l:fileNames = l:fileNames.' '
              endif
            " If not horizontal we need a newline
            else
              let l:fileNames = l:fileNames . "\n"
            endif
          endif
        endif
      endif
    endif
  endwhile

  if (g:miniBufExplBufList != l:fileNames)
    if (a:updateBufList)
      let g:miniBufExplBufList = l:fileNames
      let s:maxTabWidth = l:maxTabWidth
    endif
	return 1
  else
	return 0
  endif

endfunction

" }}}
" HasEligibleBuffers - Are there enough MBE eligible buffers to open the MBE window? {{{
" 
" Returns 1 if there are any buffers that can be displayed in a 
" mini buffer explorer. Otherwise returns 0. If delBufNum is
" any non -1 value then don't include that buffer in the list
" of eligible buffers.
"
function! <SID>HasEligibleBuffers(delBufNum)
  call <SID>DEBUG('Entering HasEligibleBuffers()',10)

  let l:save_rep = &report
  let l:save_sc = &showcmd
  let &report = 10000
  set noshowcmd 
  
  let l:NBuffers = bufnr('$')     " Get the number of the last buffer.
  let l:i        = 0              " Set the buffer index to zero.
  let l:found    = 0              " No buffer found
  let l:needed = 0

  " Loop through every buffer less than the total number of buffers.
  while(l:i <= l:NBuffers && l:found < l:needed)
    let l:i = l:i + 1
   
    " If we have a delBufNum and it is the current
    " buffer then ignore the current buffer. 
    " Otherwise, continue.
    if (a:delBufNum == -1 || l:i != a:delBufNum)
      " Make sure the buffer in question is listed.
      if (getbufvar(l:i, '&buflisted') == 1 && getbufvar(l:i, '&buftype') == '' && !getbufvar(l:i, '&previewwindow') )
        " Get the name of the buffer.
        let l:BufName = bufname(l:i)
        " Check to see if the buffer is a blank or not. If the buffer does have
        " a name, process it.
        if (strlen(l:BufName))
          " Only show modifiable buffers (The idea is that we don't 
          " want to show Explorers)
          if ((getbufvar(l:i, '&modifiable') == 1) && (l:BufName != '-MiniBufExplorer-'))
            
              let l:found = l:found + 1
  
          endif
        endif
      endif
    endif
  endwhile

  let &report  = l:save_rep
  let &showcmd = l:save_sc

  call <SID>DEBUG('HasEligibleBuffers found '.l:found.' eligible buffers of '.l:needed.' needed',6)

  return (l:found >= l:needed)
  
endfunction

" }}}
" Auto Update - Function called by auto commands for auto updating the MBE {{{
"
" IF auto update is turned on        AND
"    we are in a real buffer         AND
"    we have enough eligible buffers THEN
" Update our explorer and get back to the current window
"
" If we get a buffer number for a buffer that 
" is being deleted, we need to make sure and 
" remove the buffer from the list of eligible 
" buffers in case we are down to one eligible
" buffer, in which case we will want to close
" the MBE window.
"
function! <SID>AutoUpdate(delBufNum)
  if (g:miniBufExplInAutoUpdate == 1)
    return
  else
    let g:miniBufExplInAutoUpdate = 1
  endif

  " Don't bother autoupdating the MBE window
  if (bufname('%') == '-MiniBufExplorer-')
    " If this is the only buffer left then toggle the buffer
    let g:miniBufExplInAutoUpdate = 0
    return

  endif

 
  " Only allow updates when the AutoUpdate flag is set
  " this allows us to stop updates on startup.
  if s:miniBufExplorerAutoUpdate == 1
      if <SID>HasEligibleBuffers(a:delBufNum) == 1
        " if we don't have a window then create one
        let l:bufnr = <SID>FindWindow('-MiniBufExplorer-')
        if (l:bufnr == -1)
          call <SID>StartExplorer(0, a:delBufNum)
        else
        " otherwise only update the window if the contents have
        " changed
          let l:ListChanged = <SID>BuildBufferList(a:delBufNum, 0)
          if (l:ListChanged)
            call <SID>StartExplorer(0, a:delBufNum)
          endif
        endif

        " go back to the working buffer
        if (bufname('%') == '-MiniBufExplorer-')
        	wincmd p
		endif
      else
        call <SID>StopExplorer(0)
      endif

  endif

  let g:miniBufExplInAutoUpdate = 0

endfunction

" }}}
" GetSelectedBuffer - From the MBE window, return the bufnum for buf under cursor {{{
" 
" If we are in our explorer window then return the buffer number
" for the buffer under the cursor.
"
function! <SID>GetSelectedBuffer()
  call <SID>DEBUG('Entering GetSelectedBuffer()',10)

  " Make sure we are in our window
  if bufname('%') != '-MiniBufExplorer-'
    call <SID>DEBUG('GetSelectedBuffer called in invalid window',1)
    return -1
  endif

  let l:save_reg = @"
  let @" = ""
  normal ""yi[
  if @" != ""
    let l:retv = substitute(@",'\([0-9]*\):.*', '\1', '') + 0
    let @" = l:save_reg
    return l:retv
  else
    let @" = l:save_reg
    return -1
  endif

endfunction

" }}}
" MBESelectBuffer - From the MBE window, open buffer under the cursor {{{
" 
" If we are in our explorer, then we attempt to open the buffer under the
" cursor in the previous window.
"
function! <SID>MBESelectBuffer(editWin)
  " Make sure we are in our window
  if bufname('%') != '-MiniBufExplorer-'
    return 
  endif

  let l:save_rep = &report
  let l:save_sc  = &showcmd
  let &report    = 10000
  set noshowcmd 
  
  let l:bufnr  = <SID>GetSelectedBuffer()
  let l:resize = 0

  if(l:bufnr != -1)             " If the buffer exists.

    let l:saveAutoUpdate = s:miniBufExplorerAutoUpdate
    let s:miniBufExplorerAutoUpdate = 0

	let s:LeaveButNoEditWin = 1

	"先找编辑窗口，如果没有找到，就将焦点回到自己的窗口内	
	let hasEditWin = a:editWin
	if hasEditWin == -1 || getbufvar(winbufnr(hasEditWin), '&buftype') != '' || getbufvar(winbufnr(hasEditWin), '&previewwindow')
		let hasEditWin = s:GotoEditWin()
	else
		exec hasEditWin . 'wincmd w'
	endif

	if hasEditWin != -1	
		exec('silent! b! '.l:bufnr)
		if (l:resize)
			resize
		endif
		let s:miniBufExplorerAutoUpdate = l:saveAutoUpdate
		call <SID>AutoUpdate(-1)
	endif

	let s:LeaveButNoEditWin = 0
  endif

  let &report  = l:save_rep
  let &showcmd = l:save_sc
endfunction

" }}}
" MBEDeleteBuffer - From the MBE window, delete selected buffer from list {{{
" 
" After making sure that we are in our explorer, This will delete the buffer 
" under the cursor. If the buffer under the cursor is being displayed in a
" window, this routine will attempt to get different buffers into the 
" windows that will be affected so that windows don't get removed.
"
function! <SID>MBEDeleteBuffer()

  " Make sure we are in our window
  if s:GotoSelfWin() == -1
    return
  endif

  let l:selBuf     = <SID>GetSelectedBuffer()
  let l:selBufName = bufname(l:selBuf)

  let l:save_rep = &report
  let l:save_sc  = &showcmd
  let &report    = 10000
  set noshowcmd 
  
  if l:selBuf != -1 

	" 如果将要删除的BUF不是最后一个，就切换到下一个BUF
	let l:winNum = (bufwinnr(l:selBufName))

	let buf_count = 0 
	let i = 0
	let numOfCurBuf = 0
	while i < bufnr('$')
		let i = i + 1	
		if buflisted(i) == 1 && getbufvar(i, '&buftype') == '' && !getbufvar(i, '&previewwindow')
			let buf_count = buf_count + 1 
			if i == l:selBuf
				let numOfCurBuf = buf_count
			endif
		endif
	endwhile
	
	if buf_count > 1 && l:winNum != -1
		if numOfCurBuf == buf_count
			call <SID>CycleBuffer(1)
			exec('silent! bd '.l:selBuf)
			call <SID>CycleBuffer(0)
		else
			call <SID>CycleBuffer(1)
			exec('silent! bd '.l:selBuf)
		endif
	else
		let quick_win = s:FindQuickFixWindow()
		if quick_win != -1
			exe quick_win . "wincmd w"
			quit
		endif
		exe l:winNum . "wincmd w"
		exec('silent! bd '.l:selBuf)
	endif
 
    
  endif

  let &report  = l:save_rep
  let &showcmd = l:save_sc
endfunction

" }}}
" MBEClick - Handle mouse double click {{{
"
function! s:MBEClick()
  call <SID>DEBUG('Entering MBEClick()',10)
  call <SID>MBESelectBuffer(-1)
endfunction

"
" MBEDoubleClick - Double click with the mouse.
"
function! s:MBEDoubleClick()
  call <SID>DEBUG('Entering MBEDoubleClick()',10)
  call <SID>MBESelectBuffer(-1)
endfunction

"根据名字查找窗口
function! s:FindWindowByName(name)
	let buf_idx = bufnr(a:name)
	let find_win = -1
	
	if buf_idx != -1
		let find_win = bufwinnr(buf_idx)
	endif
	return find_win	
endfunction

"查找QuickFix窗口
function! s:FindQuickFixWindow()
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


"查找编辑窗口
function! s:FindEditWindow()
	let i = winnr('$')
	let edit_win = -1
	while i > 0
		if getbufvar(winbufnr(i), '&buftype') == '' && !getbufvar(winbufnr(i), '&previewwindow')
			let edit_win = i
			break
		endif
		let i = i - 1
	endwhile
	return edit_win
endfunction

"计算可以编辑的BUF数量
function! s:GetCanEditBufCount()
	let buf_count = bufnr('$')
	let i = 0
	let result = 0
	while i < buf_count
		if buflisted(i + 1)
			let result = result + 1
		endif
		let i = i + 1
	endwhile
	return result
endfunction

"在本窗口内按下Tab键的响应事件
function! <SID>OnTable()
	call <SID>CycleBuffer(1)
	call s:GotoSelfWin()
endfunction

function! <SID>OnNext()
	call <SID>CycleBuffer(1)
	call s:GotoSelfWin()
endfunction

function! <SID>OnPre()
	call <SID>CycleBuffer(0)
	call s:GotoSelfWin()
endfunction

let s:LeaveButNoEditWin = 0

function! <SID>OnWinLeave()
	if s:LeaveButNoEditWin == 0 && s:FindEditWindow() == -1
		let s:LeaveButNoEditWin = 1

		"先关闭project或taglist的窗口
		let funwin = s:CloseFunWin()

		call s:GotoSelfWin()
		bo new
		call <SID>StartExplorer(1, -1)
		
		let edit_win = s:FindEditWindow()
		exe edit_win . "wincmd w"

		"恢复project或taglist的窗口
		call s:RestoreFunWin(funwin)

		call s:GotoSelfWin()

		let s:LeaveButNoEditWin = 0

	endif
endfunction

function! <SID>OnBufFilePost()
	call <SID>AutoUpdate(-1)
endfunction

function! <SID>OnBufWritePost()
	call <SID>AutoUpdate(-1)
endfunction

function! <SID>OnEnterBuffer()
	"if getbufvar(bufnr('%'), '&buftype') == '' && !getbufvar(bufnr('%'), '&previewwindow')
		"let s:curEditWindowBuffer = bufnr('%')
	"elseif winbufnr(s:curEditWindowBuffer) == -1
		"let s:curEditWindowBuffer = -1
	"endif
	call <SID>AutoUpdate(-1)
endfunction

function! <SID>OnVimEnter()
	if !exists("g:proj_running")
		let s:miniBufExplorerAutoUpdate = 1
		call <SID>AutoUpdate(-1)
	endif
endfunction

function! <SID>OnBufDeleteBefore(delBufNum)
	call <SID>AutoUpdate(a:delBufNum)
	if (g:miniBufExplBufList == '')
		call <SID>StopExplorer(0)
	endif
endfunction

"关闭Taglist或project的窗口
function! s:CloseFunWin()
	  "关闭taglist与project的窗口，再重新打开，恢复窗口位置
	let result = 0

	"如果发现project窗口，就将其关闭
	if exists("g:proj_running") 
		let project_win_num = bufwinnr(g:proj_running)
		if project_win_num != -1
			exe project_win_num . "wincmd w"
			exe "hide" 
			let result = 1
		endif	
	endif

	"如果发现有TagList的窗口存在，就将其关闭
	if exists("g:TagList_title")
		let taglist_win_num = bufwinnr(g:TagList_title)
		if taglist_win_num != -1
			exe taglist_win_num . "wincmd w"
			exe "quit"
			let result = 2
		endif	
	endif

	return result
endfunction

"回复之前关闭的Taglist或project窗口
function! s:RestoreFunWin(funwin)
	if a:funwin == 1
		exe "Project"
	endif
	if a:funwin == 2
		exe "Tlist"
	endif
endfunction

"这个函数可以让光标焦点回到MBE自己的窗口内
function! s:GotoSelfWin()
	let mbe_win = s:FindWindowByName('-MiniBufExplorer-')
	if mbe_win != -1
		exe mbe_win . "wincmd w"
	endif
	return mbe_win
endfunction

"这个函数可以避免当光标焦点不在主窗口时切换文件，导致文件不在主窗口打开
function! s:GotoEditWin()
	let edit_win = s:FindEditWindow()
	if edit_win != -1
		exe edit_win . "wincmd w"
	else
		"如果没有可用的编辑窗口，就新建一个
	
		"先关闭project或taglist的窗口
		let funwin = s:CloseFunWin()

		call s:GotoSelfWin()
		bo new
		call <SID>StartExplorer(1, -1)

		"恢复project或taglist的窗口
		call s:RestoreFunWin(funwin)

		let edit_win = s:FindEditWindow()
		exe edit_win . "wincmd w"

	endif

	return edit_win
endfunction


" }}}
" CycleBuffer - Cycle Through Buffers {{{
"
" Move to next or previous buffer in the current window. If there 
" are no more modifiable buffers then stay on the current buffer.
" can be called with no parameters in which case the buffers are
" cycled forward. Otherwise a single argument is accepted, if 
" it's 0 then the buffers are cycled backwards, otherwise they
" are cycled forward.
"
function! <SID>CycleBuffer(forward)

	let curEditWin = -1

	if getbufvar(bufnr('%'), '&buftype') == '' && !getbufvar(bufnr('%'), '&previewwindow')
		let curEditWin = winnr()
	endif

	call s:GotoSelfWin()

	if (a:forward == 1)
		call search('\[[0-9]*:[^\]]*\]')
	else
		call search('\[[0-9]*:[^\]]*\]','b')
	endif

	call <SID>MBESelectBuffer(curEditWin)	
endfunction

" }}}
" DEBUG - Display debug output when debugging is turned on {{{
"
" Thanks to Charles E. Campbell, Jr. PhD <cec@NgrOyphSon.gPsfAc.nMasa.gov> 
" for Decho.vim which was the inspiration for this enhanced debugging 
" capability.
"
function! <SID>DEBUG(msg, level)
endfunc " }}}

" MBE Script History {{{
"=============================================================================
"
"      History: 6.3.2 o For some reason there was still a call to StopExplorer
"                       with 2 params. Very old bug. I know I fixed before, 
"                       any way many thanks to Jason Mills for reporting this!
"               6.3.1 o Include folds in source so that it's easier to 
"                       navigate.
"                     o Added g:miniBufExplForceSyntaxEnable setting for folks
"                       that want a :syntax enable to be called when we enter 
"                       buffers. This can resolve issues caused by a vim bug
"                       where buffers show up without highlighting when another 
"                       buffer has been closed, quit, wiped or deleted.
"               6.3.0 o Added an option to allow single click (rather than
"                       the default double click) to select buffers in the
"                       MBE window. This feature was requested by AW Law
"                       and was inspired by taglist.vim. Note that you will 
"                       need the latest version of taglist.vim if you want to 
"                       use MBE and taglist both with singleclick turned on.
"                       Also thanks to AW Law for pointing out that you can
"                       make an Explorer not be listed in a standard :ls.
"                     o Added the ability to have your tabs show up in a
"                       vertical window rather than the standard horizontal
"                       one. Just let g:miniBufExplVSplit = <width> in your
"                       .vimrc and your will get this functionality.
"                     o If you use the vertical explorer and you want it to
"                       autosize then let g:miniBufExplMaxSize = <max width>
"                       in your .vimrc. You may use the MinSize letting in
"                       addition to the MaxLetting if you don't want a super
"                       thin window.
"                     o g:miniBufExplMaxHeight was renamed g:miniBufExplMaxSize
"                       g:miniBufExplMinHeight was renamed g:miniBufExplMinSize
"                       the old settings are backwards compatible if you don't
"                       use the new settings, but they are depreciated.
"               6.2.8 o Add an option to stop MBE from targeting non-modifiable
"                       buffers when switching buffers. Thanks to AW Law for
"                       the inspiration for this. This may not work if a user
"                       has lots of explorer/help windows open.
"               6.2.7 o Very minor bug fix for people who want to set
"                       loaded_minibufexplorer in their .vimrc in order to
"                       stop MBE from loading. 99.99% of users do not need
"                       this update.
"               6.2.6 o Moved history to end of source file
"                     o Updated highlighting documentation
"                     o Created global commands MBEbn and MBEbp that can be 
"                       used in mappings if folks want to cycle buffers while 
"                       skipping non-eligible buffers.
"               6.2.5 o Added <Leader>mbt key mapping which will toggle
"                       the MBE window. I map this to F3 in my .vimrc
"                       with "map <F3> :TMiniBufExplorer<CR>" which 
"                       means I can easily close the MBE window when I'm 
"                       not using it and get it back when I want it.
"                     o Changed default debug mode to 3 (write to global
"                       g:miniBufExplorerDebugOutput)
"                     o Made a pass through the documentation to clarify 
"                       serveral issues and provide more complete docs
"                       for mappings and commands.
"               6.2.4 o Because of the autocommand switch (see 6.2.0) it 
"                       was possible to remove the restriction on the
"                       :set hidden option. It is now possible to use
"                       this option with MBE.
"               6.2.3 o Added miniBufExplTabWrap option. It is turned 
"                       off by default. When turned on spaces are added
"                       between tabs and gq} is issued to perform line
"                       formatting. This won't work very well if filenames
"                       contain spaces. It would be pretty easy to write
"                       my own formatter, but I'm too lazy, so if someone
"                       really needs that feature I'll add it :)
"               6.2.2 o Changed the way the g:miniBufExplorerMoreThanOne
"                       global is handled. You can set this to the number
"                       of eligible buffers you want to be loaded before
"                       the MBE window is loaded. Setting it to 0 causes
"                       the MBE window to be opened even if there are no
"                       buffers. Setting it to 4 causes the window to stay
"                       closed until the 4th eligible buffer is loaded.
"                     o Added a MinHeight option. This is nice if you want
"                       the MBE window to always take the same amount of
"                       space. For example set MaxSize and MinSize to 2
"                       and set MoreThanOne to 0 and you will always have
"                       a 2 row (plus the ruler :) MBE window.
"                       NOTE: in 6.3.0 we started using MinSize instead of
"                       Minheight. This will still work if MinSize is not
"                       specified, but it is depreciated. Use MinSize instead.
"                     o I now setlocal foldcomun=0 and nonumber in the MBE 
"                       window. This is for those of you that like to have
"                       these options turned on locally. I'm assuming noone
"                       outthere wants foldcolumns and line numbers in the
"                       MBE window? :)
"                     o Fixed a bug where an empty MBE window was taking half
"                       of the screen (partly why the MinHeight option was 
"                       added.)
"               6.2.1 o If MBE is the only window (because of :bd for example)
"                       and there are still eligible buffers then one of them
"                       will be displayed.
"                     o The <Leader>mbe mapping now highlights the buffer from
"                       the current window.
"                     o The delete ('d') binding in the MBE window now restors
"                       the cursor position, which can help if you want to 
"                       delete several buffers in a row that are not at the
"                       beginning of the buffer list.
"                     o Added a new key binding ('p') in the MBE window to 
"                       switch to the previous window (last edit window)
"               6.2.0 o Major overhaul of autocommand and list updating code,
"                       we now have much better handling of :bd (which is the 
"                       most requested feature.) As well as resolving other
"                       issues where the buffer list would not be updated
"                       automatically. The old version tried to trap specific
"                       events, this one just updates frequently, but it keeps
"                       track and only changes the screen if there has been
"                       a change.
"                     o Added g:miniBufExplMaxHeight variable so you can keep
"                       the -MiniBufExplorer- window small when you have lots
"                       of buffers (or buffers with long names :)
"                       NOTE: in 6.3.0 we started using MaxSize instead of
"                       MaxHeight. This will still work if MaxSize is not
"                       specified, but it is depreciated. Use MaxSize instead.
"                     o Improvement to internal syntax highlighting code
"                       I renamed the syntax group names. Anyone who has 
"                       figured out how to use them already shouldn't have
"                       any trouble with the new Nameing :)
"                     o Added debug mode 3 which writes to a global variable
"                       this is fast and doesn't mess with the buffer/window
"                       lists.
"               6.1.0 o <Leader>mbc was failing because I was calling one of
"                       my own functions with the wrong number of args. :(
"                       Thanks to Gerry Patterson for finding this!
"                       This code is very stable (although it has some
"                       idiocyncracies.)
"               6.0.9 o Double clicking tabs was overwriting the cliboard 
"                       register on MS Windows.  Thanks to Shoeb Bhinderwala 
"                       for reporting this issue.
"               6.0.8 o Apparently some VIM builds are having a hard time with
"                       line continuation in scripts so the few that were here
"                       have been removed.
"                     o Generalized FindExplorer and FindCreateExplorer so
"                       that they can be used for the debug window. Renaming
"                       to FindWindow and FindCreateWindow.
"                     o Updated debugging code so that debug output is put into
"                       a buffer which can then be written to disk or emailed
"                       to me when someone is having a major issue. Can also
"                       write directly to a file (VERY SLOWLY) on UNIX or Win32
"                       (not 95 or 98 at the moment) or use VIM's echo function 
"                       to display the output to the screen.
"                     o Several people have had issues when the hidden option 
"                       is turned on. So I have put in several checks to make
"                       sure folks know this if they try to use MBE with this
"                       option set.
"               6.0.7 o Handling BufDelete autocmd so that the UI updates 
"                       properly when using :bd (rather than going through 
"                       the MBE UI.)
"                     o The AutoUpdate code will now close the MBE window when 
"                       there is a single eligible buffer available.
"                       This has the usefull side effect of stopping the MBE
"                       window from blocking the VIM session open when you close 
"                       the last buffer.
"                     o Added functions, commands and maps to close & update
"                       the MBE window (<leader>mbc and <leader>mbu.)
"                     o Made MBE open/close state be sticky if set through
"                       StartExplorer(1) or StopExplorer(1), which are 
"                       called from the standard mappings. So if you close
"                       the mbe window with \mbc it won't be automatically 
"                       opened again unless you do a \mbe (or restart VIM).
"                     o Removed spaces between "tabs" (even more mini :)
"                     o Simplified MBE tab processing 
"               6.0.6 o Fixed register overwrite bug found by S閎astien Pierre
"               6.0.5 o Fixed an issue with window sizing when we run out of 
"                       buffers.  
"                     o Fixed some weird commenting bugs.  
"                     o Added more optional fancy window/buffer navigation:
"                     o You can turn on the capability to use control and the 
"                       arrow keys to move between windows.
"                     o You can turn on the ability to use <C-TAB> and 
"                       <C-S-TAB> to open the next and previous (respectively) 
"                       buffer in the current window.
"                     o You can turn on the ability to use <C-TAB> and 
"                       <C-S-TAB> to switch windows (forward and backwards 
"                       respectively.)
"               6.0.4 o Added optional fancy window navigation: 
"                     o Holding down control and pressing a vim direction 
"                       [hjkl] will switch windows in the indicated direction.
"               6.0.3 o Changed buffer name to -MiniBufExplorer- to resolve
"                       Issue in filename pattern matching on Windows.
"               6.0.2 o 2 Changes requested by Suresh Govindachar:
"                     o Added SplitToEdge option and set it on by default
"                     o Added tab and shift-tab mappings in [MBE] window
"               6.0.1 o Added MoreThanOne option and set it on by default
"                       MiniBufExplorer will not automatically open until
"                       more than one eligible buffers are opened. This
"                       reduces cluter when you are only working on a
"                       single file. 
"                       NOTE: See change log for 6.2.2 for more details about 
"                             this feature
"               6.0.0 o Initial Release on November 20, 2001
"
"=============================================================================
" }}}
" vim:ft=vim:fdm=marker:ff=unix:nowrap:tabstop=4:shiftwidth=4:softtabstop=4:smarttab:shiftround:expandtab
