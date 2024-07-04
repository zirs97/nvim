return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		--Toggle Term
		-- 	t = {
		-- 		name = "Terminal",
		-- 		-- n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" }, -- Node Terminal
		-- 		-- t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" }, -- (Optional) Htop, If you have htop in linux
		-- 		p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" }, -- Python Terminal
		-- 		-- f = { "<cmd>ToggleTerm direction=float<cr>", "Float" }, -- Floating Terminal
		--
		-- 		-- Play with size according to your needs.
		-- 		-- h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" } -- Horizontal Terminal,
		-- 		-- v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" }, -- Vertical Terminal
		-- 	},
		config = function()
			local status_ok, which_key = pcall(require, "which-key")
			if not status_ok then
				return
			end
			local mappings = {

				-- ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" }, -- File Explorer
				["k"] = { "<cmd>bdelete<CR>", "Kill Buffer" }, -- Close current file
				["m"] = { "<cmd>Mason<cr>", "Mason" }, -- LSP Manager
				["p"] = { "<cmd>Lazy<CR>", "Plugin Manager" }, -- Invoking plugin manager
				["q"] = { "<cmd>wqall!<CR>", "Quit" }, -- Quit Neovim after saving the file
				-- ["r"] = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Reformat Code" },
				-- ["w"] = { "<cmd>w!<CR>", "Save" }, -- Save current file
			}
			local opts = {
				mode = "n", -- NORMAL mode
				prefix = "<leader>",
				buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
				silent = true, -- use `silent` when creating keymaps
				noremap = true, -- use `noremap` when creating keymaps
				nowait = true, -- use `nowait` when creating keymaps
			}
			which_key.register(mappings, opts)
		end,
	},
}
