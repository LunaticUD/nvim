" 贴上本人的配置
    let g:VM_theme                      = 'ocean'
    let g:VM_highlight_matches          = 'underline'
    let g:VM_maps                       = {}
    let g:VM_maps['Find Under']         = '<C-n>'
    let g:VM_maps['Find Subword Under'] = '<C-n>'
    let g:VM_maps['Select All']         = '<C-d>'
    let g:VM_maps['Select h']           = '<C-Left>'
    let g:VM_maps['Select l']           = '<C-Right>'
    let g:VM_maps['Add Cursor Up']      = '<C-Up>'
    let g:VM_maps['Add Cursor Down']    = '<C-Down>'
    let g:VM_maps['Add Cursor At Pos']  = '<C-x>'
    let g:VM_maps['Add Cursor At Word'] = '<C-a>'
    let g:VM_maps['Remove Region']      = 'q'

" 从上至下的意义:
    " ['Find Under']          -> 选中光标下的词(ctrl+n继续向下选中相同文本)
    " ['Find Subword Under']  -> 选中光标下的词(ctrl+n继续向下选中相同文本)
    " ['Select All']          -> 选中文件中所有光标下的词
    " ['Select h']            -> 从光标往左选中文本(ctrl+n继续向下选中相同文本)
    " ['Select l']            -> 从光标往右选中文本(ctrl+n继续向下选中相同文本)
    " ['Add Cursor Up']       -> 向上添加一个光标(原光标+上光标 继续使用则继续添加)
    " ['Add Cursor Down']     -> 向下添加一个光标(原光标+下光标 继续使用则继续添加)
    " ['Add Cursor At Pos']   -> 将当前光标添加入多光标列表中
    " ['Add Cursor At Word']  -> 将当前光标所在词的词首加上多光标列表中
    " ['Remove Region']       -> 


