local __MODULE__ = {}

__MODULE__.linox_briefing = {
  init_update_count = 120,
  planet = "linox-planet_linox",
  init = [[
    game.simulation.camera_position = {0, 0}

    for x = -20, 20, 1 do
      for y = -15, 15 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "linox-tile_superheated-lava"}}
      end
    end
  ]]
}

__MODULE__.linox_exploration_log_1 = {
  init_update_count = 120,
  planet = "linox-planet_linox",
  init = [[
    game.simulation.camera_position = {0, 0}

    for x = -20, 20, 1 do
      for y = -15, 15 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "linox-tile_superheated-lava"}}
      end
    end
    
    local ch = game.surfaces[1].create_entity{name = "character", position = {0, 0}}
    ch.die()
  ]]
}

__MODULE__.linox_exploration_log_2 = {
  init_update_count = 120,
  planet = "linox-planet_linox",
  init = [[
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
      name = "linox-entity_cargo-landing-pad",
      position = {0,0},
      force = "player",
      create_build_effect_smoke = false,
    }
  ]]
}

__MODULE__.linox_placement_restriction = {
  init_update_count = 120,
  planet = "nauvis",
  init = [[
    game.simulation.camera_position = {0, 0}

    local surface = game.surfaces[1]

    for x = -11, 10 do
      for y = -6, 5 do
        surface.set_tiles{{position = {x, y}, name = "linox-tile_linox-hazard-terminal-platform"}}
      end
    end

    for x = -9, 8 do
      for y = -4, 3 do
        surface.set_tiles{{position = {x, y}, name = "linox-tile_linox-terminal-platform"}}
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
      name = "linox-entity_cargo-elevator",
      position = {0, 3},
    }

    surface.create_entity{
      name = "linox-entity_fluid-elevator",
      position = {2, 3},
    }

    surface.create_entity{
      name = "linox-entity_turbo-pump",
      position = {4, 3},
    }

    surface.create_entity{
      name = "solar-panel",
      position = {7.5, 3},
    }
  ]]
}

return __MODULE__