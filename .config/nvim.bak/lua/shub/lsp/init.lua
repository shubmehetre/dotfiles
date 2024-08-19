local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    print "lspconfig did not work for some reason"
	return
end

require("shub.lsp.lsp-installer")
require("shub.lsp.handlers").setup()
