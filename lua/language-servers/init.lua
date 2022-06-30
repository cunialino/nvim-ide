local log = require 'vim.lsp.log';
local util = require 'vim.lsp.util'
local lsp_installer = require("nvim-lsp-installer")
local lspconfig = require("lspconfig")

lsp_installer.setup {}

for _, server in ipairs(lsp_installer.get_installed_servers()) do
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol
                                                                       .make_client_capabilities())
  local opts = {capabilities = capabilities}
  if ide_settings.language_servers[server.name] then
    opts = ide_settings.language_servers[server.name].config(opts)
  end
  lspconfig[server.name].setup {opts}
end
-- Diagnostics
local signs = {
  Error = icons.lsp_signs.Error,
  Warn = icons.lsp_signs.Warning,
  Hint = icons.lsp_signs.Hint,
  Info = icons.lsp_signs.Information
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = ""})
end

-- Show icons in autocomplete
require('vim.lsp.protocol').CompletionItemKind = {
  '', '', 'ƒ', ' ', '', '', '', 'ﰮ', '', '', '', '', '了', ' ',
  '﬌ ', ' ', ' ', '', ' ', ' ', ' ', ' ', '', '', '<>'
}

vim.lsp.handlers['textDocument/publishDiagnostics'] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
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

-- vim.lsp.handlers['textDocument/definition'] = function(_, method, result)
--   if result == nil or vim.tbl_isempty(result) then
--     local _ = log.info() and log.info(method, 'No location found')
--     return nil
--   end
--
--   if vim.tbl_islist(result) then
--     util.jump_to_location(result[1])
--
--     if #result > 1 then util.set_qflist(util.locations_to_items(result)) end
--   else
--     util.jump_to_location(result)
--   end
-- end
