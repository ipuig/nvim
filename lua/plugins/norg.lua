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
  ["core.completion"] = { config = { engine = "nvim-cmp", name = "[Norg]" } },
  ["core.integrations.nvim-cmp"] = {},
  ["core.concealer"] = { config = { icon_preset = "diamond" } },
  ["core.keybinds"] = {
    -- https://github.com/nvim-neorg/neorg/blob/main/lua/neorg/modules/core/keybinds/keybinds.lua
    config = {
      default_keybinds = true,
      neorg_leader = ",",
    },
  },
  ["core.dirman"] = {
    config = {
      workspaces = {
        Notes = "~/Documents/Notes",
        Work = "~/Documents/Work",
      }, default_workspace = "Notes",

    }
  },
}
M.opts = {
  load = modules,
}


return {
    { "vhyrro/luarocks.nvim", priority = 1000, config = true, }, M
}
