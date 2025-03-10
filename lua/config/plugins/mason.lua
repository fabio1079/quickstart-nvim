require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = { "ts_ls", "lua_ls" },
})

require("mason-tool-installer").setup({
  ensure_installed = {
    "typescript-language-server",
    "lua-language-server",
    "prettier",
    "stylua",
  },
})

