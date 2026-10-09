-- theme.lua
require("catppuccin").setup({
  flavour = "mocha",
  transparent_background = true,
})

vim.cmd.colorscheme("catppuccin")

local bold_groups = {
  "Keyword", "Statement", "Condition", "Repeat",
  "Exception", "Label", "Function", "Type",
}
for _, group in ipairs(bold_groups) do
  local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
  hl.bold = true
  vim.api.nvim_set_hl(0, group, hl)
end

local transparent = {
  "Normal", "NormalFloat", "NormalNC",
  "NeoTreeNormal", "NeoTreeNormalNC", "NeoTreeEndOfBuffer",
}
for _, group in ipairs(transparent) do
  vim.api.nvim_set_hl(0, group, { bg = "none" })
end
