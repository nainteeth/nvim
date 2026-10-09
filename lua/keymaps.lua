-- keymaps.lua
local map = vim.keymap.set

-- File tree
map("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle file tree" })

-- Telescope
map("n", "<leader>f", ":Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>/", ":Telescope live_grep<CR>",  { desc = "Live grep" })
map("n", "<leader>b", ":Telescope buffers<CR>",    { desc = "Buffers" })

-- LSP
map("n", "gd",        vim.lsp.buf.definition,  { desc = "Go to definition" })
map("n", "gr",        vim.lsp.buf.references,  { desc = "References" })
map("n", "K",         vim.lsp.buf.hover,        { desc = "Hover docs" })
map("n", "<leader>r", vim.lsp.buf.rename,       { desc = "Rename symbol" })
map("n", "<leader>a", vim.lsp.buf.code_action,  { desc = "Code actions" })
map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Diagnostics float" })
map("n", "[d",        vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })
map("n", "]d",        vim.diagnostic.goto_next, { desc = "Next diagnostic" })

-- Window navigation
map("n", "<leader>wh", "<C-w>h", { desc = "Window left" })
map("n", "<leader>wj", "<C-w>j", { desc = "Window down" })
map("n", "<leader>wk", "<C-w>k", { desc = "Window up" })
map("n", "<leader>wl", "<C-w>l", { desc = "Window right" })
map("n", "<leader>wd", "<C-w>q", { desc = "Window close" })
map("n", "<leader>ws", "<C-w>s", { desc = "Split horizontal" })
map("n", "<leader>wv", "<C-w>v", { desc = "Split vertical" })

-- Keep selection after indent
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Git
map("n", "<leader>gg", function()
  local root = vim.fn.systemlist(
    "git -C " .. vim.fn.expand("%:p:h") .. " rev-parse --show-toplevel"
  )[1]
  require("lazygit").lazygit(root)
end, { desc = "LazyGit" })

-- Save
map("n", "<leader>w", ":w<CR>", { desc = "Save" })
