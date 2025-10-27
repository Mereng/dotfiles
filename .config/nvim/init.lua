vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "100"

vim.opt.autoread = true
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.termguicolors = true

require("lazymngr")

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local clients = vim.lsp.get_active_clients({ bufnr = 0 })
    for _, client in pairs(clients) do
      if client.supports_method("textDocument/formatting") then
        vim.lsp.buf.format({ async = false })
        return
      end
    end
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.cmd.colorscheme("catppuccin")

-- Keybindings
vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set({ "i", "v", "x" }, "<C-s>", "<Esc>:w<CR>")
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("n", "<leader>q", ":qa<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { desc = "Rename" })
vim.keymap.set("v", "<", "<gv", { desc = "Indent left" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right" })
vim.keymap.set("n", "<leader>ch", vim.lsp.buf.hover, { desc = "LSP Hover" })
vim.keymap.set("n", "<leader>ci", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 })
end, { desc = "Inlay Hints" })
vim.keymap.set("n", "<leader>co", function()
  vim.lsp.buf.code_action({
    context = { only = { "source.toggleCompilerOptDetails" } },
  })
end, { desc = "Code Actions" })
vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "LSP format code" })

vim.diagnostic.config({ virtual_text = true })
