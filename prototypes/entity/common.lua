local hidden_flag = {
  "not-rotatable",
  "get-by-unit-number",
  "placeable-off-grid",
  "not-repairable",
  "not-on-map",
  "not-deconstructable",
  "not-blueprintable",
  "hide-alt-info",
  "not-flammable",
  "no-automated-item-removal",
  "no-automated-item-insertion",
  "not-selectable-in-game",
  "not-upgradable",
  "not-in-kill-statistics",
  "not-in-made-in",
}

data:extend {
  {
    type = "radar",
    name = "linox-hidden_radar",
    selectable_in_game = false,
    flags = hidden_flag,
    hidden = true,
    hidden_in_factoriopedia = true,
    collision_mask = {layers = {}},
    energy_per_nearby_scan = "100J",
    energy_per_sector = "6kW",
    energy_source = {type = "void"},
    energy_usage = "100W",
    max_distance_of_sector_revealed = 0,
    max_distance_of_nearby_sector_revealed = 3,
    localised_name = "",
    max_health = 1,
    connects_to_other_radars = false,
  },
  {
    type = "electric-pole",
    name = "linox-hidden_electric-pole",
    selectable_in_game = false,
    flags = hidden_flag,
    hidden = true,
    hidden_in_factoriopedia = true,
    collision_mask = {layers = {}},
    supply_area_distance = 0,
    connection_points = {
      {
        shadow = {
          copper = {0,0},
          green = {0,0},
          red = {0,0},
        },
        wire = {
          copper = {0,0},
          green = {0,0},
          red = {0,0},
        }
      },
    },
  },
  --{
  --  type = "accumulator",
  --  name = "linox-entity_planetary-power-network",
  --  icon = "__base__/graphics/icons/accumulator.png",
  --  selectable_in_game = false,
  --  flags = {"not-on-map", "hide-alt-info", "not-deconstructable", "not-blueprintable"},
  --  hidden = true,
  --  collision_mask = {layers = {}},
  --  energy_source =
  --  {
  --    type = "electric",
  --    buffer_capacity = "5GJ",
  --    usage_priority = "tertiary",
  --    input_flow_limit = "5GW",
  --    output_flow_limit = "5GW"
  --  },
  --},
  {
    type = "electric-energy-interface",
    name = "linox-hidden_reactive-power",
    icons = {
      {
        icon = "__base__/graphics/icons/accumulator.png",
        tint = { 1.0, 0.66, 0.66 },
      }
    },
    flags = hidden_flag,
    hidden = true,
    hidden_in_factoriopedia = true,
    collision_mask = {layers = {}},
    energy_source = {
      type = "electric",
      buffer_capacity = "1GJ",
      usage_priority = "secondary-input",
    },
    gui_mode = "none",
    energy_production = "0kW",
    energy_usage = "0kW",
  },

  {
    type = "simple-entity",
    name = "linox-hidden_fluid-elevator-point",
    flags = {
      "not-rotatable",
      "placeable-off-grid",
      "not-repairable",
      "not-on-map",
      "not-deconstructable",
      "not-blueprintable",
      "hide-alt-info",
      "not-flammable",
      "no-automated-item-removal",
      "no-automated-item-insertion",
      "not-selectable-in-game",
      "not-upgradable",
      "not-in-kill-statistics",
      "not-in-made-in",
    },
    hidden = true,
    hidden_in_factoriopedia = true,
    collision_mask = {layers = {}},
    protected_from_tile_building = false,
  },

  {
    type = "simple-entity",
    name = "linox-hidden_cargo-elevator-point",
    flags = {
      "not-rotatable",
      "placeable-off-grid",
      "not-repairable",
      "not-on-map",
      "not-deconstructable",
      "not-blueprintable",
      "hide-alt-info",
      "not-flammable",
      "no-automated-item-removal",
      "no-automated-item-insertion",
      "not-selectable-in-game",
      "not-upgradable",
      "not-in-kill-statistics",
      "not-in-made-in",
    },
    hidden = true,
    hidden_in_factoriopedia = true,
    collision_mask = {layers = {}},
    protected_from_tile_building = false,
  },
}

local entity = table.deepcopy(data.raw["electric-pole"]["substation"])
entity.name = "linox-special_circuit-pole"
entity.flags = {
  "not-rotatable",
  "placeable-off-grid",
  "not-repairable",
  "not-deconstructable",
  "not-blueprintable",
  "not-flammable",
  "no-automated-item-removal",
  "no-automated-item-insertion",
  "not-upgradable",
  "not-in-kill-statistics",
  "not-in-made-in",
}
entity.minable = nil
entity.max_health = 1000
entity.resistances = nil
entity.selection_box = {{-1, -3}, {1, 1}}
entity.maximum_wire_distance = 64
entity.supply_area_distance = 0
entity.pictures.layers[1].tint = {0,1,0}
entity.hidden = true
entity.hidden_in_factoriopedia = true
entity.collision_mask = {layers = {}}
entity.selection_priority = 255
entity.next_upgrade = nil

data:extend { entity }