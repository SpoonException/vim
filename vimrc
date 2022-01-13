set nocompatible              	" 去除对vi的兼容
filetype off                  	" 关闭文件类型检测

set number 		      	" 设置行号

" 设置包括vundle和初始化相关的runtime path

set rtp+=~/.vim/bundle/Vundle.vim	" 设置vundle路径
call vundle#begin()		" 插件管理函数开始 

" 在此添加需要安装的插件列表，格式 Plugin 'git用户/git仓库' 或者 Plugin '协议://git url'
" 例如:
" Plugin 'https://github.com/davidhalter/jedi-vim.git'
Plugin 'VundleVim/Vundle.vim' 	" 插件管理
Plugin 'tpope/vim-fugitive'     " git
Plugin 'rizzatti/dash.vim'      " Dash
Plugin 'kien/ctrlp.vim'         " 文件搜索

" markdown 写作
Plugin 'godlygeek/tabular'  " md 基础支撑
Plugin 'plasticboy/vim-markdown' " md格式
" Arduino
Plugin 'stevearc/vim-arduino'

Plugin 'preservim/nerdtree'	" 目录树
Plugin 'ycm-core/YouCompleteMe'	" 自动补全
Plugin 'flazz/vim-colorschemes' " 颜色方案
Plugin 'ap/vim-css-color'		" 颜色方案
"Plugin 'iamcco/markdown-preview.nvim'	" markdown预览
"Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'suan/vim-instant-markdown'    " markdown预览 

Plugin 'iamcco/mathjax-support-for-mkdp'	" markdown 数学公式
Plugin 'bling/vim-airline'  " 强大的状态栏

" 中文排版插件
Plugin 'hotoo/pangu.vim'

" 代码格式化工具
Plugin 'Chiel92/vim-autoformat'

Plugin 'dense-analysis/ale'   " 代码检查工具

Plugin 'tell-k/vim-autopep8'
Plugin 'sillybun/autoformatpythonstatement' " python 代码格式化 
Plugin 'sillybun/setbreakpoints_python' " ipdb设置断点
Plugin 'sillybun/vim-repl'
Plugin 'nvie/vim-flake8'    " python格式化

Plugin 'preservim/nerdcommenter'    " 代码注释
Plugin 'jiangmiao/auto-pairs'   " 自动匹配括号
Plugin 'tpope/vim-surround' "自动匹配成对符号
Plugin 'mattn/emmet-vim'   " html编辑神器
Plugin 'gregsexton/MatchTag'    "html标签匹配
Plugin 'SirVer/ultisnips'   " 代码片段
Plugin 'honza/vim-snippets'   " 代码片段
Plugin 'amiorin/vim-project'   " 代码片段
Plugin 'Yggdroot/indentLine'    "对齐线

"Plugin 'donaldducky/related.vim' "相关文件

" 你的所有插件需要在下面这行之前，必须
call vundle#end()            	" 插件管理函数结束

filetype plugin indent on    " 打开“检测”，“插件”和“缩进”

syntax on " 自动语法高亮
set number " 显示行号
set cursorline " 突出显示当前行
" set ruler " 打开状态栏标尺
set shiftwidth=4 " 设定 << 和 >> 命令移动时的宽度为 4
set tabstop=4 expandtab " 设定 tab 长度为 4 个空格
set nobackup " 覆盖文件时不备份
" set autochdir " 自动切换当前目录为当前文件所在的目录
set backupcopy=yes " 设置备份时的行为为覆盖
set ignorecase smartcase " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
"set nowrapscan " 禁止在搜索到文件两端时重新搜索
" set incsearch " 输入搜索内容时就显示搜索结果
set hlsearch " 搜索时高亮显示被找到的文本
set noerrorbells " 关闭错误信息响铃
set novisualbell " 关闭使用可视响铃代替呼叫
set t_vb= " 置空错误铃声的终端代码
set magic " 设置魔术
set hidden " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set guioptions-=T " 隐藏工具栏
set guioptions-=m " 隐藏菜单栏
set smartindent " 开启新行时使用智能自动缩进
set backspace=indent,eol,start " 不设定在插入状态无法用退格键和 Delete 键删除回车符
set cmdheight=1 " 设定命令行的行数为 1
set laststatus=2 " 显示状态栏 (默认值为 1, 无法显示状态栏)
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\ " 设置在状态行显示的信息
set errorformat=%m\ in\ %f\ on\ line\ %l
set autoindent
set softtabstop=4 " 使得按退格键时可以一次删掉 4 个空格
set shell=/bin/zsh\ -l
autocmd Filetype python set foldmethod=indent   " ptyhon 缩进
autocmd Filetype python set foldlevel=99        " pythom 折叠
" 通过空格键快速打开和关闭折叠
nnoremap <space> za

au BufNewFile,BufRead *.py
            \ set tabstop=4 |
            \ set softtabstop=4 |
            \ set shiftwidth=4 |
            \ set textwidth=79 |
            \ set expandtab |
            \ set autoindent |
            \ set fileformat=unix |

