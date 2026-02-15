return {
  "nvim-mini/mini.pick",
  version = false,
  config = function()
    local pick = require("mini.pick")

    pick.setup({
      window = {
        config = function()
          local height = math.floor(vim.o.lines * 0.75)
          local width = math.floor(vim.o.columns * 0.75)

          return {
            relative = "editor",
            anchor = "NW",
            height = height,
            width = width,
            row = math.floor((vim.o.lines - height) / 2),
            col = math.floor((vim.o.columns - width) / 2),
            border = "rounded",
          }
        end,
      },

      mappings = {
        choose = "<CR>",
        choose_in_split = "<C-s>",
        choose_in_vsplit = "<C-v>",
        choose_in_tabpage = "<C-t>",
        toggle_preview = "<C-p>",
        move_down = "<C-j>",
        move_up = "<C-k>",
      },

      options = {
        use_cache = true,
      },
    })

    -- Quick pickers
    vim.keymap.set("n", "<leader>ff", function()
      pick.builtin.files()
    end)

    vim.keymap.set("n", "<leader>fg", function()
      pick.builtin.grep_live()
    end)

    vim.keymap.set("n", "<leader>fb", function()
      pick.builtin.buffers()
    end)
  end,
}
