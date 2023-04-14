local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap <...> as leader key
-- TODO: I may want to do it later
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c"

-- Normal
keymap("n", "<esc><esc>", ":noh<return>", opts)
keymap("n", "<C-c>", "\"+Y", opts)
keymap("n", "<C-v>", "\"+p", opts)

keymap("n", "<Leader>nt", ":NvimTreeToggle<CR>", opts)
keymap("n", "<Leader>ntf", ":NvimTreeFocus<CR>", opts)
-- Visual
keymap("v", "(", "xi()<Esc>P", opts)
-- keymap("v", "{", "xi{}<Esc>P", opts)
keymap("v", "\"", "xi\"\"<Esc>P", opts)
keymap("v", "'", "xi''<Esc>P", opts)

keymap("v", "<C-c>", "\"+y", opts)

-- may want to try these
-- absolute/relative line numbers
-- map('n', '<F5>', ':exec &nu==&rnu? "se nu!" : "se rnu!"<CR>', default_opts)
-- Fuzzy Search. CTRL+a для поиска по файлам, CTRL+p для поиска по буфферам
-- map('n', '<C-a>', [[ <cmd>lua require('telescope.builtin').find_files()<cr> ]], default_opts)
-- map('n', '<C-p>', [[ <cmd>lua require('telescope.builtin').buffers()<cr> ]], default_opts)
-- -- <S-F5> Греповский поиск слова под курсором
-- map('n', '<S-F5>', [[<cmd>lua require('telescope.builtin').grep_string()<cr>]], default_opts)
-- -- <S-F4> Греповский поиск слова в модальном окошке
-- map('n', '<S-F4>', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], default_opts)
--
-- I may want these telescope settings
require('telescope').setup {
  defaults = {
    mappings = {
      -- i = {
      --   ['<C-u>'] = false,
      --   ['<C-d>'] = false,
      -- },
    },
  },
  pickers = {
	  buffers = {
		  mappings = {
			  i = {
				  ['<M-w>'] = "delete_buffer",
			  }
		  }
	  }
  },
}
--
-- -- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
--
-- -- See `:help telescope.builtin`
-- vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
-- vim.keymap.set('n', '<leader>/', function()
--   -- You can pass additional configuration to telescope to change theme, layout, etc.
--   require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
--     winblend = 10,
--     previewer = false,
--   })
-- end, { desc = '[/] Fuzzily search in current buffer]' })
--
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
-- vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
-- vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
-- vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
