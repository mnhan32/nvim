return {
	{
		"danymat/neogen",
		config = function()
			local neogen = require("neogen")
			vim.keymap.set("n", "<leader>lf", ":Neogen file<CR>", { desc = "Docstring File" })
			vim.keymap.set("n", "<leader>ld", ":Neogen func<CR>", { desc = "Docstring Func" })
			vim.keymap.set("n", "<leader>lc", ":Neogen class<CR>", { desc = "Docstring Class" })
			vim.keymap.set("n", "<leader>lt", ":Neogen type<CR>", { desc = "Docstring Type" })
			vim.keymap.set("n", "<leader>la", ":Neogen<CR>", { desc = "Annotation" })
			vim.keymap.set("i", "<c-l>", ":require('neogen').jump_next()<CR>", { desc = "Neogen next" })
			vim.keymap.set("i", "<c-h>", ":require('neogen').jump_prev()<CR>", { desc = "Neogen prev" })

			neogen.setup({
				snippet_engine = "luasnip",
				enabled = true,
				languages = {
					python = {
						template = {
							annotation_convention = "google_docstrings",
						},
					},
				},
			})
		end,
	},
}
