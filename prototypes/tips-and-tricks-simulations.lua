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

__MODULE__.linox_planetary_power_network = {
  init_update_count = 120,
  planet = "linox-planet_linox",
  init = [[
    require("__core__/lualib/story")
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
      name = "linox-entity_cargo-landing-pad",
      position = {0,0},
      force = "player",
      create_build_effect_smoke = false,
    }

    for _, x in pairs({-10.5, -7.5, -4.5, -1.5, 1.5, 4.5, 7.5, 10.5}) do
      for _, y in pairs({-11.5, -8.5, 11.5, 8.5}) do
        surface.create_entity{name = "solar-panel", force = "player", position = {x,y}}
      end
    end

    local surface2 = game.create_surface("linox-surface_under-1")
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
    surface2.set_tiles(modify_tiles);

    surface2.create_entity{
      name = "linox-entity_cargo-landing-pad",
      position = {0,0},
      create_build_effect_smoke = false,
    }

    for i = -5.5, 3.5, 1 do
      surface2.create_entity{name = "turbo-transport-belt", position = {-5.5,i}, direction = defines.direction.south}
    end

    for i = -5.5, 3.5, 1 do
      surface2.create_entity{name = "turbo-transport-belt", position = {i,5.5}, direction = defines.direction.east}
    end

    for i = 5.5, -3.5, -1 do
      surface2.create_entity{name = "turbo-transport-belt", position = {5.5,i}, direction = defines.direction.north}
    end

    for i = 5.5, -3.5, -1 do
      surface2.create_entity{name = "turbo-transport-belt", position = {i,-5.5}, direction = defines.direction.west}
    end


    surface2.create_entity{name = "fast-inserter", position = {-4.5,-5.5}, direction = defines.direction.east}
    surface2.create_entity{name = "fast-inserter", position = {-5.5,4.5}, direction = defines.direction.north}
    surface2.create_entity{name = "fast-inserter", position = {4.5,5.5}, direction = defines.direction.west}
    surface2.create_entity{name = "fast-inserter", position = {5.5,-4.5}, direction = defines.direction.south}
    surface2.spill_item_stack {position = {-3.5,-5.5}, stack = {name = "iron-plate", count = 4;}}
    surface2.spill_item_stack {position = {-5.5,3.5}, stack = {name = "iron-plate", count = 4;}}
    surface2.spill_item_stack {position = {3.5,-5.5}, stack = {name = "iron-plate", count = 4;}}
    surface2.spill_item_stack {position = {5.5,-3.5}, stack = {name = "iron-plate", count = 4;}}

    surface.create_global_electric_network()
    surface2.create_global_electric_network()

    local lppn1 = UTIL_ensure_entity(surface, { name = "linox-entity_hidden-electric-pole"})
    local lppn2 = UTIL_ensure_entity(surface2, { name = "linox-entity_hidden-electric-pole"})
    
    local lppn1_connector = lppn1.get_wire_connector(defines.wire_connector_id.pole_copper, true);
    local lppn2_connector = lppn2.get_wire_connector(defines.wire_connector_id.pole_copper, true);
    lppn1_connector.connect_to(lppn2_connector, false);

    local story_table =
    {
      {
        {
          name = "start",
          condition = story_elapsed_check(2),
          action = function()
            game.simulation.camera_surface_index = 1
            game.simulation.camera_position = {0, 0}
            game.simulation.camera_zoom = 0.7
          end,
        },
        {
          condition = story_elapsed_check(3),
          action = function()
            game.simulation.camera_surface_index = 2
            game.simulation.camera_position = {0, 0}
            game.simulation.camera_zoom = 0.7
          end,
        },
        {
          condition = story_elapsed_check(3),
          action = function()
            story_jump_to(storage.story, "start")
          end,
        }
      }
    }
    tip_story_init(story_table)
  ]]
}


__MODULE__.npc_system = {
  init_update_count = 120,
  planet = "nauvis",
  init = [[
    require("__core__/lualib/story")
    local util_surface = require("__linox__.scripts.util.surface")

    local surface = game.surfaces[1]

    util_surface.fill_tile {
      surface = surface,
      tile_name = "linox-tile_out-of-map",
      x1 = -30,
      y1 = -30,
      x2 = 10,
      y2 = 10,
    }

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

    util_surface.fill_tile {
      surface = surface,
      tile_name = "linox-tile_linox-datacenter",
      x1 = -21,
      y1 = -21,
      x2 = -14,
      y2 = -11,
    }

    util_surface.fill_tile {
      surface = surface,
      tile_name = "linox-tile_linox-datacenter",
      x1 = 13,
      y1 = -17,
      x2 = 16,
      y2 = -11,
    }

    local entity_lorax = surface.create_entity{
      name = "linox-entity_npc-lorax",
      position = {-17, -17},
      force = "neutral",
      create_build_effect_smoke = false,
    };

    rendering.draw_text{
      text = {"entity-name.linox-entity_npc-lorax"},
      surface = surface,
      target = {
          entity = entity_lorax,
          offset = { 0, 4.5 },
      },
      color = { 1, 1, 0, 1},
      alignment = "center",
      vertical_alignment = "middle"
    }

    local player = game.simulation.create_test_player{name = "testman"}
    player.teleport({-10, -10})
    game.simulation.camera_player = player

    game.simulation.camera_position = {-13, -13}
    game.simulation.camera_zoom = 1

    game.simulation.camera_player_cursor_position = {0, -17}

    local story_table =
    {
      {
        {
          name = "start",
          condition = story_elapsed_check(2),
        },
        { condition = function() return game.simulation.move_cursor({position = {-17, -17}, speed = 0.1}) end },
      }
    }
    tip_story_init(story_table)
  ]]
}

return __MODULE__