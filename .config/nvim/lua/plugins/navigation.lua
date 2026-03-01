return {
  {
    "stevearc/oil.nvim",
    lazy = false,
    dependencies = { "echasnovski/mini.icons" },
    opts = {
      view_options = { show_hidden = true },
      columns = { "icon" },
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
    },
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
      { "<leader>-", "<cmd>Oil .<cr>", desc = "Open cwd in Oil" },
    },
  },
}
