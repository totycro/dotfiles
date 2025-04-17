-- neovim plugin: nvim-lspconfig

return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'j-hui/fidget.nvim',
        'tamago324/nlsp-settings.nvim',
        -- 'rafamadriz/friendly-snippets',
        'L3MON4D3/LuaSnip',
        'nanotee/sqls.nvim',
        'nvim-telescope/telescope.nvim',
    },
    ft = {
        "bash",
        "css",
        "dockerfile",
        "go",
        "html",
        "json",
        "jsonc",
        "lua",
        "markdown",
        "python",
        "sh",
        "sql",
        "yaml",
    },
    config = function()
        -- Install LSP servers
        local servers = {
            bashls = {},
            cssls = {},
            dockerls = {},
            gopls = {},
            html = {},
            jsonls = {},
            lua_ls = {
                Lua = {
                    workspace = { checkThirdParty = false },
                    telemetry = { enable = false },
                    diagnostics = { globals = { 'vim' } },
                },
            },
            marksman = {},
            pylsp = {},
            ruff = {},
            sqls = {},
        }

        -- Language servers
        local lspconfig = require('lspconfig')
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

        -- nlsp-settings for local settings
        local nlspsettings = require('nlspsettings')

        nlspsettings.setup({
            config_home = vim.fn.stdpath('config') .. '/nlsp-settings',
            local_settings_dir = '.nlsp-settings',
            local_settings_root_markers_fallback = { '.git' },
            append_default_schemas = true,
            loader = 'json'
        })

        -- Setup Mason so it can manage external tooling
        local mason = require('mason')
        mason.setup()
        local mason_lspconfig = require('mason-lspconfig')
        mason_lspconfig.setup {
            ensure_installed = vim.tbl_keys(servers),
        }
        mason_lspconfig.setup_handlers {
            function(server_name)
                lspconfig[server_name].setup {
                    capabilities = capabilities,
                    -- on_attach = on_attach,
                    settings = servers[server_name],
                }
            end,
        }

        -- Manually set up sqls
        lspconfig.sqls.setup {
            on_attach = function(client, bufnr)
                require('sqls').on_attach(client, bufnr)
            end
        }

        lspconfig.ruff.setup({
            init_options = {
                settings = {
                    logLevel = 'trace',
                    logFile = '/tmp/rufflsp.log',
                    root_dir = "/home/mallinger/git/product-data/workflows",
                    rootDir = "/home/mallinger/git/product-data/workflows",
                    configuration = "/home/mallinger/git/product-data/workflows/pyproject.toml",
                    organizeImports = false,
                    organize_imports = false,

                }
            }
        })
        vim.lsp.set_log_level("debug")

        -- LSP status info
        require("fidget").setup()

        -- LSP keymaps
        vim.keymap.set("n", '<Leader>lI', ":Mason<CR>", { desc = "Mason LSP installer" })
        vim.keymap.set("n", '<Leader>li', ":LspInfo<CR>", { desc = "LSP Info" })
        vim.keymap.set("n", '<Leader>ls', ":LspStart<CR>", { desc = "LSP start" })
        vim.keymap.set("n", '<Leader>lR', ":LspRestart<CR>", { desc = "Restart LSP" })
        vim.keymap.set("n", '<Leader>lS', ":LspStop<CR>", { desc = "LSP stop" })
        vim.keymap.set("n", '<Leader>rn', vim.lsp.buf.rename, { desc = "LSP rename" })
        vim.keymap.set("n", '<Leader>lf', vim.lsp.buf.format, { desc = "LSP format buffer" })
        vim.keymap.set("n", '<Leader>la', vim.lsp.buf.code_action, { desc = "LSP code-action" })
        vim.keymap.set("n", 'K', vim.lsp.buf.hover, { desc = "Show docs" })
        vim.keymap.set("n", '[d', vim.diagnostic.goto_prev, { desc = "Diagnostics, goto previous" })
        vim.keymap.set("n", ']d', vim.diagnostic.goto_next, { desc = "Diagnostics, goto next" })
        vim.keymap.set({ "n", "i" }, '<C-s>', vim.lsp.buf.signature_help, { desc = "Show signature" })
        -- See trouble
        -- gD = { vim.lsp.buf.declaration, "Goto declaration" },
        -- gd = { vim.lsp.buf.definition, "Goto definition" },
        -- gi = { vim.lsp.buf.implementation, "Goto implementation" },
        -- gr = { vim.lsp.buf.references, "references" },


        -- autoformat only .py file for now
        vim.api.nvim_create_augroup('AutoFormatting', {})
        --vim.api.nvim_create_autocmd('BufWritePre', {
        --    pattern = '*.py',
        --    group = 'AutoFormatting',
        --    callback = function()
        --        vim.lsp.buf.format({ async = true })
        --    end,
        --})
    end,
}
