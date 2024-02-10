-- telescope设置
local present, telescope = pcall(require, "telescope")
local actions = require('telescope.actions')
if not present then
	return
end

telescope.setup {
	defaults = {
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
		mappings = {
			i = {
				['<esc>'] = actions.close,
				['<C-q>'] = actions.close
			},
			n = {
				['<esc>'] = actions.close,
				['<C-q>'] = actions.close
			},
		},
		extensions = {
			file_browser = { }
		},
		prompt_prefix = " ",
		selection_caret = "➜ ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.55,
				results_width = 0.8,
			},
			vertical = {
				mirror = false,
			},
			width = 0.87,
			height = 0.80,
			preview_cutoff = 120,
		},
		file_ignore_patterns = { "node_modules" },
		generic_sorter = require('mini.fuzzy').get_telescope_sorter,
		winblend = 0,
		border = {},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		color_devicons = true,
		use_less = true,
		path_display = {},
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
	},
	pickers = {
		find_files = {
			previewer = false,
		},
	},
}

local extensions = { "themes", "terms" }

pcall(function()
	for _, ext in ipairs(extensions) do
		telescope.load_extension(ext)
	end
end)
require("telescope").load_extension "file_browser"

--按键设置
vim.api.nvim_set_keymap("n", "<leader>ff", [[<cmd>lua require('telescope.builtin').find_files()<cr>]], {})
vim.api.nvim_set_keymap("n", "<leader>fg", [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], {})
vim.api.nvim_set_keymap("n", "<leader>fb", [[<cmd>lua require('telescope.builtin').buffers()<cr>]], {})
vim.api.nvim_set_keymap("n", "<leader>fh", [[<cmd>lua require('telescope.builtin').help_tags()<cr>]], {})
vim.api.nvim_set_keymap("n", "<leader>/", [[<cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find{}<CR>]], {})
vim.api.nvim_set_keymap("n", "<space>l", ":Telescope file_browser<CR>", { noremap = true } )
-- 快捷键
-- <A-c>/c	创建文件或文件夹Create file/folder at current path (trailing path separator creates folder)
-- <A-r>/r	重命名文件或者文件夹Rename multi-selected files/folders
-- <A-m>/m	移动文件或文件夹Move multi-selected files/folders to current path
-- <A-y>/y	复制文件或文件夹Copy (multi-)selected files/folders to current path
-- <A-d>/d	删除文件或文件夹Delete (multi-)selected files/folders
-- <C-o>/o	用默认软件打开文件或文件夹Open file/folder with default system application
-- <C-g>/g	前往父路径Go to parent directory
-- <C-e>/e	前往根目录Go to home directory
-- <C-w>/w	前往当前工作目录Go to current working directory (cwd)
-- <C-t>/t	改变nvim的当前工作目录Change nvim's cwd to selected folder/file(parent)
-- <C-f>/f	切换文件和文件夹Toggle between file and folder browser
-- <C-h>/h	切换隐藏文件或文件夹Toggle hidden files/folders
-- <C-s>/s	切换所有被被忽略文件Toggle all entries ignoring ./ and ../
