local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach    = require("local.lsp.handlers").on_attach,
    capabilities = require("local.lsp.handlers").capabilities,
  }
  server:setup(opts)
end)

-- Function to run on every server attached
require "local.lsp.signature"
require("local.lsp.handlers").setup()
