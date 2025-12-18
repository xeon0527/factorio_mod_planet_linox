require("__linox__/scripts/util")
    
local surface = game.surfaces[1]
game.simulation.camera_position = {0, 0}
game.simulation.camera_zoom = 0.7

for x = -40, 40 do
  for y = -25, 25 do
    surface.set_tiles{{position = {x, y}, name = "linox-tile_superheated-lava"}}
  end
end

local center_size = 13
local modify_tiles = {};
for xx = -center_size, center_size - 1 do
  for yy = -center_size, center_size - 1 do

    if xx == -center_size or xx == center_size - 1 or
        yy == -center_size or yy == center_size - 1 then
      table.insert(modify_tiles, {
        position = { x = xx, y = yy },
        name = "linox-tile_linox-hazard-terminal-platform"
      });
    else
      table.insert(modify_tiles, {
        position = { x = xx, y = yy },
        name = "linox-tile_linox-terminal-platform"
      });
    end
  end
end
surface.set_tiles(modify_tiles);

surface.create_entity{
  name = "linox-building_cargo-landing-pad",
  position = {0,0},
  force = "player",
  create_build_effect_smoke = false,
}
  
UTIL_ensure_entity(surface, { name = "linox-special_circuit-pole", position = {-2,2}})