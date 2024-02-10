local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

require("luasnip/loaders/from_vscode").load()

local cmp = require("cmp")
local lspkind = require('lspkind')

local cmpFormat3 = function(entry, vim_item)
 -- fancy icons and a name of kind
 vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. ""..vim_item.kind
 -- set a name for each source
 vim_item.menu =
 ({
 buffer = "[BUF]",
 nvim_lsp = "[LSP]",
 ultisnips = "[USP]",
 nvim_lua = "[Lua]",
 cmp_tabnine = "[TabNine]",
 look = "[Look]",
 path = "[Path]",
 spell = "[Spell]",
 calc = "[Calc]",
 emoji = "[Emoji]"
 })[entry.source.name]
 return vim_item
end

cmp.setup({
snippet = {
    expand = function(args)
      -- 以下插件作为前提：
      -- { 'L3MON4D3/LuaSnip' },
      -- { 'saadparwaiz1/cmp_luasnip' },
      require('luasnip').lsp_expand(args.body)
    end,
  },
    mapping = cmp.mapping.preset.insert({
        -- Use <C-b/f> to scroll the docs
        ['<C-b>'] = cmp.mapping.scroll_docs( -4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        -- Use <C-k/j> to switch in items
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-j>'] = cmp.mapping.select_next_item(),
        -- Use <CR>(Enter) to confirm selection
        -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<CR>'] = cmp.mapping.confirm({ select = true }),

        -- A super tab
        -- sourc: https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip
        ["<Tab>"] = cmp.mapping(function(fallback)
            -- Hint: if the completion menu is visible select next one
            if cmp.visible() then
                cmp.select_next_item()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }), -- i - insert mode; s - select mode
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable( -1) then
                luasnip.jump( -1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),

    formatting = {
        format = cmpFormat3
        -- format = lspkind.cmp_format({
        --     maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
        --                    -- can also be a function to dynamically calculate max width such as 
        --                    -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
        --     ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
        --     show_labelDetails = true, -- show labelDetails in menu. Disabled by default
        --     -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
        --     mode = "symbol_text",
        --     menu = ({
        --         buffer = "[BUF]",
        --         nvim_lsp = "[LSP]",
        --         luasnip = "[LS]",
        --         nvim_lua = "[Lua]",
        --         latex_symbols = "[TEX]",
    -- }),
        -- -- default: {}
        --     symbol_map = {
        --       Text = "󰉿",
        --       Method = "󰆧",
        --       Function = "󰊕",
        --       Constructor = "",
        --       Field = "󰜢",
        --       Variable = "󰀫",
        --       Class = "󰠱",
        --       Interface = "",
        --       Module = "",
        --       Property = "󰜢",
        --       Unit = "󰑭",
        --       Value = "󰎠",
        --       Enum = "",
        --       Keyword = "󰌋",
        --       Snippet = "",
        --       Color = "󰏘",
        --       File = "󰈙",
        --       Reference = "󰈇",
        --       Folder = "󰉋",
        --       EnumMember = "",
        --       Constant = "󰏿",
        --       Struct = "󰙅",
        --       Event = "",
        --       Operator = "󰆕",
        --       TypeParameter = "",
    -- },
  -- }),
},
  -- Set source precedence
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },    -- For nvim-lsp
    { name = 'buffer' },      -- For buffer word completion
    { name = 'path' },        -- For path completion
    { name = 'vimtex' },        -- For latex completion
    { name = 'luasnip' },        -- For snips completion
  })
})

