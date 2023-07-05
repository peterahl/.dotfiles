local Util = require("lazyvim.util")

return {

	{
		"nvim-telescope/telescope.nvim",
		-- change some options
		keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>ff",
        function() require("telescope.builtin").find_files({ cwd = require('telescope.utils').buffer_dir() }) end,
        desc = "Find Files",
      },
			{
				"<leader>pf",
				function()
					require("telescope.builtin").git_files()
				end,
				desc = "Project Files",
			},
			{
				"<leader>*",
				function()
					require("telescope.builtin").grep_string()
				end,
				desc = "Search string at point",
			},
			{
				"<leader>sf",
				function()
					require("telescope.builtin").live_grep({ grep_open_files = true })
				end,
				desc = "Search string in files",
			},
			{
				"<leader>sd",
				function()
					require("telescope.builtin").live_grep({ cwd = require("telescope.utils").buffer_dir() })
				end,
				desc = "Search string in current dir",
			},
			{
				"<leader>cD",
				function()
					require("telescope.builtin").diagnostics()
				end,
				desc = "Workspace diagnostics",
			},
			{ "<leader>ss", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
			{
				"gs",
				Util.telescope("lsp_document_symbols", {
					symbols = {
						"Class",
						"Function",
						"Method",
						"Constructor",
						"Interface",
						"Module",
						"Struct",
						"Trait",
						"Field",
						"Property",
					},
				}),
				desc = "Goto Symbol",
			},
			{
				"gS",
				Util.telescope("lsp_dynamic_workspace_symbols", {
					symbols = {
						"Class",
						"Function",
						"Method",
						"Constructor",
						"Interface",
						"Module",
						"Struct",
						"Trait",
						"Field",
						"Property",
					},
				}),
				desc = "Goto Symbol (Workspace)",
			},
		},
		opts = {
			defaults = {
				layout_strategy = "vertical",
				path_display = function(opts, path)
					local tail = require("telescope.utils").path_tail(path)
					return string.format("%s%s%s", tail, string.rep(" ", 60 - #tail), path)
				end,
				layout_config = {
					prompt_position = "top",
					preview_cutoff = 40,
				},
				sorting_strategy = "ascending",
				winblend = 0,
			},
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				},
				file_browser = {
					path_display = {},
					sorting_strategy = "ascending",
					layout_strategy = "horizontal",
					layout_config = {
						preview_width = 0.6,
					},
				},
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
				project = {
					base_dirs = {
						"~/git",
						"~/.dotfiles",
					},
				},
			},
		},
	},

	-- add telescope-fzf-native
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		config = function()
			require("telescope").load_extension("fzf")
		end,
	},

	{
		"nvim-telescope/telescope-project.nvim",
		config = function()
			require("telescope").load_extension("project")
		end,
		keys = {
			{
				"<leader>pp",
				function()
					require("telescope").extensions.project.project({})
				end,
				desc = "open project",
			},
		},
	},

	{
		"nvim-telescope/telescope-file-browser.nvim",
		config = function()
			require("telescope").load_extension("file_browser")
		end,
		keys = {
			{
				"<M-g><M-r>",
				function()
					require("telescope").extensions.file_browser.file_browser({
						path = require("telescope.utils").buffer_dir(),
						display_stat = false,
					})
				end,
				desc = "open file browser",
			},
		},
	},
}
