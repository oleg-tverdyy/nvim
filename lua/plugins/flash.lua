return {
  "folke/flash.nvim",
  event = "VeryLazy",
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          x = {
            ["s"] = {
              function() require("flash").jump() end,
              desc = "Flash",
            },
            ["R"] = {
              function() require("flash").treesitter_search() end,
              desc = "Treesitter Search",
            },
            ["S"] = {
              function() require("flash").treesitter() end,
              desc = "Flash Treesitter",
            },
          },
          o = {
            ["r"] = {
              function() require("flash").remote() end,
              desc = "Remote Flash",
            },
            ["R"] = {
              function() require("flash").treesitter_search() end,
              desc = "Treesitter Search",
            },
            ["s"] = {
              function() require("flash").jump() end,
              desc = "Flash",
            },
            ["S"] = {
              function() require("flash").treesitter() end,
              desc = "Flash Treesitter",
            },
          },
          n = {
            ["s"] = {
              function() require("flash").jump() end,
              desc = "Flash",
            },
            ["S"] = {
              function() require("flash").treesitter() end,
              desc = "Flash Treesitter",
            },
          },
        },
      },
    },
  },
  opts = {
    modes = {
      char = {
        enabled = true, -- Habilitar el modo de carácter
        jump = {
          key = "s", -- Tecla para saltar
        },
      },
      search = {
        enabled = true, -- Habilitar el modo de búsqueda
        mode = "fuzzy", -- Tipo de búsqueda (puede ser 'exact', 'fuzzy', etc.)
        jump = {
          key = "f", -- Tecla para saltar en el modo de búsqueda
        },
      },
      treesitter = {
        enabled = true, -- Habilitar el modo de Tree-sitter
        highlight = {
          enabled = true, -- Habilitar resaltado en Tree-sitter
        },
      },
    },
    label = { -- Cambiar de `highlight.label` a `label`
      fg = "#ffffff", -- Color de primer plano para las etiquetas
      bg = "#ff0000", -- Color de fondo para las etiquetas
    },
    highlight = {
      backdrop = true, -- Habilitar resaltado de fondo
    },
    search = {
      max_flashes = 10, -- Número máximo de resaltados
    },
    jump = {
      default = {
        jump = {
          key = "s", -- Mapeo de teclas para saltar
        },
      },
    },
  },
}
