local tint = { 0.33, 1.0, 0.33 }

local acc = table.deepcopy(data.raw["accumulator"]["accumulator"])

data:extend {
  {
    type = "electric-energy-interface",
    name = "linox-npc_power-converter",
    icons = {
      {
        icon = "__base__/graphics/icons/accumulator.png",
        tint = tint,
      }
    },
    map_color = { 1.0, 1.0, 0.0 },
    max_health = 1000,
    flags = {
      "not-rotatable",
      "placeable-neutral",
      "placeable-off-grid",
      "get-by-unit-number", 
      "not-deconstructable",
      "not-blueprintable", 
      "hide-alt-info",
      "no-automated-item-removal",
      "no-automated-item-insertion",
      "not-upgradable",
      "not-in-made-in",
    },

    energy_source = {
      type = "electric",
      usage_priority = "tertiary",
      render_no_power_icon = true,
    },

    gui_mode = "none",
    energy_production = "0kW",
    energy_usage = "0kW",

    selection_box = acc.selection_box,
    collision_box = acc.collision_box,
    collision_mask = acc.collision_mask,
    hidden = true,
    hidden_in_factoriopedia = true,

    picture = {
      layers =
      {
        {
          filename = "__base__/graphics/entity/accumulator/accumulator.png",
          priority = "high",
          width = 130,
          height = 189,
          shift = util.by_pixel(0, -11),
          tint = tint,
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/accumulator/accumulator-shadow.png",
          priority = "high",
          width = 234,
          height = 106,
          shift = util.by_pixel(29, 6),
          draw_as_shadow = true,
          scale = 0.5
        }
      }
    }
  }
}



data:extend {
  {
    type = "container",
    name = "linox-npc_power-converter-circuit-input",
    icon = "__base__/graphics/icons/constant-combinator.png",
    max_health = 1000,
    flags = {
      "placeable-neutral",
      "placeable-off-grid",
      "get-by-unit-number", 
      "not-deconstructable",
      "not-blueprintable",
      "hide-alt-info",
      "no-automated-item-removal",
      "no-automated-item-insertion",
      "not-upgradable",
      "not-in-made-in",
    },
    selection_priority = 150,
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    hidden = true,
    hidden_in_factoriopedia = true,
    inventory_size = 0,

    circuit_connector = circuit_connector_definitions["chest"],
    circuit_wire_max_distance = default_circuit_wire_max_distance,
  }
}



local connection_point = {
  wire = { red = {0.25, 0.25},   green = {0.25, 0.25}},
  shadow = { red = {0.25, 0.25},   green = {0.25, 0.25}, },
}

data:extend {
  {
    type = "constant-combinator",
    name = "linox-npc_power-converter-circuit-output",
    icon = "__base__/graphics/icons/constant-combinator.png",
    max_health = 1000,
    flags = {
      "placeable-neutral",
      "placeable-off-grid",
      "get-by-unit-number", 
      "not-deconstructable",
      "not-blueprintable",
      "no-automated-item-removal",
      "no-automated-item-insertion",
      "not-upgradable",
      "not-in-made-in",
    },
    selection_priority = 150,
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    hidden = true,
    hidden_in_factoriopedia = true,
    item_slot_count = 10,

    circuit_wire_connection_points = { connection_point,  connection_point,  connection_point,  connection_point, },
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    activity_led_light_offsets = {{0, 0},{0, 0},{0, 0},{0, 0}},
  }
}

-- local entity = table.deepcopy(data.raw["accumulator"]["accumulator"])
-- entity.name = "linox-npc_power-converter"
-- entity.flags = {
--   "not-rotatable",
--   "placeable-neutral",
--   "get-by-unit-number", 
--   "not-deconstructable",
--   "not-blueprintable", 
-- }

-- entity.chargable_graphics.picture.layers[1].tint = tint;
-- entity.chargable_graphics.charge_animation.layers[1].layers[1].tint = tint;
-- entity.chargable_graphics.discharge_animation.layers[1].layers[1].tint = tint;
-- entity.max_health = 1000;
-- entity.energy_source = {
--   type = "electric",
--   usage_priority = "tertiary",
-- }

-- data:extend { entity }

-- local output_connection_point = {
--   wire = { red = {0.5, 0.5},   green = {0.5, 0.5}},
--   shadow = { red = {0.5, 0.5},   green = {0.5, 0.5}, },
-- }

-- data:extend {
--   {
--     type = "constant-combinator",
--     name = "linox-npc_power-converter-output",
--     icon = "__base__/graphics/icons/accumulator.png",
--     hidden = true,
--     flags = {"placeable-player", "player-creation", "placeable-off-grid",  "not-rotatable", "not-deconstructable", "hide-alt-info"},
--     max_health = 1000,
--     collision_box = {{-0.5, -1}, {0.5, 1}},
--     selection_box = {{-0.5, -1}, {0.5, 1}},
--     scale_info_icons = false,
--     selectable_in_game = true,
--     selection_priority = 150,
--     item_slot_count = 10,
--     circuit_wire_connection_points = { output_connection_point,  output_connection_point,  output_connection_point,  output_connection_point, },
--     circuit_wire_max_distance = 10,
--     activity_led_light = {
--       intensity = 0.8,
--       size = 1,
--     },
--     activity_led_light_offsets = {{0, 0},{0, 0},{0, 0},{0, 0}},
--   }
-- }