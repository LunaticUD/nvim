nnoremap <silent> <LEADER>e :RnvimrToggle<CR>
tnoremap <silent> <LEADER>e <C-\><C-n>:RnvimrToggle<CR>
let g:rnvimr_ranger_cmd = ['ranger', '--cmd=set draw_borders both']
let g:rnvimr_layout = {
           \ 'relative': 'editor',
           \ 'width': &columns,
           \ 'height': &lines - 2,
           \ 'col': 0,
           \ 'row': 0,
           \ 'style': 'minimal'
           \ }
