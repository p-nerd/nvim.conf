vim.o.tabstop = 4      -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4  -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4   -- Number of spaces inserted when indenting

-- Disable linting for missing doc comments in PHP
-- vim.g.syntastic_php_phpcs_args = "--standard=Squiz --sniffs=PHPDocFormatting --ignore=PHPCompatibility.PHP.NewFunctions.PHP80.ltrim_whitespace PHPCompatibility.PHP.NewFunctions.PHP80.ltrim_whitespace PHPCompatibility.PHP.NewFunctions.PHP80.ltrim_whitespace"

vim.o.relativenumber = true;

-- Map jk to exit Insert mode and return to Normal mode in Insert mode
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, silent = true })

vim.opt.spelllang = "en_us";
vim.opt.spell = true;
vim.opt.spellfile = "/Users/shihab/.config/nvim/lua/custom/spell/en.utf-8.add"

vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
