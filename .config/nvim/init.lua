local present, impatient = pcall(require, "impatient")
if present then
	impatient.enable_profile()
end

_G.lazy = function(plugin, timer)
	if plugin then
		timer = timer or 0
		vim.defer_fn(function()
			require("packer").loader(plugin)
		end, timer)
	end
end


-- Basic
require "shub.options"
require "shub.keymaps"
require "shub.plugins"
require "shub.autocmds"

-- Plugin confings
require "shub.lsp"
require "shub.cmp"
require "shub.config.colorscheme"
