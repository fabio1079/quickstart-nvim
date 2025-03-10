require("formatter").setup({
  filetype = {
    javascript = { require("formatter.filetypes.javascript").prettier },
    typescript = { require("formatter.filetypes.typescript").prettier },
    css = { require("formatter.filetypes.css").prettier },
    html = { require("formatter.filetypes.html").prettier },
    lua = { require("formatter.filetypes.lua").stylua },
    scss = {
      function()
        return {
          exe = "prettier",
          args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
          stdin = true,
        }
      end,
    },
  },
})
