return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    open_mapping = [[<c-\>]],
    direction = "vertical",
    persist_mode = true,
    persist_size = true,
    size = function(term)
      if term.direction == "vertical" then
        return math.floor(vim.o.columns * 0.35)
      end
      return 20
    end,
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)

    -- Terminal-only keymaps
    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "term://*toggleterm#*",
      callback = function()
        local keymap_opts = { buffer = 0 }
        vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], keymap_opts)
        vim.keymap.set("t", "<C-h>", "<cmd>wincmd h<CR>", keymap_opts)
        vim.keymap.set("t", "<C-j>", "<cmd>wincmd j<CR>", keymap_opts)
        vim.keymap.set("t", "<C-k>", "<cmd>wincmd k<CR>", keymap_opts)
        vim.keymap.set("t", "<C-l>", "<cmd>wincmd l<CR>", keymap_opts)
      end,
    })

    local Terminal = require("toggleterm.terminal").Terminal

    -- LazyDocker (floating)
    local lazydocker = Terminal:new({
      cmd = "lazydocker",
      direction = "float",
      hidden = true,
    })

    function _LAZYDOCKER_TOGGLE()
      lazydocker:toggle()
    end

    -- Claude Code (vertical, persistent)
    local claude = Terminal:new({
      cmd = "claude",
      direction = "vertical",
      hidden = true,
    })

    function _CLAUDE_TOGGLE()
      claude:toggle()
    end

    -- Keymaps
    vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm direction=vertical<CR>", {
      desc = "Terminal",
    })

    vim.keymap.set("n", "<leader>td", _LAZYDOCKER_TOGGLE, {
      desc = "LazyDocker",
    })

    vim.keymap.set("n", "<leader>ta", _CLAUDE_TOGGLE, {
      desc = "Claude Code",
    })
  end,
}
