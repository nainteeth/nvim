return {
  "neovim/nvim-lspconfig",
  dependencies = { "hrsh7th/cmp-nvim-lsp" },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Rust — rustup component add rust-analyzer
    vim.lsp.config("rust_analyzer", {
      capabilities = capabilities,
      settings = {
        ["rust-analyzer"] = {
          checkOnSave = { command = "clippy" },
          cargo       = { allFeatures = true },
          procMacro   = { enable = true },
        },
      },
    })

    -- JSON — npm i -g vscode-langservers-extracted
    vim.lsp.config("jsonls", { capabilities = capabilities })

    -- LaTeX — dnf install texlab
    vim.lsp.config("texlab", {
      capabilities = capabilities,
      settings = { texlab = { build = { onSave = true } } },
    })

    -- Java
    vim.lsp.config("jdtls", {
      capabilities = capabilities,
      cmd      = { "jdtls" },
      root_markers = { ".git", "pom.xml", "build.gradle" },
    })

    vim.lsp.enable({ "rust_analyzer", "nil_ls", "jsonls", "texlab", "jdtls" })
  end,
}
