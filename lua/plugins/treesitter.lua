return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = { "rust", "lua", "nix", "json", "toml", "markdown", "bash" },
    auto_install     = true,
    highlight        = { enable = true },
    indent           = { enable = true },
  },
}
