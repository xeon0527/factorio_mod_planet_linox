game.simulation.camera_position = {0, 0}

local surface = game.surfaces[1]

for x = -11, 10 do
  for y = -6, 5 do
    surface.set_tiles{{position = {x, y}, name = "linox-tile_linox-hazard-facility-platform"}}
  end
end

for x = -9, 8 do
  for y = -4, 3 do
    surface.set_tiles{{position = {x, y}, name = "linox-tile_linox-facility-platform"}}
  end
end

surface.create_entity{
  name = "accumulator",
  position = {-5, -2},
}

surface.create_entity{
  name = "wooden-chest",
  position = {-3, -2},
}

surface.create_entity{
  name = "iron-chest",
  position = {-1, -2},
}

surface.create_entity{
  name = "steel-chest",
  position = {1, -2},
}

surface.create_entity{
  name = "storage-tank",
  position = {4, -2},
}

surface.create_entity{
  name = "radar",
  position = {-7, 1},
}

surface.create_entity{
  name = "active-provider-chest",
  position = {-4, 1},
}

surface.create_entity{
  name = "passive-provider-chest",
  position = {-2, 1},
}

surface.create_entity{
  name = "storage-chest",
  position = {0, 1},
}

surface.create_entity{
  name = "buffer-chest",
  position = {2, 1},
}

surface.create_entity{
  name = "requester-chest",
  position = {4, 1},
}

surface.create_entity{
  name = "linox-building_core-roboport",
  position = {7, 2},
}