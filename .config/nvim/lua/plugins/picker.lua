return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      picker = { enabled = true },
      notifier = { enabled = true },
      dashboard = { enabled = true },
      indent = { enabled = true },
      scope = { enabled = true },
      input = { enabled = true },
      scroll = { enabled = true },
    },
    keys = {
      -- Find
      { "<leader>ff", function() Snacks.picker.files() end, desc = "Find files" },
      { "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep" },
      { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
      { "<leader>fh", function() Snacks.picker.help() end, desc = "Help tags" },
      { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent files" },
      { "<leader>fs", function() Snacks.picker.smart() end, desc = "Smart find" },
      { "<leader>fw", function() Snacks.picker.grep_word() end, desc = "Grep word", mode = { "n", "x" } },
      -- Git
      { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git log" },
      -- Search
      { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
      { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
      { "<leader>sc", function() Snacks.picker.command_history() end, desc = "Command history" },
    },
  },
}
