return {
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    config = function()
      local ls = require("luasnip")
      local s = ls.snippet
      local t = ls.text_node
      local i = ls.insert_node
      local f = ls.function_node

      -- 1. THE LOGIC: Determine if cursor is inside a math zone
      local function in_mathzone()
        local line = vim.api.nvim_get_current_line()
        local col = vim.api.nvim_win_get_cursor(0)[2]

        local before = line:sub(1, col)
        local after = line:sub(col + 1)

        -- Check for display math ($$...$$)
        -- Remove escaped dollars first to avoid false positives
        before = before:gsub("\\%$", "")
        after = after:gsub("\\%$", "")

        local _, count_before_double = before:gsub("%$%$", "")
        local _, count_after_double = after:gsub("%$%$", "")

        if count_before_double % 2 == 1 and count_after_double % 2 == 1 then
           return true
        end

        -- Check for inline math ($...$)
        -- Remove double dollars so we only count singles
        before = before:gsub("%$%$", "")
        after = after:gsub("%$%$", "")

        local _, count_before = before:gsub("%$", "")
        local _, count_after = after:gsub("%$", "")

        return (count_before % 2 == 1) and (count_after % 2 == 1)
      end

      -- 2. THE WRAPPER: A helper function to apply the condition automatically
      -- This saves you from writing "condition = in_mathzone" on every snippet
      local function math_s(args, nodes)
        local final_args = { 
          condition = in_mathzone, 
          snippetType = "autosnippet" 
        }
        
        -- If args is just a string (the trigger), map it to trig
        if type(args) == "string" then
          final_args.trig = args
        else
          -- Merge custom options (like wordTrig) with our defaults
          for k, v in pairs(args) do final_args[k] = v end
        end
        
        return s(final_args, nodes)
      end

      ls.config.set_config({
        history = true,
        updateevents = "TextChanged,TextChangedI",
        enable_autosnippets = true,
      })

      ls.add_snippets("markdown", {
        -- BASIC MATH --
        -- ff -> \frac{num}{den}
        math_s({ trig = "/" }, {
          t("\\frac{"), i(1), t("}{"), i(2), t("}")
        }),

        -- ** -> \cdot
        math_s({ trig = "dt", wordTrig = false, regTrig = false, trigEngine = "plain" }, {
          t("\\cdot ")
        }),

        -- sq -> \sqrt{x}
        math_s("sq", {
          t("\\sqrt{"), i(1), t("}")
        }),

        -- nsq -> \sqrt[n]{x}
        math_s("nsq", {
          t("\\sqrt["), i(1), t("]{"), i(2), t("}")
        }),

        -- ee -> ^{x}
        math_s("^", {
          t("^{"), i(1), t("}")
        }),

        -- __ -> _{x}
        math_s({ trig = "_", wordTrig = false, regTrig = false, trigEngine = "plain" }, {
          t("_{"), i(1), t("}")
        }),

        -- (( -> \left( ... \right)
        math_s({ trig = "((", wordTrig = false, regTrig = false, trigEngine = "plain" }, {
          t("\\left( "), i(1), t(" \\right)")
        }),

        -- != -> \neq
        math_s("!=", { t("\\neq") }),

        -- GREEK LETTERS --
        math_s(";a", { t("\\alpha") }),
        math_s(";b", { t("\\beta") }),
        math_s(";g", { t("\\gamma") }),
        math_s(";t", { t("\\theta") }),
        math_s(";m", { t("\\mu") }),
        math_s(";s", { t("\\sigma") }),
        math_s(";p", { t("\\pi") }),
        math_s(";l", { t("\\lambda") }),
        math_s(";e", { t("\\epsilon") }),
        math_s(";f", { t("\\phi") }),
        math_s(";d", { t("\\delta") }),

        -- CALCULUS --
        math_s("df", {
          t("\\frac{d}{dx} ")
        }),

        math_s("pd", {
          t("\\frac{\\partial "), i(1, "f"), t("}{\\partial "), i(2, "x"), t("}")
        }),

        math_s("int", {
          t("\\int "), i(1), t(" dx")
        }),

        math_s("dint", {
          t("\\int_{"), i(1, "a"), t("}^{"), i(2, "b"), t("} "), i(3), t(" dx")
        }),

        math_s("sm", {
          t("\\sum_{"), i(1, "i=1"), t("}^{"), i(2, "n"), t("} ")
        }),

        math_s("PP", {
          t("\\prod_{"), i(1, "i=1"), t("}^{"), i(2, "n"), t("} ")
        }),

        math_s("lt", {
          t("\\lim_{"), i(1, "x"), t(" \\to "), i(2, "\\infty"), t("} ")
        }),

        -- LINEAR ALGEBRA --
        math_s("vv", { t("\\vec{"), i(1), t("}") }),
        math_s("bm", { t("\\mathbf{"), i(1), t("}") }),
        math_s("mt", { t("\\begin{bmatrix} &"),i(1),t(" \\\\ &  \\end{bmatrix}")}),
        math_s("pmt", { t("\\begin{pmatrix} "), i(1), t(" \\end{pmatrix}") }),
        math_s("det", { t("\\begin{vmatrix} "), i(1), t(" \\end{vmatrix}") }),
        math_s("TT", { t("^{T}") }),
        math_s("*", { t("\\times ") }),

        -- PROBABILITY & STATISTICS --
        math_s({ trig = "p(", regTrig = false, trigEngine = "plain" }, { 
          t("P("), i(1), t(")") 
        }),

        math_s({ trig = "p/", regTrig = false, trigEngine = "plain" }, { 
          t("P("), i(1), t(" | "), i(2), t(")") 
        }),

        math_s("pex", { t("E["), i(1), t("]") }),
        math_s("var", { t("\\mathrm{Var}("), i(1), t(")") }),
        math_s("cov", { t("\\mathrm{Cov}("), i(1), t(", "), i(2), t(")") }),
        math_s("std", { t("\\mathrm{Std}("), i(1), t(")") }),
        math_s("bnm", { t("\\binom{"), i(1), t("}{"), i(2), t("}") }),

        -- SETS & LOGIC --
        math_s(";in", { t("\\in ") }),
        math_s({ trig = "!in", wordTrig = false, regTrig = false, trigEngine = "plain" }, { t("\\notin ") }),
        math_s("emp", { t("\\emptyset") }),
        math_s("uu", { t("\\cup ") }),
        math_s("nn", { t("\\cap ") }),
        math_s("sub", { t("\\subset ") }),
        math_s(";and", { t("\\wedge ") }),
        math_s("or", { t("\\vee ") }),

        -- SPECIAL FUNCTIONS & SYMBOLS --
        math_s("lg", { t("\\log_{}("), i(1), t(")") }),
        math_s("ln", { t("\\ln("), i(1), t(")") }),
        math_s("inf", { t("\\infty") }),
        math_s({ trig = "<=", wordTrig = false, regTrig = false, trigEngine = "plain" }, { t("\\leq ") }),
        math_s({ trig = ">=", wordTrig = false, regTrig = false, trigEngine = "plain" }, { t("\\geq ") }),
        math_s({ trig = "~=", wordTrig = false, regTrig = false, trigEngine = "plain" }, { t("\\approx ") }),
        math_s({ trig = "+-", wordTrig = false, regTrig = false, trigEngine = "plain" }, { t("\\pm ") }),

        -- FORMATTING --
        -- Note: We use standard 's' here because these create the math zone itself,
        -- so they should trigger OUTSIDE the math zone.
        s({ trig = "dm", snippetType = "autosnippet" }, {
          t({ "\\[", "" }), i(1), t({ "", "\\]" })
        }),

        s({ trig = "$$", wordTrig = false, regTrig = false, trigEngine = "plain", snippetType = "autosnippet" }, { 
          t("$"), i(1), t("$") 
        }),
      })

      vim.keymap.set({ "i", "s" }, "<Tab>", function()
        if ls.expand_or_jumpable() then
          ls.expand_or_jump()
        else
          vim.api.nvim_feedkeys(
            vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false
          )
        end
      end, { silent = true })

      vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
        if ls.jumpable(-1) then
          ls.jump(-1)
        end
      end, { silent = true })
    end,
  }
}
