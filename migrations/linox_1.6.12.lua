---@diagnostic disable: cast-local-type, need-check-nil
local linox_facility = require("scripts.svc.surface.linox-facility")

local surface = linox_facility.get()
if surface then
  local tiles = {}
  for k, v in pairs(surface.find_entities_filtered{name = "linox-special_internel-pipeline"}) do
    if surface.get_tile(v.position.x - 2.0, v.position.y).name == "linox-tile_linox-corridor-edge" then
      table.insert(tiles, { position = { x = v.position.x - 2.0, y = v.position.y - 1 }, name = "linox-tile_linox-corridor"})
      table.insert(tiles, { position = { x = v.position.x - 2.0, y = v.position.y     }, name = "linox-tile_linox-corridor"})
      table.insert(tiles, { position = { x = v.position.x - 2.0, y = v.position.y + 1 }, name = "linox-tile_linox-corridor"})
    elseif surface.get_tile(v.position.x + 2.0, v.position.y).name == "linox-tile_linox-corridor-edge" then
      table.insert(tiles, { position = { x = v.position.x + 2.0, y = v.position.y - 1 }, name = "linox-tile_linox-corridor"})
      table.insert(tiles, { position = { x = v.position.x + 2.0, y = v.position.y     }, name = "linox-tile_linox-corridor"})
      table.insert(tiles, { position = { x = v.position.x + 2.0, y = v.position.y + 1 }, name = "linox-tile_linox-corridor"})
    elseif surface.get_tile(v.position.x, v.position.y - 2.0).name == "linox-tile_linox-corridor-edge" then
      table.insert(tiles, { position = { x = v.position.x - 1, y = v.position.y - 2.0 }, name = "linox-tile_linox-corridor"})
      table.insert(tiles, { position = { x = v.position.x    , y = v.position.y - 2.0 }, name = "linox-tile_linox-corridor"})
      table.insert(tiles, { position = { x = v.position.x + 1, y = v.position.y - 2.0 }, name = "linox-tile_linox-corridor"})
    elseif surface.get_tile(v.position.x, v.position.y + 2.0).name == "linox-tile_linox-corridor-edge" then
      table.insert(tiles, { position = { x = v.position.x - 1, y = v.position.y + 2.0 }, name = "linox-tile_linox-corridor"})
      table.insert(tiles, { position = { x = v.position.x    , y = v.position.y + 2.0 }, name = "linox-tile_linox-corridor"})
      table.insert(tiles, { position = { x = v.position.x + 1, y = v.position.y + 2.0 }, name = "linox-tile_linox-corridor"})
    end
  end
  surface.set_tiles(tiles)
end