local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true }},
    ["j"] = {"jzz", "move down and center"},
    ["k"] = {"kzz", "move up and center"},
    ["J"] = {"5jzz", "move down faster"},
    ["K"] = {"5kzz", "move up faster"},
    ["<C-j>"] = {"i<CR><ESC>" ,"New line"},
  },
}

M.lspconfig = {
  plugin = true,

  -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions

  n = {
    ["<leader>W"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "LSP hover",
    },

    ["<leader>df"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Floating diagnostic",
    },
  },
}

return M;
