-- General Settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.termguicolors = true

-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.js", "*.ts", "*.css", "*.scss", "*.html" },
  callback = function()
    vim.cmd("lua vim.lsp.buf.format()")
  end,
})

-- Keybindings
vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>nt", ":NvimTreeToggle<CR>", { noremap = true, silent = true })


-- Theme
vim.cmd.colorscheme "catppuccin"
