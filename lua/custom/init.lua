vim.api.nvim_set_keymap('n', '<leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>d[', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>d]', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
  -- The following command requires plug-ins "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", and optionally "kyazdani42/nvim-web-devicons" for icon support
  vim.api.nvim_set_keymap('n', '<leader>dd', '<cmd>Telescope diagnostics<CR>', { noremap = true, silent = true })
  -- If you don't want to use the telescope plug-in but still want to see all the errors/warnings, comment out the telescope line and uncomment this:
  -- vim.api.nvim_set_keymap('n', '<leader>dd', '<cmd>lua vim.diagnostic.setloclist()<CR>', { noremap = true, silent = true })

  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      -- Enable underline, use default values
      underline = false,
      -- Enable virtual text, override spacing to 4
      virtual_text = {
        spacing = 4,
      },
      -- Use a function to dynamically turn signs off
      -- and on, using buffer local variables
      signs = function(namespace, bufnr)
        return vim.b[bufnr].show_signs == true
      end,
      -- Disable a feature
      update_in_insert = false,
    }
  )

  vim.diagnostic.config({
    virtual_text = {
      -- source = "always",  -- Or "if_many"
      prefix = '●', -- Could be '■', '▎', 'x'
    },
    severity_sort = true,
    float = {
      source = "always",  -- Or "if_many"
    },
  })
