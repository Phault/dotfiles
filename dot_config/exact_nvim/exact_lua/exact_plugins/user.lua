-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {
  { "mrjones2014/smart-splits.nvim", version = "^1", lazy = false },
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
  -- uncertain if still needed in astronvim v4
  -- {
	-- 	-- disabled by default on Windows, but several plugins expect it to be enabled
	-- 	"mfussenegger/nvim-dap",
	-- 	enabled = true,
	-- },
}
