game.simulation.camera_position = {0, 0}

local surface = game.surfaces[1]

for x = -11, 10 do
  for y = -6, 5 do
    surface.set_tiles{{position = {x, y}, name = "linox-tile_linox-hazard-terminal-platform"}}
  end
end

for x = -9, -4 do
  for y = -4, 3 do
    surface.set_tiles{{position = {x, y}, name = "linox-tile_linox-terminal-platform"}}
  end
end

for x = -3, 2 do
  for y = -4, 3 do
    surface.set_tiles{{position = {x, y}, name = "linox-tile_linox-corridor"}}
  end
end

for x = 3, 8 do
  for y = -4, 3 do
    surface.set_tiles{{position = {x, y}, name = "linox-tile_linox-datacenter"}}
  end
end



surface.create_entity{
  name = "small-electric-pole",
  position = {-9, -2},
}

surface.create_entity{
  name = "medium-electric-pole",
  position = {-7, -2},
}

surface.create_entity{
  name = "big-electric-pole",
  position = {-4, -2},
}

surface.create_entity{
  name = "substation",
  position = {-1, -2},
}

surface.create_entity{
  name = "small-lamp",
  position = {1, -3},
}

surface.create_entity{
  name = "arithmetic-combinator",
  position = {3, -3},
}

surface.create_entity{
  name = "decider-combinator",
  position = {5, -3},
}

surface.create_entity{
  name = "selector-combinator",
  position = {7, -3},
}



surface.create_entity{
  name = "constant-combinator",
  position = {-8, 0},
}

surface.create_entity{
  name = "power-switch",
  position = {-5, 0},
}

surface.create_entity{
  name = "programmable-speaker",
  position = {-3, 0},
}

surface.create_entity{
  name = "display-panel",
  position = {-1, 0},
}

surface.create_entity{
  name = "pipe",
  position = {1, 0},
}

surface.create_entity{
  name = "pipe-to-ground",
  position = {3, 0},
}

surface.create_entity{
  name = "pump",
  position = {5, 0},
}

surface.create_entity{
  name = "offshore-pump",
  position = {7, -1},
  direction = defines.direction.south,
}



surface.create_entity{
  name = "transport-belt",
  position = {-9, 3},
}

surface.create_entity{
  name = "underground-belt",
  position = {-7, 3},
}

surface.create_entity{
  name = "splitter",
  position = {-4, 3},
}

surface.create_entity{
  name = "inserter",
  position = {-2, 3},
}

surface.create_entity{
  name = "linox-building_cargo-elevator",
  position = {0, 3},
}

surface.create_entity{
  name = "linox-building_fluid-elevator",
  position = {2, 3},
}

surface.create_entity{
  name = "linox-building_turbo-pump",
  position = {4, 3},
}

surface.create_entity{
  name = "solar-panel",
  position = {7.5, 3},
}