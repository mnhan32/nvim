return {
	{ -- Autoformat
		"stevearc/conform.nvim",
		opts = {
			notify_on_error = true,
			format_on_save = {
				async = false,
				timeout_ms = 500,
				lsp_fallback = true,
			},
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				-- python = { "isort", "black" },
				-- javascript = { { "prettierd", "prettier" } },
			},
		},
	},
}
