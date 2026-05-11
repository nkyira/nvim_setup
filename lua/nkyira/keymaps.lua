-- lua/yourname/keymaps.lua
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<Space>", "", opts)
vim.g.mapleader = " "

map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader>q", ":q<CR>", opts)
map("n", "<leader>Q", ":q!<CR>", opts)
map("n", "<leader>c", ":noh<CR>", opts)

map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)

map("n", "<leader>e", ":NvimTreeFocus<cr>", opts)
map("n", "<leader>t", ":NvimTreeToggle<cr>", opts)

map("n", "<leader>h", vim.diagnostic.open_float, opts)

-- map("n", "<leader>h", ":Stdheader<cr>", opts)
-- map("n", "<leader>1", function()
--   vim.cmd("Stdheader") -- inserts the header
--   vim.cmd("$r ~/.config/nvim/templates/ClassTemplate.hpp")  -- appends template at the end
-- end, opts)
