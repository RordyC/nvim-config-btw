return {
    {
		"neovim/nvim-lspconfig",
		config = function()

			vim.api.nvim_create_autocmd('LspAttach', {
				group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
				callback = function(event)
				  -- NOTE: Remember that Lua is a real programming language, and as such it is possible
				  -- to define small helper and utility functions so you don't have to repeat yourself.
				  --
				  -- In this case, we create a function that lets us more easily define mappings specific
				  -- for LSP related items. It sets the mode, buffer and description for us each time.
				  local map = function(keys, func, desc, mode)
					mode = mode or 'n'
					vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
				  end

					map('gd', function() vim.lsp.buf.definition() end, '[G]oto [D]efinition')
				end
			})

			-- Diagnostic configuration
			vim.diagnostic.config {
				severity_sort = true,
				float = { border = "rounded", source = "if_many" },
				underline = { severity = vim.diagnostic.severity.ERROR },
				signs = vim.g.have_nerd_font and {
					text = {
						[vim.diagnostic.severity.ERROR] = "󰅚 ",
						[vim.diagnostic.severity.WARN]  = "󰀪 ",
						[vim.diagnostic.severity.INFO]  = "󰋽 ",
						[vim.diagnostic.severity.HINT]  = "󰌶 ",
					},
				} or {},
				virtual_text = {
					source = "if_many",
					spacing = 2,
					format = function(diagnostic)
						local diagnostic_message = {
							[vim.diagnostic.severity.ERROR] = diagnostic.message,
							[vim.diagnostic.severity.WARN]  = diagnostic.message,
							[vim.diagnostic.severity.INFO]  = diagnostic.message,
							[vim.diagnostic.severity.HINT]  = diagnostic.message,
						}
						return diagnostic_message[diagnostic.severity]
					end,
				},
			}
		end,
    },
    {
        "mason-org/mason.nvim",
        opts = {},
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { "lua_ls", "clangd" },
        },
    },
}
