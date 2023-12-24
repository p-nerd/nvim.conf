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
                "js-debug-adapter",
                -- "emmet-ls",
                -- PHP
                "intelephense",
                "phpcs",
                "phpcbf",
                -- Go
                "gopls",
                -- Lua
                "lua-language-server"
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
                "md",
                "css"
            }
            return opts
        end
    },
    {
        "mfussenegger/nvim-dap",
        config = function(_, _)
            require "custom.configs.dap"
            require("core.utils").load_mappings("dap")
        end
    },
    {
        "rcarriga/nvim-dap-ui",
        event = "VeryLazy",
        dependencies = "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        event = "VeryLazy",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
        },
        opts = {
            handlers = {}
        },
    },
    {
        "NvChad/nvim-colorizer.lua",
        opts = {
            user_default_options = {
                tailwind = true,
            },
        },
    },
    -- Go
    {
        "dreamsofcode-io/nvim-dap-go",
        ft = "go",
        dependencies = "mfussenegger/nvim-dap",
        config = function(_, opts)
            require("dap-go").setup(opts)
            require("core.utils").load_mappings("dap_go")
        end
    },
    {
        "olexsmir/gopher.nvim",
        ft = "go",
        config = function(_, opts)
            require("gopher").setup(opts)
            require("core.utils").load_mappings("gopher")
        end,
        build = function()
            vim.cmd [[silent! GoInstallDeps]]
        end,
    },
}
return plugins
