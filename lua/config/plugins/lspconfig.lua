local lspconfig = require("lspconfig")

lspconfig.ts_ls.setup({})

lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      workspace = { checkThirdParty = false },
    },
  },
})
