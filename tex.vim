" LaTeX 语法风格
let g:tex_flavor = 'latex'
" 自动弹出错误,命令 :copen 来手动打开错误窗口
let g:vimtex_quickfix_mode = 0
" settings for sumatraPDF
let g:vimtex_view_general_viewer = 'SumatraPDF'
let g:vimtex_view_general_options
     \ = '-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_compiler_latexmk_engines = {
            \ '_'          : '-xelatex'
            \}
"let g:vimtex_view_general_options_latexmk = '-reuse-instance'
"vimtex 的文章目录 TOC :VimtexTocToggle
let g:vimtex_toc_config = {
\ 'name' : 'TOC',
\ 'layers' : ['content', 'todo', 'include'],
\ 'split_width' : 25,
\ 'todo_sorted' : 0,
\ 'show_help' : 1,
\ 'show_numbers' : 1,
\}