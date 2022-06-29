local lsp_installer = require("nvim-lsp-installer")
local lspconfig = require("lspconfig")

-- 1. Set up nvim-lsp-installer first!
lsp_installer.setup {}

-- 2. (optional) Override the default configuration to be applied to all servers.
lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config,
  { on_attach = on_attach })

-- 3. Loop through all of the installed servers and set it up via lspconfig
for _, server in ipairs(lsp_installer.get_installed_servers()) do
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol
    .make_client_capabilities())
  local opts = { capabilities = capabilities }
  if ide_settings.language_servers[server.name] then
    opts = ide_settings.language_servers[server.name].config(opts)
  end
  lspconfig[server.name].setup { opts }
end
-- local lsp_installer = require('nvim-lsp-installer')
-- lsp_installer.on_server_ready(function(server)
--   local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol
--     .make_client_capabilities())
--   local opts = { capabilities = capabilities }
--   if ide_settings.language_servers[server.name] then
--     opts = ide_settings.language_servers[server.name].config(opts)
--   end
--   server:setup(opts)
-- end)

-- Diagnostics
local signs = {
  Error = icons.lsp_signs.Error,
  Warn = icons.lsp_signs.Warning,
  Hint = icons.lsp_signs.Hint,
  Info = icons.lsp_signs.Information
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Show icons in autocomplete
require('vim.lsp.protocol').CompletionItemKind = {
  '', '', 'ƒ', ' ', '', '', '', 'ﰮ', '', '', '', '', '了', ' ',
  '﬌ ', ' ', ' ', '', ' ', ' ', ' ', ' ', '', '', '<>'
}

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  -- virtual_text = { spacing = 5, severity_limit = 'Warning' },
  update_in_insert = true,
  signs = true,
  source = 'if_many',
  virtual_text = {
    prefix = '',
    format = function(diagnostic)
      if diagnostic.severity == vim.diagnostic.severity.ERROR then
        return string.format("%s %s", icons.lsp_signs.Error, diagnostic.message)
      end
      if diagnostic.severity == vim.diagnostic.severity.WARN then
        return string.format("%s %s", icons.lsp_signs.Warning, diagnostic.message)
      end
      if diagnostic.severity == vim.diagnostic.severity.INFO then
        return string.format("%s %s", icons.lsp_signs.Information, diagnostic.message)
      end
      if diagnostic.severity == vim.diagnostic.severity.HINT then
        return string.format("%s %s", icons.lsp_signs.Hint, diagnostic.message)
      end
      return diagnostic.message
    end
  }
})
