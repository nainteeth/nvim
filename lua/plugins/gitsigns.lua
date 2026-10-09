return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      signs = {
        add          = { text = "▎" },
        change       = { text = "▎" },
        delete       = { text = "" },
        topdelete    = { text = "" },
        changedelete = { text = "▎" },
      },
      on_attach = function(bufnr)
        local gs  = package.loaded.gitsigns
        local map = function(l, r, desc)
          vim.keymap.set("n", l, r, { buffer = bufnr, desc = desc })
        end

        map("]h",        gs.next_hunk,    "Next hunk")
        map("[h",        gs.prev_hunk,    "Prev hunk")
        map("<leader>gp", gs.preview_hunk, "Preview hunk")
        map("<leader>gr", gs.reset_hunk,  "Reset hunk")
        map("<leader>gb", gs.blame_line,  "Blame line")
      end,
    })
  end,
}
