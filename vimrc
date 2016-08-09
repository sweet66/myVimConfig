set nocompatible      " 关闭 vi 兼容模式
filetype on       "检测文件的类型           

set nu  "设置行号
set tabstop=4  " Tab大小
set shiftwidth=4 " 缩进大小
set nobackup  "覆盖文件时不备份
"set cursorline "为光标所在行加下划线
set ruler  "标尺
set autoindent   " 设置自动对齐(缩进)：即每行的缩进值与上一行相等；使用 noautoindent 取消设置
set ignorecase        " 搜索模式里忽略大小写
set smartcase        " 如果搜索模式包含大写字符，不使用 'ignorecase' 选项。
set noerrorbells            " 关闭错误信息响铃"
set smartindent             " 开启新行时使用智能自动缩进"
syntax on  " 语法高亮
runtime macros/matchit.vim  "html标签开始结束切换

"set foldmethod=indent      " 开启折叠
"au BufWinLeave * silent mkview  " 保存文件的折叠状态
"au BufRead * silent loadview    " 恢复文件的折叠状态
"nnoremap <space> za             " 用空格来切换折叠状态

"https://github.com/VundleVim/Vundle.vim.git
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"所有的插件管理必须被添加在以上这行之后

" Plugins
Plugin 'VundleVim/Vundle.vim'
"项目树
Plugin 'scrooloose/nerdtree'
"折叠
Plugin 'tmhedberg/SimpylFold'
"自动补全
Plugin 'Valloric/YouCompleteMe'
"括号补全
Plugin 'Raimondi/delimitMate'
"自动格式化
Plugin 'Chiel92/vim-autoformat'
"注释插件
Plugin 'scrooloose/nerdcommenter'  " commenter: \cc \cu
"这个插件可以在项目树中显示文件的Git增删状态
Plugin 'Xuyuanp/nerdtree-git-plugin'
"共享项目树
Plugin 'jistr/vim-nerdtree-tabs'
"全局搜索
Plugin 'kien/ctrlp.vim'   " 快捷键c-p
"状态栏
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
"Emment
Plugin 'mattn/emmet-vim'
"CSS语法高亮
Plugin 'hail2u/vim-css3-syntax' 
"LESS支持
Plugin 'groenewege/vim-less'
"JavaScript 语法高亮
Plugin 'pangloss/vim-javascript'
"javaScript 明显显示缩进范围
Plugin 'nathanaelkane/vim-indent-guides'
"更强大的JavaScript omnifunc来支持YCM自动补全
Plugin 'marijnh/tern_for_vim'
"语法检测
"它像YCM一样，通过调用外部Linter来完成代码风格检查。所以你还需要安装一个外部工具：jshint 'npm install -g jshint'
Plugin 'scrooloose/syntastic'


" 所有的插件必须被添加在以下这行之前
call vundle#end()            " required
filetype plugin indent on    " required


"保存会话快捷键
map <f7> <esc>:mksession! ~/.mysession.vim<cr>:wqa<cr>  

"自动格式化快捷键
noremap <F3> :Autoformat<CR>

"支持高亮写在JavaScript中的CSS和HTML
let javascript_enable_domhtmlcss = 1

"Emmen config
"重新设置注释快捷键为c-/
autocmd filetype *html* imap <c-_> <c-y>/  
autocmd filetype *html* map <c-_> <c-y>/
"Emmet 中有用的快捷键还有：
"<c-y>n：到下一个编辑点
"<c-y>N：到上一个编辑点
"<c-y>d：选中整个标签
"<c-y>D：选中整个标签的内容
"<c-y>k：删除当前标签

"设置YCM支持CSS和HTML补全
"在以四空格起始的行，以及冒号后+空格的情况出现时，会触发自动补全。另外，当HTML关闭标签时，也可以触发一下自动补全
let g:ycm_semantic_triggers = {
    \   'css': [ 're!^\s{4}', 're!:\s+'],
    \   'html': [ '</' ],
    \ }

" NERDTree config
" Ctrl+k 打开/关闭
map <C-k> :NERDTreeToggle<CR> 
" 当不带参数打开Vim时自动加载项目树
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" 当所有文件关闭时关闭项目树窗格
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" 不显示这些文件
let NERDTreeIgnore=['\.swp$', '\~$'] "ignore files in NERDTree
" 不显示项目树上额外的信息，例如帮助、提示什么的
let NERDTreeMinimalUI=1
" 显示书签列表
let NERDTreeShowBookmarks=1
" 在终端启动vim时，共享NERDTree
"let g:nerdtree_tabs_open_on_console_startup=1


" ctrlp config
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip     
let g:ctrlp_custom_ignore = {'dir':  '\v[\/]\.(git|hg|svn)$', 'file': '\v\.(exe|so|dll)$'}


" 状态栏 config
set guifont=Inconsolata\ for\ Powerline:h15
"let g:Powerline_symbols = 'fancy'
let g:Powerline_symbols = 'unicode'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
set laststatus=2   " Always show the statusline"
