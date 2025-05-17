vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.opt.relativenumber = true

require("config.lazy")

require("config.keymaps")

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
