
return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = {"nvim-tree/nvim-web-devicons"},
  config = function()
    require("bufferline").setup({
      options = {
        separator_style = "thin",
        always_show_bufferline = true,
      },
      highlights = {
        fill = {
          bg = "NONE",
        },
        background = {
          bg = "NONE",
        },
        buffer_selected = {
          bg = "NONE",
          bold = true,
        },
        buffer_visible = {
          bg = "NONE",
        },
        separator = {
          bg = "NONE",
        },
        separator_selected = {
          bg = "NONE",
        },
        separator_visible = {
          bg = "NONE",
        },
        close_button = {
          bg = "NONE",
        },
        close_button_selected = {
          bg = "NONE",
        },
      },
    })

    -- Force transparency after load (important)
    vim.cmd([[
      hi BufferLineFill guibg=NONE
      hi BufferLineBackground guibg=NONE
      hi BufferLineBufferSelected guibg=NONE
      hi BufferLineSeparator guibg=NONE
      hi BufferLineSeparatorSelected guibg=NONE
    ]])
  end,
}
