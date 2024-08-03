local M = {
  "nvim-neorg/neorg",
  ft = "norg",
  dependencies = {
    "vhyrro/luarocks.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-cmp",
    "nvim-lua/plenary.nvim",
  },
  -- build = ":Neorg sync-parsers",
  cmd = "Neorg",
}

local modules = {
  ["core.defaults"] = {},
  ["core.qol.toc"] = { config = { close_after_use = true } },
  ["core.completion"] = { config = { engine = "nvim-cmp", name = "[Norg]" } },
  ["core.integrations.nvim-cmp"] = {},
  ["core.concealer"] = { config = { icon_preset = "diamond" } },
  ["core.keybinds"] = {
    -- https://github.com/nvim-neorg/neorg/blob/main/lua/neorg/modules/core/keybinds/keybinds.lua
    config = {
      default_keybinds = true,
      neorg_leader = ",",
            hook = function (keybinds)
                keybinds.map("norg", "n", keybinds.leader .. "p", "<cmd>Neorg toc<cr>")
                keybinds.map("norg", "n", keybinds.leader .. "a", "<cmd>Neorg index<cr>")
                keybinds.map("norg", "n", keybinds.leader .. keybinds.leader, "<cmd>Neorg<cr>")
                keybinds.map("norg", "n", keybinds.leader .. "c", "<cmd>Neorg keybind norg core.looking-glass.magnify-code-block<cr>")
            end

    },
  },
  ["core.dirman"] = {
    config = {
      workspaces = {
        Notes = "~/Documents/Notes",
        Work = "~/Documents/Work",
        Ptest = "~/Documents/pentest_practice",
      }, default_workspace = "Notes",

    }
  },
}
M.opts = {
  load = modules,
}


return {
    { "vhyrro/luarocks.nvim", priority = 1000, config = true, },
    {
        "dhruvasagar/vim-table-mode", config = function ()
            vim.keymap.set("n", "<space>tt", "<cmd>TableModeToggle<cr>", {})
            vim.g.table_mode_corner_corner='+'
            vim.g.table_mode_header_fillchar='='

        end
    },
    {
        "3rd/image.nvim",
        event = "VeryLazy",
        dependencies = {
            {
                "nvim-treesitter/nvim-treesitter",
                build = ":TSUpdate",
                config = function()
                    require("nvim-treesitter.configs").setup({
                        ensure_installed = { "markdown" },
                        highlight = { enable = true },
                    })
                end,
            },
        },
        opts = {
            backend = "kitty",
            integrations = {
                markdown = {
                    enabled = true,
                    clear_in_insert_mode = false,
                    download_remote_images = true,
                    only_render_image_at_cursor = false,
                    filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
                },
                neorg = {
                    enabled = true,
                    clear_in_insert_mode = false,
                    download_remote_images = true,
                    only_render_image_at_cursor = false,
                    filetypes = { "norg" },
                },
            },
            max_width = nil,
            max_height = nil,
            max_width_window_percentage = nil,
            max_height_window_percentage = 50,
            kitty_method = "normal",
        },
    },
    M
}
