return {
	-- You can also add new plugins here as well:
	-- Add plugins, the lazy syntax
	-- "andweeb/presence.nvim",
	-- {
	--   "ray-x/lsp_signature.nvim",
	--   event = "BufRead",
	--   config = function()
	--     require("lsp_signature").setup()
	--   end,
	-- },
	{
		-- disabled by default on Windows, but several plugins expect it to be enabled
		"mfussenegger/nvim-dap",
		enabled = true,
	},
	{
		"NoahTheDuke/vim-just",
		event = { "BufReadPre", "BufNewFile" },
		ft = { "\\cjustfile", "*.just", ".justfile" },
	},
	{
		"nvim-neotest/neotest",
		opts = function(_, opts)
			opts.summary = {
				mappings = {
					expand = { "<Tab>", "<CR>", "<2-LeftMouse>" },
					expand_all = { "<S-Tab>", "e" },
				},
			}

			return opts
		end,
	},
}