" 主题颜色设置
colorscheme molokai
set t_Co=256

"-----------------------------------------------------------------
" 获取当前系统类型
"------------------------------------------------------------------
function! MySys()
    if has("win16") || has("win32") || has("win64") || has("win95")
        return "windows"
    elseif has("unix")
        return "linux"
    endif
endfunction

" 用户目录变量$VIMFILES
if MySys() == "windows"
    let $VIMFILES = $VIM.'/vimfiles'
    set backupdir=D://Vim/tmp
elseif MySys() == "linux"
    let $VIMFILES = $HOME.'/.vim'
    set backupdir=/tmp
endif

" 设置字体以及中文支持
if has("win32")
    set guifont=Inconsolata:h12:cANSI
endif

" 配置多语言环境
if has("multi_byte")
    " UTF-8 编码
    set encoding=utf-8
    set termencoding=utf-8
    set formatoptions+=mM
    set fencs=utf-8,gbk

    if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
        set ambiwidth=double
    endif

    if has("win32")
        source $VIMRUNTIME/delmenu.vim
        source $VIMRUNTIME/menu.vim
        language messages zh_CN.utf-8
    endif
else
    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif

" NERDTree config
map <F4> :NERDTreeToggle<CR>  " F4一键开关目录树
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTree<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR> 
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif  
" 当目录树窗口为最后一个窗口时自动退出vim
autocmd BufEnter * if 0 == len(filter(range(1, winnr('$')), 'empty(getbufvar(winbufnr(v:val), "&bt"))')) | qa! | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" jump to the last position when reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" 光标到上方窗口,需要<c-w>k,非常麻烦,现在重映射为<c-k>
nnoremap <C-w> <C-w>w
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" markdown 预览
let g:instant_markdown_autostart = 0
" markdown 预览快捷键
nmap <silent> <F8> :InstantMarkdownPreview <CR>        " 普通模式
imap <silent> <F8> <ESC> :InstantMarkdownPreview <CR>        " 插入模式
nmap <silent> <F9> :InstantMarkdownStop <CR>   " 普通模式
imap <silent> <F9> <ESC> :InstantMarkdownStop <CR>   " 插入模式

"高亮数学公式
let g:vim_markdown_math = 1

" 对以下格式文档开启自动规范化功能
autocmd BufWritePre *.markdown,*.md,*.text,*.txt,*.wiki,*.cnx call PanGuSpacing()

" 保存没有权限的文件
cmap w!! w !sudo tee % > /dev/null

" 新建 sh 和 python 文件自动加首行
autocmd BufNewFile *.sh,*.py exec ":call AutoSetFileHead()"
function! AutoSetFileHead()
    " .sh "
    if &filetype == 'sh'
        call setline(1, "#!/bin/bash")
    endif                                                                                                                                                  

    " python "     
    if &filetype == 'python'
        call setline(1, "#!/usr/bin/env python")
        call append(1, "# encoding: utf-8")
    endif

    normal G
    normal o
    normal o
endfunc

" 执行代码
noremap <S-r> :call CompileRunGcc()<CR><CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!clear"
        exec "!time python3 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
        " exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
    endif
endfunc

" autoformat 配置
nnoremap <F7> :Autoformat<CR>
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
au BufWrite * :Autoformat

" ale 代码检查工具
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1

" 自动格式化代码
autocmd FileType python let g:autoformatpython_enabled = 1

" ALE 自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

" 全选复制导剪贴板
"nmap <F9> gg<Shift-V>G<Shift-'><Shift-+>y        " 普通模式
vnoremap <C-S-c> "+y

" markdown 折叠
let g:vim_markdown_folding_disabled = 1
"set nofoldenable
nnoremap <space> za
vnoremap <space> zf

" ipdb 设置断点
autocmd FileType python nnoremap <F12> :call ToggleBreakPoint()<Cr>

" emmet
let g:user_emmet_expandabbr_key = '<C-E>'  
" YCM
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string 
" django 模版
let b:surround_{char2nr("v")} = "{{ \1:\1 }}\r"
let b:surround_{char2nr("{")} = "{{ \1:\1 }}\r"
let b:surround_{char2nr("%")} = "{% \1:\1 %}\r"
let b:surround_{char2nr("b")} = "{% block \1block name: \1 %}\r{% endblock \1\1 %}"
let b:surround_{char2nr("i")} = "{% if \1condition: \1 %}\r{% endif %}"
let b:surround_{char2nr("w")} = "{% with \1with: \1 %}\r{% endwith %}"
let b:surround_{char2nr("f")} = "{% for \1for loop: \1 %}\r{% endfor %}"
let b:surround_{char2nr("c")} = "{% comment %}\r{% endcomment %}"
let b:surround_{char2nr("e")} = "{% autoescape off %}\r{% endautoescape %}"
let b:surround_{char2nr("s")} = "{% spaceless %}\r{% endspaceless %}"
" Ultisnips
let g:UltiSnipsExpandTrigger       = "<S-j>"
let g:UltiSnipsJumpForwardTrigger  = "<S-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-p>"
let g:UltiSnipsListSnippets        = "<c-k>" "List possible snippets based on current file
" mapping
let g:last_relative_dir = ''
nnoremap \1 :call RelatedFile ("models.py")<cr>
nnoremap \2 :call RelatedFile ("views.py")<cr>
nnoremap \3 :call RelatedFile ("urls.py")<cr>
nnoremap \4 :call RelatedFile ("admin.py")<cr>
nnoremap \5 :call RelatedFile ("tests.py")<cr>
nnoremap \6 :call RelatedFile ( "templates/" )<cr>
nnoremap \7 :call RelatedFile ( "templatetags/" )<cr>
nnoremap \8 :call RelatedFile ( "management/" )<cr>
nnoremap \0 :e settings.py<cr>
nnoremap \9 :e urls.py<cr>

