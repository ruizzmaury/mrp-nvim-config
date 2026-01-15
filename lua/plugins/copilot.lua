return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "BufReadPost",

  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      hide_during_completion = false,

      keymap = {
        accept = false, -- we bind it manually
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<C-x>",
      },
    },

    panel = {
      enabled = false,
    },

    filetypes = {
      markdown = true,
      help = true,
    },
  },

  config = function(_, opts)
    require("copilot").setup(opts)

    local suggestion = require("copilot.suggestion")

    -- Accept Copilot inline suggestion
    vim.keymap.set("i", "<C-l>", function()
      if suggestion.is_visible() then
        suggestion.accept()
      end
    end, { silent = true, desc = "Accept Copilot suggestion" })

    -- Manually trigger Copilot suggestion
    vim.keymap.set("i", "<C-/>", function()
      suggestion.next()
    end, { silent = true, desc = "Trigger Copilot suggestion" })
  end,
}
