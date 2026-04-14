return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.startify")

    -- HEADER
    dashboard.section.header.val = {
  [[                                                                       ]],
  [[                                                                       ]],
  [[  ╦ ╦╔═╗╦═╗╔═╗  ╦╔═╦═╗╔═╗╔╗╔╔═╗  ╦ ╦╔═╗╦═╗╔═╗  ╦╔═╦═╗╔═╗╔╗╔╔═╗      ]],
  [[  ╠═╣╠═╣╠╦╝║╣   ╠╩╗╠╦╝╚═╗║║║╠═╣  ╠═╣╠═╣╠╦╝║╣   ╠╩╗╠╦╝╚═╗║║║╠═╣      ]],
  [[  ╩ ╩╩ ╩╩╚═╚═╝  ╩ ╩╩╚═╚═╝╝╚╝╩ ╩  ╩ ╩╩ ╩╩╚═╚═╝  ╩ ╩╩╚═╚═╝╝╚╝╩ ╩      ]],
  [[                                                                       ]],
  [[  ╦╔═╦═╗╔═╗╔╗╔╔═╗  ╦╔═╦═╗╔═╗╔╗╔╔═╗  ╦ ╦╔═╗╦═╗╔═╗  ╦ ╦╔═╗╦═╗╔═╗      ]],
  [[  ╠╩╗╠╦╝╚═╗║║║╠═╣  ╠╩╗╠╦╝╚═╗║║║╠═╣  ╠═╣╠═╣╠╦╝║╣   ╠═╣╠═╣╠╦╝║╣       ]],
  [[  ╩ ╩╩╚═╚═╝╝╚╝╩ ╩  ╩ ╩╩╚═╚═╝╝╚╝╩ ╩  ╩ ╩╩ ╩╩╚═╚═╝  ╩ ╩╩ ╩╩╚═╚═╝      ]],
  [[                                                                       ]],
  [[    ╦ ╦╔═╗╦═╗╔═╗  ╦═╗╔═╗╔╦╗╔═╗  ╦ ╦╔═╗╦═╗╔═╗  ╦═╗╔═╗╔╦╗╔═╗             ]],
  [[    ╠═╣╠═╣╠╦╝║╣   ╠╦╝╠═╣║║║╠═╣  ╠═╣╠═╣╠╦╝║╣   ╠╦╝╠═╣║║║╠═╣             ]],
  [[    ╩ ╩╩ ╩╩╚═╚═╝  ╩╚═╩ ╩╩ ╩╩ ╩  ╩ ╩╩ ╩╩╚═╚═╝  ╩╚═╩ ╩╩ ╩╩ ╩             ]],
  [[                                                                       ]],
  [[    ╦═╗╔═╗╔╦╗╔═╗  ╦═╗╔═╗╔╦╗╔═╗  ╦ ╦╔═╗╦═╗╔═╗  ╦ ╦╔═╗╦═╗╔═╗             ]],
  [[    ╠╦╝╠═╣║║║╠═╣  ╠╦╝╠═╣║║║╠═╣  ╠═╣╠═╣╠╦╝║╣   ╠═╣╠═╣╠╦╝║╣              ]],
  [[    ╩╚═╩ ╩╩ ╩╩ ╩  ╩╚═╩ ╩╩ ╩╩ ╩  ╩ ╩╩ ╩╩╚═╚═╝  ╩ ╩╩ ╩╩╚═╚═╝             ]],
  [[                                                                       ]],
  [[                                                                       ]],
}
-- Define custom color
    vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#6A5ACD" })  -- Orange color
    dashboard.section.header.opts = {
      position = "center",
      hl = "AlphaHeader",
    }
-- Adjust margin to center content
    dashboard.config.opts.margin = 45  -- Increase this number to center more
    alpha.setup(dashboard.config)
    alpha.setup(dashboard.opts)
  end,
}

