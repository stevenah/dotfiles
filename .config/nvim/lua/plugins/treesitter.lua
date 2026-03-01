return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    main = "nvim-treesitter",
    opts = {
      ensure_installed = {
        "python", "typescript", "tsx", "javascript",
        "html", "css", "json", "yaml", "toml", "markdown",
        "markdown_inline", "lua", "vim", "vimdoc", "bash",
        "regex", "gitcommit", "diff",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {},
    config = function()
      local ts_repeat = require("nvim-treesitter-textobjects.repeatable_move")
      local select = require("nvim-treesitter-textobjects.select")
      local move = require("nvim-treesitter-textobjects.move")

      -- Text object selection
      local map = vim.keymap.set
      local function sel(key, query)
        map({ "x", "o" }, key, function() select.select_textobject(query, "textobjects") end)
      end
      sel("af", "@function.outer")
      sel("if", "@function.inner")
      sel("ac", "@class.outer")
      sel("ic", "@class.inner")
      sel("aa", "@parameter.outer")
      sel("ia", "@parameter.inner")

      -- Movement
      map({ "n", "x", "o" }, "]f", function() move.goto_next_start("@function.outer", "textobjects") end, { desc = "Next function" })
      map({ "n", "x", "o" }, "]c", function() move.goto_next_start("@class.outer", "textobjects") end, { desc = "Next class" })
      map({ "n", "x", "o" }, "[f", function() move.goto_previous_start("@function.outer", "textobjects") end, { desc = "Prev function" })
      map({ "n", "x", "o" }, "[c", function() move.goto_previous_start("@class.outer", "textobjects") end, { desc = "Prev class" })
    end,
  },
}
