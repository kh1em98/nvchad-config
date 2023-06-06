---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true }},
    ["j"] = {"jzz", "move down and center"},
    ["k"] = {"kzz", "move up and center"},
    ["J"] = {"5jzz", "move down faster"},
    ["K"] = {"5kzz", "move up faster"},
    ["<C-j>"] = {"i<CR><ESC>" ,"New line"},
  }
}

return M;
