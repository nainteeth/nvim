return {
  "folke/flash.nvim",
  config = function()
    local flash = require("flash")
    flash.setup({})
    local map = vim.keymap.set
    map({ "n", "x", "o" }, "s", function() flash.jump() end,       { desc = "Flash seek" })
    map({ "n", "x", "o" }, "S", function() flash.treesitter() end, { desc = "Flash treesitter" })
  end,
}
