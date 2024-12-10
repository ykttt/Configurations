-- configurations/conform.lua
--
require("conform").setup({
  formatters_by_ft = {
    c = { "astyle" },
    cpp = { "astyle" },
    lua = { "stylua" },
    nix = { "alejandra" },
    python = { "black" },
    tex = { "latexindent" },
    ["*"] = { "codespell" },
    ["_"] = { "trim_whitespace" },
  },
  default_format_opts = {
    lsp_format = "fallback",
  },
  format_after_save = {
    lsp_format = "fallback",
    timeout_ms = 500,
  },
  log_level = vim.log.levels.ERROR,
  notify_on_error = true,
  notify_no_formatters = true,
  formatters = {
    astyle = {
      args = { "suffix=none", "--indent=spaces=2", "--style=attach", "$FILENAME" },
      stdin = false,
    },
    stylua = {
      args = { "--indent-type", "Spaces", "--indent-width", "2", "$FILENAME" },
      range_args = function(self, ctx)
        return { "--range-start", ctx.range.start[1], "--range-end", ctx.range["end"][1] }
      end,
      stdin = false,
    },
    latexindent = {
      -- args = { "-y=\"defaultIndent: ' '\"", "-" },
      range_args = function(self, ctx)
        return { "-n", ctx.range.start[1] .. "-" .. ctx.range["end"][1] }
      end,
      stdin = true,
    },
  },
})
