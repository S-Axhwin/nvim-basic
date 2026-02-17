----------------------------------------
--- Harpoon keymapping
----------------------------------------
vim.keymap.set("n", "<leader>hh", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", { desc = "Toggle Harpoon quick menu" })
vim.keymap.set("n", "<leader>ha", ":lua require('harpoon.mark').add_file()<CR>", { desc = "Add current file to Harpoon" })
vim.keymap.set("n", "<leader>h1", ":lua require('harpoon.ui').nav_file(1)<CR>", { desc = "Go to file 1 in Harpoon" })
vim.keymap.set("n", "<leader>h2", ":lua require('harpoon.ui').nav_file(2)<CR>", { desc = "Go to file 2 in Harpoon" })
vim.keymap.set("n", "<leader>h3", ":lua require('harpoon.ui').nav_file(3)<CR>", { desc = "Go to file 3 in Harpoon" })
vim.keymap.set("n", "<leader>h4", ":lua require('harpoon.ui').nav_file(4)<CR>", { desc = "Go to file 4 in Harpoon" })


--- Lazy git
vim.keymap.set("n", "<leader>gg", function()
  vim.cmd("LazyGit")
end, { desc = "Open LazyGit" })

vim.keymap.set("t", "<Esc>", [[<C-\><C-n>:q<CR>]])


vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>Q", ":qa!<CR>")

-- Ctrl+l → next buffer (cycle forward)
vim.keymap.set("n", "<C-l>", ":bnext<CR>")

-- Ctrl+h → previous buffer (cycle backward)
vim.keymap.set("n", "<C-h>", ":bprevious<CR>")

-- Move selected lines DOWN with J
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Move selected lines UP with K
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Oil
vim.keymap.set("n", "<leader>e", ":Oil<CR>")
