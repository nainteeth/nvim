return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      window = {
        width = 30,
        mappings = { ["<space>"] = false },
      },
      filesystem = {
        follow_current_file = { enabled = true },
        hide_dotfiles = false,
      },
    })
  end,
}
