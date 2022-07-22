"{{{
call plug#begin('E:/Neovim/nvim/plugged')
" 主题
Plug 'EdenEast/nightfox.nvim'
" 注释
Plug 'tpope/vim-commentary'
" 补全
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" 文件
" Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'kristijanhusak/defx-git', {'on':'Defx'}
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins'}
Plug 'kristijanhusak/defx-icons'
"图标"
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
" 代码运行
Plug 'CRAG666/code_runner.nvim' 
Plug 'nvim-lua/plenary.nvim'
"缩进线
Plug 'lukas-reineke/indent-blankline.nvim'
"彩虹括号
Plug 'luochen1990/rainbow'
" 合体插件
Plug 'echasnovski/mini.nvim', { 'branch': 'stable' }
call plug#end()
"}}}
"{{{
"主题
colorscheme nightfox
"不显示状态栏
" set laststatus=0
"禁止警告
let g:VM_show_warnings = 0
"解释器路径
let g:python3_host_prog = 'E:\Python310\python.exe'
"是否报错响铃及行为"
set errorbells
set visualbell
"文件和路径名可用的字符
"文本格式化方式
set formatoptions+=1
set formatoptions-=t
set formatoptions-=o
"关闭兼容模式
set nocompatible
"检测到的文件类型
filetype plugin indent on
filetype plugin on
"开启语法高亮显示
set syntax=on
" Mouse
set mouse=nv
"不保存缓存文件
set nobackup
set nowritebackup
set noundofile
set noswapfile
" Show number
set number
set relativenumber
"Tab
set smarttab
set tabstop=4
set shiftwidth=4
set expandtab
"Neovide
if exists("g:neovide")
    " Put anything you want to happen only in Neovide here
    let g:neovide_transparency=0.8
    set guifont=MesloLGLDZ\ NF:h14
endif
" }}}
"{{{
"mapleader键为空格
let mapleader=" "
"撤销
nnoremap <c-z> :u<CR>      " Avoid using this**
inoremap <c-z> <c-o>:u<CR>
"移动一个单位
noremap w k
noremap s j
noremap a h
noremap d l
"移动五个单位
noremap W 5k
noremap S 5j
noremap A 5h
noremap D 5l
"进入编辑模式
"在前
noremap e i
"在后
noremap r a
"在首
noremap E I
"在尾
noremap R A
"前进
noremap h w
"删除这一行
noremap c d
"剪切
noremap j c
"替换
noremap m r
"进入命令行
noremap ; :
"退出编辑模式
inoremap jj <esc>
"保存
map <C-s> :w<CR>
"退出
map <C-q> :q<CR>
"写入退出
map Q :wq<CR>
"退出全部
map <A-q> :qa<CR>
"垂直分屏
map <LEADER>+ :vsplit<CR>
"水平分屏
map <LEADER>- :split<CR>
"光标在右边
map <A-d> <C-w>l
"光标在上边
map <A-w> <C-w>k
"光标在在左边
map <A-a> <C-w>h
"光标在下边
map <A-s> <C-w>j
"窗口创建
noremap tn :tabe<CR>
"窗口切换
nmap <leader>1 :bn<CR>
nmap <leader>2 :bp<CR>
"vim内置检察器
map <LEADER>sc :set spell!<CR>
"可视模式下的复制
vnoremap <C-c> "+y
vnoremap <C-v> "+p
" Use <Tab> and <S-Tab> to navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" 打开文件管理器
nnoremap <leader>v <cmd>CHADopen<cr>
"}}}

