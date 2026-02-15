return {
  { "nvim-lua/plenary.nvim" },
  { "ThePrimeagen/harpoon", config = function()
    require("harpoon").setup({
      global_settings = { save_on_toggle = true },
    })
  end },
}
