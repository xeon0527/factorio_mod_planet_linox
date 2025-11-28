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
      name = "linox-building_cargo-landing-pad",
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
  ]]
}

__MODULE__.linox_placement_restriction2 = {
  init_update_count = 120,
  planet = "nauvis",
  init = [[
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
      name = "active-provider-chest",
      position = {-5, 1},
    }

    surface.create_entity{
      name = "passive-provider-chest",
      position = {-3, 1},
    }

    surface.create_entity{
      name = "storage-chest",
      position = {-1, 1},
    }

    surface.create_entity{
      name = "buffer-chest",
      position = {1, 1},
    }

    surface.create_entity{
      name = "requester-chest",
      position = {3, 1},
    }

    surface.create_entity{
      name = "linox-building_core-roboport",
      position = {7, 2},
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
      name = "linox-building_cargo-landing-pad",
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
      name = "linox-building_cargo-landing-pad",
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

    local lppn1 = UTIL_ensure_entity(surface, { name = "linox-hidden_electric-pole"})
    local lppn2 = UTIL_ensure_entity(surface2, { name = "linox-hidden_electric-pole"})
    
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
      name = "linox-npc_lorax",
      position = {-17, -17},
      force = "neutral",
      create_build_effect_smoke = false,
    };

    rendering.draw_text{
      text = {"entity-name.linox-npc_lorax"},
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


__MODULE__.recursive_blueprints = {
  init_update_count = 10,
  planet = "nauvis",--"linox-planet_linox",
  mods = {
    "linox",
    "rec-blue-plus",
  },
  init = [[
    require("__core__/lualib/story")
    require("__linox__.global._global")
    local util_surface = require("__linox__.scripts.util.surface")
    local factory_builder = require("__linox__.scripts.svc.surface.builder.factory-builder")
    local rbp = require("__linox__.prototypes.tip-and-tricks.recursive-bluprints")
    local linox_map_gen   = require("__linox__.prototypes.planet.map-gen")

    local surface = game.surfaces[1]
    surface.set_property("gravity", __LINOX_PLANET__.gravity);
    surface.set_property("magnetic-field", __LINOX_PLANET__.magnetic_field);
    surface.set_property("solar-power", 0);
    surface.set_property("pressure", __LINOX_PLANET__.pressure);

    surface.create_global_electric_network()
    game.forces.player.worker_robots_speed_modifier = 5

    local technologies = prototypes.technology
    local techs = {
      "landfill",
      "foundry",
      "linox-technology_planetary-mining-technology",
      "inserter-capacity-bonus-1",
      "inserter-capacity-bonus-2",
      "inserter-capacity-bonus-3",
      "inserter-capacity-bonus-4",
      "inserter-capacity-bonus-5",
      "inserter-capacity-bonus-6",
      "inserter-capacity-bonus-7",
    }
    for _, tech in pairs(techs) do
      game.forces.player.technologies[tech].researched = true
    end


    util_surface.fill_tile {
      surface = surface,
      tile_name = "linox-tile_out-of-map",
      x1 = -30, y1 = -30, x2 = 30, y2 = 30,
    }

    factory_builder.create(surface, {x = 0, y = 0}, 8);
    factory_builder.create_corridor(surface, {x = 0, y = 8}, "down", 25);
    factory_builder.create_corridor(surface, {x = -8, y = 0}, "left", 30);
    factory_builder.create_corridor(surface, {x = 8, y = 0}, "right", 25);

    game.simulation.camera_position = {0, 0}
    game.simulation.camera_zoom = 0.8
    game.simulation.camera_alt_info = true
    game.speed = 2


    local bp_entity = surface.create_entity{name = 'item-on-ground', position= {0, 0}, stack = 'blueprint'}
    if bp_entity then 
      bp_entity.stack.import_stack(rbp.sample_blueprint);

      local bp_entities = bp_entity.stack.build_blueprint{
        surface = surface,
        force = "player",
        position= {-3, 0},
        build_mode=defines.build_mode.forced,
      };

      for _, ghost in pairs(bp_entities) do
        ghost.revive{raise_revive = (ghost.ghost_name == "blueprint-deployer2")};
      end
      bp_entity.destroy();
    end

    surface.create_entity{name = "electric-energy-interface", force = "player", position = {-40,-40}}

    surface.create_entity{name = "inserter", force = "player", position = {-9,-1}, direction = defines.direction.east}
    surface.create_entity{name = "inserter", force = "player", position = {-9, 0}, direction = defines.direction.east}
    for x = -10, -30, -1 do
      surface.create_entity{name = "transport-belt", force = "player", position = {x,-1}, direction = defines.direction.west}
      surface.create_entity{name = "transport-belt", force = "player", position = {x, 0}, direction = defines.direction.west}
    end
    surface.create_entity{name = "inserter", force = "player", position = {-31,-1}, direction = defines.direction.east}
    surface.create_entity{name = "inserter", force = "player", position = {-31, 0}, direction = defines.direction.east}
    surface.create_entity{name = "bottomless-chest", force = "player", position = {-32,-1}}
    surface.create_entity{name = "bottomless-chest", force = "player", position = {-32, 0}}

    for y = 13, 15, 1 do
      surface.create_entity{name = "turbo-transport-belt", force = "player", position = {-1, y}, direction = defines.direction.south}
      surface.create_entity{name = "pipe", force = "player", position = { 0, y}, direction = defines.direction.south}
    end

    surface.create_entity{name = "fast-inserter", force = "player", position = {-1,16}, direction = defines.direction.north}
    surface.create_entity{name = "bottomless-chest", force = "player", position = {-1,17}}
    
    local ipipe = surface.create_entity{name = "infinity-pipe", force = "player", position = {0, 16}, direction = defines.direction.south}
    ipipe.set_infinity_pipe_filter {
      name = "lava",
      percentage = 1.0
    }

    local deployer = surface.find_entities_filtered{name = "blueprint-deployer2", position = { 0, 0 }, radius = 25, limit = 1}
    if deployer and #deployer > 0 then
      deployer = deployer[1]
      deployer.insert{ name = "blueprint" }
      local iv = deployer.get_inventory(defines.inventory.chest);
      if iv then iv[1].import_stack(rbp.sample_deployer_book); end

      local stor = surface.find_entities_filtered{name = "storage-chest", position = { 0, 0 }, radius = 25}
      if stor then
        stor[1].insert{ name = "chemical-plant", count = 8 }
        stor[1].insert{ name = "pipe", count = 33 }
        stor[1].insert{ name = "speed-module-3", count = 26 }
        stor[1].insert{ name = "bulk-inserter", count = 16 }
        stor[1].insert{ name = "requester-chest", count = 4 }
        stor[1].insert{ name = "active-provider-chest", count = 5 }
        stor[1].insert{ name = "beacon", count = 10 }
        stor[1].insert{ name = "pipe-to-ground", count = 1 }
        stor[1].insert{ name = "turbo-transport-belt", count = 12 }
        stor[1].insert{ name = "turbo-underground-belt", count = 5 }
        stor[1].insert{ name = "assembling-machine-3", count = 2 }
        stor[1].insert{ name = "productivity-module-3", count = 8 }
        stor[1].insert{ name = "foundry", count = 2 }

        stor[2].insert{ name = "stone", count = 1000 }
        stor[2].insert{ name = "calcite", count = 150 }
      end
    end

    local rbpt = surface.find_entity("linox-building_core-roboport", {-7, -7})
    rbpt.insert{ name = "logistic-robot", count = 100 }

    rbpt = surface.find_entity("linox-building_core-roboport", {7, 7})
    rbpt.insert{ name = "construction-robot", count = 100 }

    local const_comb = surface.find_entities_filtered{name = "constant-combinator", position = { 0, 0 }, radius = 25}[1]
    const_comb.get_control_behavior().enabled = true
  ]]
}



__MODULE__.bad_chest_area_viewer = {
  init_update_count = 10,
  planet = "nauvis",--"linox-planet_linox",
  checkboard = true,
  game_view_settings = {
    default_show_value = false,
    show_controller_gui = true,
    show_quickbar = true,
    show_shortcut_bar = true,
  },
--player.set_shortcut_available("linox-tool_badchest-area-viewer", true)
  init = [[
    require("__core__/lualib/story")

    game.simulation.camera_alt_info = true

    local player = game.simulation.create_test_player{name = "testman"}
    player.teleport({-6, -2})

    game.simulation.camera_player = player
    game.simulation.camera_position = {0, 0}

    for _, s in pairs(prototypes.shortcut) do
      if s.action == "lua" then
        player.set_shortcut_available(s.name, false)
      end
    end

    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqdkl1PgzAUhv/LuS4LZbAMEu/9B2oWsvBx1CbQYikoIf3vnkKmOHVkCzflbd/nfOQdIa86bLSQBpIRRKFkC8lhhFa8yKxymsxqhOT7nVdiU6kBdQCWgZAlfkDCLfvD42gmI0uh6lzIzCi98AQ2ZYDSCCNwLjr9DEfZ1TlqgrJLIAaNasmrpKtIPI9vIgYDHXabiMqUQmMx3++ZQxitqmOOr1kvyE+mdr5vf56pkdNUDJ5FZVCfq2ZoXFu90Kajib/6nDfgPZLyRhc0DIlS6Xp6RM03mZ6aT+BuEjq399At77SUVfjTdXB/Ad+uwh+ug28X8HAVfn/7WqL/4TpvvIKSg/o6PLcpfdYVOctdwC6F/lfu/GXsXKbfKXguMQfOOAsYT0kTBuslkDA95WqiRLsgDuM42vNtHPuhtZ9+ji9i",
      position = {-6, 0}
    }
  ]],
}


return __MODULE__