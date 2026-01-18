return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  opts = {
    ensure_installed = { "rust", "javascript", "zig", "go" },
    highlight = {
      enable = true,
    },
    indent = { enable = true },
  },
}
