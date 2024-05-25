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
        end
    },
    M
}
