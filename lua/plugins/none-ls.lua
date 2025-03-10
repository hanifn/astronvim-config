-- Customize None-ls sources

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    local wp = require "wordpress"
    local lspconfig = require "lspconfig"
    local null_ls = require "null-ls"

    -- setup intelephense for PHP, WordPress and WooCommerce development
    lspconfig.intelephense.setup(wp.intelephense)

    -- opts variable is the default configuration table for the setup function call
    -- local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics

    -- Only insert new sources, do not replace the existing ones
    -- (If you wish to replace, use `opts.sources = {}` instead of the `list_insert_unique` function)
    opts.sources = require("astrocore").list_insert_unique(opts.sources, {
      -- Set a formatter
      -- null_ls.builtins.formatting.stylua,
      -- null_ls.builtins.formatting.prettier,
      null_ls.builtins.diagnostics.phpcs.with(wp.null_ls_phpcs),
      null_ls.builtins.formatting.phpcbf.with(wp.null_ls_phpcs),
    })
  end,
}
