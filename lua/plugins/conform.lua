-- Autoformat
return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = 'Format buffer',
    },
  },
  opts = {
    notify_on_error = false,

    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = { c = true, cpp = true }
      if disable_filetypes[vim.bo[bufnr].filetype] then
        return nil
      else
        return {
          timeout_ms = 500,
          lsp_format = 'fallback',
        }
      end
    end,

    formatters = {
      prettier = {
        -- Require a config file for prettier to run.
        require_cwd = true,
      },
    },

    formatters_by_ft = {
      lua = { 'stylua' },
      javascript = { 'biome', 'prettier', 'eslint_d', stop_after_first = true },
      typescript = { 'biome', 'prettier', 'eslint_d', stop_after_first = true },
      javascriptreact = { 'biome', 'prettier', 'eslint_d', stop_after_first = true },
      typescriptreact = { 'biome', 'prettier', 'eslint_d', stop_after_first = true },
      vue = { 'prettier', 'eslint_d', stop_after_first = true },
      html = { 'prettier', 'eslint_d', stop_after_first = true },
      css = { 'prettier', 'eslint_d', stop_after_first = true },
      json = { 'prettier', 'eslint_d', stop_after_first = true },
      yaml = { 'prettier', stop_after_first = true },
    },
  },
}
