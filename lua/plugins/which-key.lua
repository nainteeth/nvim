return {
  "folke/which-key.nvim",
  config = function()
    local wk = require("which-key")
    wk.setup({ preset = "helix" })
    wk.add({
      { "<leader>w", group = "Windows" },
      { "<leader>g", group = "Git" },
      { "gc",        desc = "Comment", mode = { "n", "v" } },
      { "gcc",       desc = "Comment line" },
    })
  end,
}
