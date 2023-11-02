local opts = {buffer = 0, remap = false}

-- uses Rust-Tools RustDebuggables command instead of dap.continue
vim.keymap.set('n', '<F5>', "<cmd>RustDebuggables<CR>", opts)
