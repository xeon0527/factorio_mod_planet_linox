---@diagnostic disable: need-check-nil, inject-field, undefined-global
require("__core__/lualib/story")
require("__linox__/scripts/util")
local circuit = require("__linox__/scripts/util/circuit")

local surface = game.surfaces[1]
game.simulation.camera_position = {0, 0}
game.simulation.camera_zoom = 0.7
game.simulation.camera_alt_info = true

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

local pole = UTIL_ensure_entity(surface, { name = "linox-special_circuit-pole", position = {-2,2}})
pole.destructible = false
pole.minable = false
pole.rotatable = false

for _, x in pairs({-10.5, -7.5, -4.5, -1.5, 1.5, 4.5, 7.5, 10.5}) do
  for _, y in pairs({-11.5, -8.5, 11.5, 8.5}) do
    surface.create_entity{name = "solar-panel", force = "player", position = {x,y}}
  end
end

local comb = surface.create_entity{
  name = "constant-combinator",
  position = {-7, 1},
  force = "player",
  create_build_effect_smoke = false,
}

circuit.set_entity_signal(comb, 1, {quality = "normal", type = "virtual", name = "signal-green"}, 1);


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

local pole2 = UTIL_ensure_entity(surface2, { name = "linox-special_circuit-pole", position = {-2,2}})
pole2.destructible = false
pole2.minable = false
pole2.rotatable = false

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

local lamp = surface2.create_entity{
  name = "small-lamp",
  position = {-10, 1},
  force = "player",
  create_build_effect_smoke = false,
}

local lamp_beh = lamp.get_or_create_control_behavior()
lamp_beh.use_colors = true
lamp_beh.circuit_enable_disable = true
lamp_beh.color_mode = defines.control_behavior.lamp.color_mode.color_mapping
lamp_beh.circuit_condition = {
  comparator = ">",
  first_signal = { quality = "normal", type = "virtual", name = "signal-green" },
  constant = 0,
}


surface.create_global_electric_network()
surface2.create_global_electric_network()

local lppn1_connector = pole.get_wire_connector(defines.wire_connector_id.pole_copper, true);
local lppn2_connector = pole2.get_wire_connector(defines.wire_connector_id.pole_copper, true);
lppn1_connector.connect_to(lppn2_connector, false);

lppn1_connector = pole.get_wire_connector(defines.wire_connector_id.circuit_red, true);
lppn2_connector = pole2.get_wire_connector(defines.wire_connector_id.circuit_red, true);
lppn1_connector.connect_to(lppn2_connector, false);

lppn1_connector = pole.get_wire_connector(defines.wire_connector_id.circuit_green, true);
lppn2_connector = pole2.get_wire_connector(defines.wire_connector_id.circuit_green, true);
lppn1_connector.connect_to(lppn2_connector, false);

lppn1_connector = pole.get_wire_connector(defines.wire_connector_id.circuit_red, true);
lppn2_connector = comb.get_wire_connector(defines.wire_connector_id.circuit_red, true);
lppn1_connector.connect_to(lppn2_connector, false);

lppn1_connector = pole2.get_wire_connector(defines.wire_connector_id.circuit_red, true);
lppn2_connector = lamp.get_wire_connector(defines.wire_connector_id.circuit_red, true);
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