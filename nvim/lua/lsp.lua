local capabilities = require("cmp_nvim_lsp").default_capabilities()
vim.lsp.config("lua_ls", {
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			telemetry = {
				enable = false,
			},
		},
	},
})
vim.lsp.config("pyright", {
	capabilities = capabilities,
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				diagnosticMode = "workspace",
				typeCheckingMode = "basic",
			},
		},
	},
})
vim.lsp.config("rust_analyzer", {
	capabilities = capabilities,
	settings = {
		["rust-analyzer"] = {
			cargo = {
				allFeatures = true,
			},
			checkOnSave = {
				command = "clippy",
			},
			procMacro = {
				enable = true,
			},
		},
	},
})
vim.lsp.config("texlab", {
    capabilities = capabilities,
    settings = {
        texlab = {
            build = {
                onSave = false,
            },
            chktex = {
                onOpenAndSave = true,
            },
        },
    },
})
vim.lsp.enable({ "lua_ls", "pyright", "rust_analyzer", "texlab" })
