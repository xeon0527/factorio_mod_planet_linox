local linox_ground = require("scripts.svc.surface.linox-ground")

local __base_foundation_tile = "linox-tile_linox-terminal-platform"
local __base_border_tile = "linox-tile_linox-hazard-terminal-platform"

if linox_ground.get() then
  local surface = linox_ground.get()
  if surface.get_tile(0, 0).name ~= "linox-tile_superheated-lava" and surface.get_tile(0, 0).name == "linox-tile_linox-foundation" then
    local center_size = 13
  
    local modify_tiles = {};
    for xx = -center_size, center_size - 1 do
      for yy = -center_size, center_size - 1 do

        if xx == -center_size or xx == center_size - 1 or
            yy == -center_size or yy == center_size - 1 then
          table.insert(modify_tiles, {
            position = { x = xx, y = yy },
            name = __base_border_tile
          });
        else
          table.insert(modify_tiles, {
            position = { x = xx, y = yy },
            name = __base_foundation_tile
          });
        end
      end
    end
    surface.set_tiles(modify_tiles);
  end
end