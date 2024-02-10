require('code_runner').setup({
    mode = "float",
    float = {
        -- Window border (see ':h nvim_open_win')
        -- 有圆角
        -- border = "rounded",
        -- 单线
        -- border = "single",
        -- 双线
        border = "double",
        -- 空白
        -- border = "solid",
        -- 有阴影
        -- border = "shadow",
        -- Num from `0 - 1` for measurements
        height = 0.5,
        width = 1,
        x = 0.5,
        y = 1,
        -- Highlight group for floating window/border (see ':h winhl')
        border_hl = "FloatBorder",
        float_hl = "Normal",
        -- Transparency (see ':h winblend')
        blend = 0,
    },
    filetype_path = vim.fn.stdpath("data") .. "/code_runner.json"
})
vim.keymap.set('n', '<leader>r', ':RunCode<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rf', ':RunFile<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rft', ':RunFile tab<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rp', ':RunProject<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rc', ':RunClose<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>crf', ':CRFiletype<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>crp', ':CRProjects<CR>', { noremap = true, silent = false })
