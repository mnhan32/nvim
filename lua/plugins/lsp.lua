return {
	{ -- LSP Configuration & cmp based on nvim-lua/kickstarter.nvim
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			{ "folke/neodev.nvim", opts = {} },
			--"WhoIsSethDaniel/mason-tool-installer.nvim",
			--fidget show lsp progress percentage
			{ "j-hui/fidget.nvim", opts = {} },
		},
		config = function()
			-- create a callback for keymap everytime an LSP attached to a buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end
					--  To jump back, press <C-T>.
					map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
					map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
					map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
					map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
					--map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
					--map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
					--map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
					--map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
					map("K", vim.lsp.buf.hover, "Hover Documentation")

					-- toggle diagnostics
					map("<leader>lv", function()
						if vim.diagnostic.is_disabled() == false then
							vim.diagnostic.disable()
						else
							vim.diagnostic.enable()
						end
					end, "Toggle diagnostic")
					-- The following two autocommands are used to highlight references of the
					-- When you move your cursor, the highlights will be cleared (the second autocommand).
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client.server_capabilities.documentHighlightProvider then
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							callback = vim.lsp.buf.clear_references,
						})
					end
				end,
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
				},
			})

			local neodev = require("neodev")
			neodev.setup({
				library = { plugins = { "nvim-dap-ui" }, types = true },
			})

			local lsp = require("lspconfig")
			-- custom python stubs directory based on OS
			local userprofile = os.getenv("HOME")
			local pystub = userprofile .. "/.local/share/nvim/python-stub"
			if userprofile == nil then
				userprofile = os.getenv("UserProfile")
				pystub = userprofile .. "\\AppData\\Local\\nvim-data\\python-stub"
			end
			-- jedi
			--lsp.jedi_language_server.setup({
			--	filetypes = { "python" },
			--	init_options = {
			--		workspace = {
			--			extraPaths = {
			--				pystub,
			--			},
			--		},
			--	},
			--})
			--pylsp
			lsp.pylsp.setup({
				filetypes = { "python" },
				settings = {
					pylsp = {
						plugins = {
							jedi = {
								extra_paths = {
									pystub,
								},
							},
						},
					},
				},
			})
			-- end of pylsp setup
			-- clangd
			lsp.clangd.setup({})
			-- end of clangd setup
			-- marksman
			lsp.marksman.setup({})
			-- end of marksman setup
			-- lua_ls
			lsp.lua_ls.setup({
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						workspace = {
							checkThirdParty = false,
							library = {
								"${3rd}/luv/library",
								unpack(vim.api.nvim_get_runtime_file("", true)),
							},
							-- If lua_ls is really slow on your computer, you can try this instead:
							-- library = { vim.env.VIMRUNTIME },
						},
						completion = {
							callSnippet = "Replace",
						},
					},
				},
			})
			-- end of lua setup
		end,
	},
}
