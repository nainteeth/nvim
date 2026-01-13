return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- Setup mason first
    require("mason").setup()
    -- Setup mason-lspconfig
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "jdtls", "clangd", "rust_analyser", "pyright", "ts_ls", "gopls", "html", "cssls", "jsonls" },
    })

    -- Configure diagnostics appearance
    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })

    -- Setup keymaps when LSP attaches to a buffer
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        -- Keybindings
        map('gd', vim.lsp.buf.definition, 'Goto Definition')
        map('gr', vim.lsp.buf.references, 'Goto References')
        map('gI', vim.lsp.buf.implementation, 'Goto Implementation')
        map('gy', vim.lsp.buf.type_definition, 'Type Definition')
        map('K', vim.lsp.buf.hover, 'Hover Documentation')
        map('gK', vim.lsp.buf.signature_help, 'Signature Help')
        map('<leader>ca', vim.lsp.buf.code_action, 'Code Action')
        map('<leader>cr', vim.lsp.buf.rename, 'Rename')
      end,
    })

    -- Configure Lua language server (for Neovim config)
    vim.lsp.config('lua_ls', {
      settings = {
        Lua = {
          runtime = { version = 'LuaJIT' },
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME,
            },
          },
          diagnostics = {
            globals = { 'vim' }, -- Recognize 'vim' as a global
          },
          telemetry = { enable = false },
          completion = {
            callSnippet = "Replace"
          },
        },
      },
    })

    -- Other servers with default config
    local servers = { 'jdtls', 'clangd', 'rust_analyzer', 'pyright', 'ts_ls', 'gopls', 'html', 'cssls', 'jsonls' }
    for _, server in ipairs(servers) do
      vim.lsp.config(server, {})
    end

-- Enable all servers
    vim.lsp.enable({ 'lua_ls', 'jdtls', 'clangd', 'rust_analyzer', 'pyright', 'ts_ls', 'gopls', 'html', 'cssls', 'jsonls' })
      end,
}
