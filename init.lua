require("config.lazy")
require("config.option")
require("config.keymap")

vim.opt.termguicolors = true
require("bufferline").setup{}

vim.opt.clipboard = "unnamedplus"


vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" }) -- Non-current windows
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" }) -- Sign column (left)
vim.api.nvim_set_hl(0, "LineNr", { bg = "none" }) -- Line numbers

