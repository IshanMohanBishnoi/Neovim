return {
    {
        'saghen/blink.cmp',
        dependencies = { 'rafamadriz/friendly-snippets' },
        version = '1.*',
        opts = {

            keymap = {
                -- set to 'none' to disable the 'default' preset
                preset = 'default',

                ['<A-k>'] = { 'select_prev' },
                ['<A-j>'] = { 'select_next'},
                ['<A-x>'] = {'cancel'},
                ['<A-f>'] = {'show'},
                ['<A-c>'] = {'accept'},
                ['<C-h>'] = {'hide_signature'},



            },


            appearance = {
                nerd_font_variant = 'mono'
            },

            signature = {enabled = true},--signature shows args for funcs and objs

            completion = {
                documentation = { auto_show = false }
            },

            sources = {
                default = { "lsp", "path", "buffer", "snippets" },
            },

            fuzzy = { implementation = "prefer_rust_with_warning" }
        },
    },
}
