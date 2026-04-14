--For those one liner plugins which do not need much customisations
return{

    { 'ThePrimeagen/vim-be-good'},

    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && npm install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },

    {'norcalli/nvim-colorizer.lua',
    config = function ()
        require'colorizer'.setup()
    end
    }
}
