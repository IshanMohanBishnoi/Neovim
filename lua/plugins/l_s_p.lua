--lsp setup
return{

    {
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },

    {
        "mason-org/mason-lspconfig.nvim",--this ensures lsp for certain languages exists
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {"lua_ls","pyright",}
            })
        end,
    },

    {
        "neovim/nvim-lspconfig",
        dependencies = {
            'saghen/blink.cmp',
            {
                "folke/lazydev.nvim",
                ft = "lua", -- only load on lua files
                opts = {
                    library = {
                        -- See the configuration section for more details
                        -- Load luvit types when the `vim.uv` word is found
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
        },
        config = function()
            local capabilities = require('blink.cmp').get_lsp_capabilities()
            vim.lsp.config('lua_ls',{ capabilities = capabilities })
            vim.lsp.config('pyright',{ capabilities = capabilities })
            vim.lsp.config('html',{ capabilities = capabilities })
            vim.lsp.config('cssls',{ capabilities = capabilities })
            vim.lsp.config('jsonls',{ capabilities = capabilities })
            vim.lsp.enable({ 'lua_ls', 'pyright', 'html', 'cssls', 'jsonls' })

        end
    },

}


--[[
The LSP "Stack"
Mason (mason.nvim): Think of this as the Package Manager. It downloads and manages the actual binaries (the .exe or language server files) on your hard drive. Without this, you'd have to manually install pyright or lua-language-server via npm or pip.

LSP Config (nvim-lspconfig): This is the Translator/Blueprint. It knows that pyright needs specific command-line arguments to start and which files it should care about. It maps the binaries Mason installed to Neovim's internal LSP client.

Mason-LSPConfig (mason-lspconfig.nvim): This is the Glue. It bridges the gap. It ensures that if nvim-lspconfig wants to start pyright, it knows to look inside the specific folder where Mason installed it.

Blink (blink.cmp): This is the UI/Frontend. It takes the "intelligence" provided by the LSP (like autocompletion suggestions) and displays them in a nice menu while you type.

LazyDev (lazydev.nvim): This is a Specialist. It specifically configures your Lua LSP so that it understands Neovim's unique APIs (like what vim.lsp or vim.uv actually do).
]]--
