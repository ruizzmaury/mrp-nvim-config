return {
  "crnvl96/lazydocker.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("lazydocker").setup({
      window = {
        settings = {
          width = 0.8,
          height = 0.8,
          border = "rounded",
          relative = "editor",
        },
      },
    })

    -- Docker
    vim.keymap.set(
      { "n", "t" },
      "<leader>ld",
      function()
        require("lazydocker").toggle({ engine = "docker" })
      end,
      { desc = "LazyDocker" }
    )
  end,
}
