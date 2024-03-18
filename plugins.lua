local plugins = {
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end,
    },
    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                -- C/C++
                "clangd",
                "clang-format",
                "codelldb",
                -- JavaScript/TypeScript
                "typescript-language-server",
                "tailwindcss-language-server",
                "eslint-lsp",
                "prettierd",
                "astro-language-server",
                "css-lsp",
                -- PHP
                "intelephense",
                "phpcs",
                -- Go
                "gopls",
                -- Lua
                "lua-language-server",
                -- Elixir
                "elixir-ls",
                -- Ruby
                "ruby-lsp"
            }
        }
    },
    {
        "nvimtools/none-ls.nvim",
        event = "VeryLazy",
        opts = function()
            return require "custom.configs.null-ls"
        end,
    },
    {
        "windwp/nvim-ts-autotag",
        ft = {
            "html",
            "astro",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
        },
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function()
            local opts = require "plugins.configs.treesitter"
            opts.ensure_installed = {
                "lua",
                "javascript",
                "typescript",
                "tsx",
                "go",
                "astro",
                "css",
                "elixir",
                "prisma"
            }
            return opts
        end
    },
    {
        "NvChad/nvim-colorizer.lua",
        opts = {
            user_default_options = {
                tailwind = true,
            },
        },
    },
}
return plugins
