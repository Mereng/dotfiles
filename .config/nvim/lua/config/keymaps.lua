vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>")
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("n", "<leader>q", ":qa<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>r", function()
    return ":IncRename " .. vim.fn.expand("<cword>")
  end, { desc = "LSP Rename", expr = true })

