-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
	n = {
		["<leader>gl"] = { "<cmd>:ToggleBlame virtual<cr>", desc = "Toggle line blame" },
		["<leader>T"] = { name = "Tests" },
		["<leader>Tb"] = {
			function()
				require("neotest").run.run(vim.fn.expand("%"))
			end,
			desc = "Run all tests in file",
		},
		["<leader>TB"] = {
			function()
				require("neotest").run.run({ vim.fn.expand("%"), strategy = "dap" })
			end,
			desc = "Debug all tests in file",
		},
		["<leader>Tc"] = {
			function()
				require("neotest").run.run()
			end,
			desc = "Run test at cursor",
		},
		["<leader>TC"] = {
			function()
				require("neotest").run.run({ strategy = "dap" })
			end,
			desc = "Debug test at cursor",
		},
		["<leader>Tq"] = {
			function()
				require("neotest").run.stop()
			end,
			desc = "Abort test run",
		},
		["<leader>To"] = {
			function()
				require("neotest").summary.toggle()
			end,
			desc = "Toggle summary window",
		},
	},
	x = {
		["p"] = { '"_dp', desc = "Paste forwards without yank", noremap = true },
		["P"] = { '"_dP', desc = "Paste backwards without yank", noremap = true },
	},
}
