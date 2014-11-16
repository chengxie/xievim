set background=dark
hi clear

if exists("syntax_on")
		syntax reset
endif

hi Normal guibg=#111111 guifg=#d0d0d0 gui=none ctermfg=252 ctermbg=233 cterm=none
hi Cursor guibg=#e7e7e7 guifg=#000000 gui=bold ctermfg=16 ctermbg=254 cterm=bold
hi FoldColumn guibg=#3d3d3d guifg=fg gui=none ctermfg=252 ctermbg=237 cterm=none
hi Folded guibg=#525252 guifg=fg gui=none ctermfg=252 ctermbg=239 cterm=none
hi LineNr guibg=#292929 guifg=#a7a7a7 gui=none ctermfg=248 ctermbg=235 cterm=none
hi NonText guifg=#878787 gui=bold ctermfg=102 ctermbg=233 cterm=bold
hi SignColumn guibg=#3d3d3d guifg=fg gui=none ctermfg=252 ctermbg=237 cterm=none
hi StatusLine guibg=fg guifg=#000000 gui=bold ctermfg=16 ctermbg=252 cterm=bold
hi StatusLineNC guibg=#878787 guifg=#000000 gui=bold ctermbg=252 ctermfg=243
hi VertSplit guibg=#878787 guifg=#000000 gui=bold ctermfg=16 ctermbg=102 cterm=bold
hi Visual guibg=#ababab guifg=#000000 gui=bold ctermfg=16 ctermbg=248 cterm=bold
hi VisualNOS guibg=bg guifg=#ababab gui=bold,underline ctermfg=248 ctermbg=233 cterm=bold,underline
hi WildMenu guibg=#a0a0a0 guifg=#000000 gui=bold ctermfg=16 ctermbg=247 cterm=bold

hi Directory guibg=bg guifg=#1e90ff gui=none ctermfg=33 ctermbg=233 cterm=none
hi ErrorMsg guibg=#ee2c2c guifg=#ffffff gui=bold ctermfg=231 ctermbg=196 cterm=bold
hi DiffAdd guibg=#008b00 guifg=fg gui=none ctermfg=252 ctermbg=28 cterm=none
hi DiffChange guibg=#00008b guifg=fg gui=none ctermfg=252 ctermbg=18 cterm=none
hi DiffDelete guibg=#8b0000 guifg=fg gui=none ctermfg=252 ctermbg=88 cterm=none
hi DiffText guibg=#00008b guifg=fg gui=bold ctermfg=252 ctermbg=18 cterm=bold
hi IncSearch guibg=#e7e7e7 guifg=#000000 gui=bold ctermfg=16 ctermbg=254 cterm=bold
hi ModeMsg guibg=bg guifg=fg gui=bold ctermfg=252 ctermbg=233 cterm=bold
hi MoreMsg guibg=bg guifg=#d0d097 gui=bold ctermfg=187 ctermbg=233 cterm=bold
hi Question guibg=bg guifg=#e0c07e gui=bold ctermfg=180 ctermbg=233 cterm=bold
hi Search guibg=#bbbb87 guifg=#000000 gui=bold ctermfg=16 ctermbg=144 cterm=bold
hi SpecialKey guibg=bg guifg=#a28b5b gui=none ctermfg=137 ctermbg=233 cterm=none
hi Title guibg=bg guifg=#e7e7e7 gui=bold ctermfg=254 ctermbg=233 cterm=bold
hi WarningMsg guibg=bg guifg=#ee2c2c gui=bold ctermfg=196 ctermbg=233 cterm=bold

hi Comment guibg=bg guifg=#bbbb87 gui=none ctermfg=156 ctermbg=233 cterm=none
hi Constant guibg=bg guifg=#8fe779 gui=none ctermfg=144 ctermbg=233 cterm=none
hi Error guibg=bg guifg=#ee2c2c gui=none ctermfg=196 ctermbg=233 cterm=none
hi Identifier guibg=bg guifg=#7ee0ce gui=none ctermfg=116 ctermbg=233 cterm=none
hi Ignore guibg=bg guifg=#373737 gui=none ctermfg=237 ctermbg=233 cterm=none
hi lCursor guibg=fg guifg=bg gui=bold
hi PreProc guibg=bg guifg=#d7a0d7 gui=none ctermfg=182 ctermbg=233 cterm=none
hi Special guibg=bg guifg=#e0c07e gui=none ctermfg=180 ctermbg=233 cterm=none
hi Statement guibg=bg guifg=#7ec0ee gui=none ctermfg=117 ctermbg=233 cterm=none
hi Todo guibg=bg guifg=#bbbb87 gui=bold,underline ctermfg=144 ctermbg=233 cterm=bold,underline
hi Type guibg=bg guifg=#f09479 gui=none ctermfg=216 ctermbg=233 cterm=none
hi Underlined guibg=bg guifg=#1e90ff gui=underline ctermfg=33 ctermbg=233 cterm=underline

hi htmlBold guibg=bg guifg=fg gui=bold
hi htmlItalic guibg=bg guifg=fg gui=italic
hi htmlUnderline guibg=bg guifg=fg gui=underline
hi htmlBoldItalic guibg=bg guifg=fg gui=bold,italic
hi htmlBoldUnderline guibg=bg guifg=fg gui=bold,underline
hi htmlBoldUnderlineItalic guibg=bg guifg=fg gui=bold,underline,italic
hi htmlUnderlineItalic guibg=bg guifg=fg gui=underline,italic

hi Pmenu ctermfg=204 ctermbg=237 cterm=none
hi pmenuSel ctermfg=51 ctermbg=16 cterm=none
hi MatchParen ctermfg=152 ctermbg=240

