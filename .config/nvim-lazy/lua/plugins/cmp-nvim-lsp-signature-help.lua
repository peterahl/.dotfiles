return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-nvim-lsp-signature-help" },
		opts = { sources = { { name = "nvim_lsp" }, { name = "nvim_lsp_signature_help" } } },
	},
}
