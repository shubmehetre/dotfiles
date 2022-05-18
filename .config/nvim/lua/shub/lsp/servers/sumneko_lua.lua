return {
	settings = {
		Lua = {
            runtime = {
                version = 'LuaJIT',
                path = vim.split(package.path, ';')
            },
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
----				[vim.fn.expand("$VIMRUNTIME/lua")] = true,
----				[vim.fn.stdpath("config") .. "/lua"] = true,
                    vim.api.nvim_get_runtime_file("", true),
                    checkThirdParty = false
				},
                maxPreload = 10000,
                preloadFileSize = 50000
			},
            telemetry = { enable = false}
		},
	},
}
