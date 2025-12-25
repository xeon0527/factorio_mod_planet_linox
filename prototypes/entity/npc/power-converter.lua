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