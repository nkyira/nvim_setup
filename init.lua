-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.clipboard = "unnamedplus"
-- vim.api.nvim_create_autocmd("FileType", {
--   callback = function()
--     vim.treesitter.start()
--   end,
-- })

-- Setup lazy.nvim
require("lazy").setup({
  { "nvim-treesitter/nvim-treesitter" },
  {
  "nvim-tree/nvim-tree.lua",
  config = function()
    require("nvim-tree").setup({})
  end
  },
  { "neovim/nvim-lspconfig" },
  { "nvim-telescope/telescope.nvim" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "folke/tokyonight.nvim" },
})

-- require("lazy").setup({
--   spec = {
--     -- import your plugins
--     { import = "plugins" },
--   },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  -- install = { colorscheme = { "tokyonight" } },
  -- automatically check for plugin updates
--   checker = { enabled = true },
-- })

-- Lsp config
vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            runtime = { version = 'LuaJIT' },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
        }
    }
})
vim.lsp.enable({ 'clangd', 'rust_analyzer', 'ts_ls', 'lua_ls' })
vim.lsp.config('clangd', {})
vim.lsp.config('rust_analyzer', {})
vim.lsp.config('ts_ls', {})
vim.lsp.enable({ 'clangd', 'rust_analyzer', 'ts_ls', 'lua_ls' })
-- vim.api.nvim_create_autocmd("FileType", {
--   callback = function()
--     vim.treesitter.start()
--   end,
-- })


vim.cmd.colorscheme("tokyonight-night")

local cmp = require("cmp")
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = {
    { name = "nvim_lsp" },
  },
})

require("nkyira.keymaps")
require("nkyira.settings")
