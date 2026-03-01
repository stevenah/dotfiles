local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Highlight on yank
autocmd("TextYankPost", {
  group = augroup("highlight-yank", { clear = true }),
  callback = function() vim.hl.on_yank() end,
})

-- Resize splits on window resize
autocmd("VimResized", {
  group = augroup("resize-splits", { clear = true }),
  callback = function() vim.cmd("tabdo wincmd =") end,
})

-- Go to last location when opening a buffer
autocmd("BufReadPost", {
  group = augroup("last-loc", { clear = true }),
  callback = function(event)
    local mark = vim.api.nvim_buf_get_mark(event.buf, '"')
    local lcount = vim.api.nvim_buf_line_count(event.buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Close certain filetypes with q
autocmd("FileType", {
  group = augroup("close-with-q", { clear = true }),
  pattern = { "help", "man", "qf", "checkhealth", "lspinfo" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- LSP keymaps on attach
autocmd("LspAttach", {
  group = augroup("lsp-attach", { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc, mode)
      mode = mode or "n"
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
    end
    map("gd", vim.lsp.buf.definition, "Go to definition")
    map("gr", vim.lsp.buf.references, "References")
    map("gI", vim.lsp.buf.implementation, "Go to implementation")
    map("gy", vim.lsp.buf.type_definition, "Type definition")
    map("K", vim.lsp.buf.hover, "Hover documentation")
    map("gD", vim.lsp.buf.declaration, "Go to declaration")
    map("<leader>ca", vim.lsp.buf.code_action, "Code action", { "n", "v" })
    map("<leader>cr", vim.lsp.buf.rename, "Rename symbol")
  end,
})
