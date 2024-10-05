return {
  "b0o/schemastore.nvim",
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig").sourcekit.setup {
        cmd = { "/usr/bin/sourcekit-lsp" }, -- Asegúrate de que esta ruta sea correcta
        filetypes = { "swift" }, -- Solo para archivos Swift
        root_dir = require("lspconfig").util.root_pattern("*.xcodeproj", "*.swift"),
        on_attach = function(_, bufnr)
          local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
          local opts = { noremap = true, silent = true }
          buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
          buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
        end,
      }

      -- Configuración para Pyright (Python)
      require("lspconfig").pyright.setup {
        on_attach = function(client, bufnr)
          local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
          local opts = { noremap = true, silent = true }
          buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
          buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
        end,
      }

      -- Configuración para TypeScript Language Server (JavaScript/TypeScript)
      require("lspconfig").ts_ls.setup {
        on_attach = function(client, bufnr)
          local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
          local opts = { noremap = true, silent = true }
          buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
          buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
        end,
      }

      -- Configuración para Lua Language Server
      require("lspconfig").lua_ls.setup {
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT", -- O 'Lua 5.1', según lo que necesites
            },
            diagnostics = {
              globals = { "vim" }, -- Si usas Neovim
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
          },
        },
      }

      -- Configuración para XML Language Server
      require("lspconfig").lemminx.setup {
        filetypes = { "xml" },
      }

      -- Configuración para JSON Language Server
      require("lspconfig").jsonls.setup {
        cmd = { "vscode-json-languageserver", "--stdio" }, -- Asegúrate de que el servidor LSP para JSON esté instalado
        filetypes = { "json" },
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
          },
        },
      }
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require "cmp"
      cmp.setup {
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body) -- Si estás usando LuaSnip
          end,
        },
        mapping = {
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          ["<Up>"] = cmp.mapping.select_next_item(),
          ["<Down>"] = cmp.mapping.select_next_item(),
          ["<CR>"] = cmp.mapping.confirm { select = true },
        },
        sources = {
          { name = "nvim_lsp" },
        },
      }
    end,
  },
  "hrsh7th/cmp-nvim-lsp",
  "L3MON4D3/LuaSnip",
}
