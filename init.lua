vim.o.tabstop = 4      -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4  -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4   -- Number of spaces inserted when indenting

-- Disable linting for missing doc comments in PHP
vim.g.syntastic_php_phpcs_args = "--standard=Squiz --sniffs=PHPDocFormatting --ignore=PHPCompatibility.PHP.NewFunctions.PHP80.ltrim_whitespace PHPCompatibility.PHP.NewFunctions.PHP80.ltrim_whitespace PHPCompatibility.PHP.NewFunctions.PHP80.ltrim_whitespace"
