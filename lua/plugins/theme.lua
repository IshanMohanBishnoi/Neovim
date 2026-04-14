return {
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    config = function()
      require("onedark").setup({
        style = "deep",
        transparent = true,
        term_colors = true,

        code_style = {
          functions = "bold",
          comments = "italic"
        },

        lualine = {
          transparent = true,
        },

        diagnostics = {
          darker = true,
          undercurl = true,
          background = true,
        },
      })

     vim.cmd.colorscheme("onedark")

      -- Cursor line + number overrides (theme-safe)
      vim.opt.cursorline = true
      vim.api.nvim_set_hl(0, "CursorLineNr", {
        fg = "#FFD700",
        bold = true,
      })
      vim.api.nvim_set_hl(0, "CursorLine", {
        bg = "#2c313c",
      })
      vim.api.nvim_set_hl(0, "LineNr", { fg = "#5B8FBF" }) -- for relative line no to be brighter

      -- Improve LSP float visibility
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#5c6370", bg = "none" })
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "onedark",
          globalstatus = true,
        },
      })
    end,
  },
}
