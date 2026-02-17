vim.o.relativenumber = true
vim.o.number = true

vim.keymap.set("n", "<leader>ff", function()
  require("mini.pick").builtin.files({
    no_ignore = true, -- Explicitly respect .gitignore and .ignore files
    hidden = true,    -- Optionally hide hidden files (starting with '.')
  })
end, { desc = "Pick files (respecting gitignore)" })
