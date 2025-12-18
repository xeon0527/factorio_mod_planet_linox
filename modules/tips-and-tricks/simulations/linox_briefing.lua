game.simulation.camera_position = {0, 0}

for x = -20, 20, 1 do
  for y = -15, 15 do
    game.surfaces[1].set_tiles{{position = {x, y}, name = "linox-tile_superheated-lava"}}
  end
end