fun! SetAppDir()
    if filereadable(expand("%:h"). '/models.py') || isdirectory(expand("%:h") . "/templatetags/")
        let g:last_relative_dir = expand("%:h") . '/'
        return ''
    endif
endfun
autocmd BufEnter *.py call SetAppDir()

fun! LoadDjangoMapping() "{{{2
    let g:last_relative_dir = ''
    nnoremap \2 :call RelatedFile ("views.py")<cr>
    nnoremap \3 :call RelatedFile ("urls.py")<cr>
    nnoremap \4 :call RelatedFile ("admin.py")<cr>
    nnoremap \5 :call RelatedFile ("tests.py")<cr>
    nnoremap \6 :call RelatedFile ( "templates/" )<cr>
    nnoremap \7 :call RelatedFile ( "templatetags/" )<cr>
    nnoremap \8 :call RelatedFile ( "management/" )<cr>
    nnoremap \0 :e settings.py<cr>
    nnoremap \9 :e urls.py<cr>

  endfun

  fun! RelatedFile(file)
    "This is to check that the directory looks djangoish
    if filereadable(expand("%:h"). '/models.py') || isdirectory(expand("%:h") . "/templatetags/")
      exec "edit %:h/" . a:file
      let g:last_relative_dir = expand("%:h") . '/'
      return ''
    else
      let g:last_relative_dir = ''
    endif

    if g:last_relative_dir != ''
      exec "edit " . g:last_relative_dir . a:file
      return ''
    endif

    echo "Cant determine where relative files is :" . a:file
    return ''
  endfun

  "}}}2

map <S-k> <Esc>gg=G<C-o>
" F2显示语法错误
" autocmd FileType python map <buffer> <F2> :call Flake8()<CR>
" 保存文件的时候显示错误
"autocmd BufWritePost *.py call flake8#Flake8()
" 是否显示标记
let g:flake8_show_in_file=0
let g:flake8_show_in_gutter=0
let g:flake8_maps=1
"let g:flake8_error_marker='EE'     " set error marker to 'EE'
"let g:flake8_warning_marker=''   " set warning marker to 'WW'
"let g:flake8_pyflake_marker=''     " disable PyFlakes warnings
"let g:flake8_complexity_marker=''  " disable McCabe complexity warnings
"let g:flake8_naming_marker=''      " disable naming warnings``
" 打开粘帖模式
set pastetoggle=<F3>

" repel
let g:repl_program = {
            \   'python': 'ipython',
            \   'default': 'zsh',
            \   'r': 'R',
            \   'lua': 'lua',
            \   'python-debug': 'python3 -m ipdb',
            \   }
let g:repl_predefine_python = {
            \   'numpy': 'import numpy as np',
            \   'matplotlib': 'from matplotlib import pyplot as plt'
            \   }
let g:repl_cursor_down = 1
let g:repl_python_automerge = 1
let g:repl_ipython_version = '7'
nnoremap <leader>r :REPLToggle<Cr>
autocmd Filetype python nnoremap <F9> <Esc>:REPLDebugStopAtCurrentLine<Cr>
autocmd Filetype python nnoremap <F10> <Esc>:REPLPDBN<Cr>
autocmd Filetype python nnoremap <F11> <Esc>:REPLPDBS<Cr>
let g:repl_position = 3
tnoremap <C-h> <C-w><C-h>
tnoremap <C-j> <C-w><C-j>
tnoremap <C-k> <C-w><C-k>
tnoremap <C-l> <C-w><C-l>
" Arduino
nnoremap <buffer> <leader>am :ArduinoVerify<CR>
nnoremap <buffer> <leader>au :ArduinoUpload<CR>
nnoremap <buffer> <leader>ad :ArduinoUploadAndSerial<CR>
nnoremap <buffer> <leader>ab :ArduinoChooseBoard<CR>
nnoremap <buffer> <leader>ap :ArduinoChooseProgrammer<CR>

" edit my .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" source my .vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>
" add " to word
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
" add ' to word
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
" map jk to <ESC>
inoremap jk <esc>
" map <ESC> to nop
"inoremap <esc> <nop>
" map <arrow> to nop
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>
vnoremap <Up> <nop>
vnoremap <Down> <nop>
vnoremap <Left> <nop>
vnoremap <Right> <nop>
