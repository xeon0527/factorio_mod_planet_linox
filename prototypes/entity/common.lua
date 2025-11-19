data:extend {
  {
    type = "radar",
    name = "linox-entity_hidden-radar",
    selectable_in_game = false,
    flags = {"not-on-map", "hide-alt-info", "not-deconstructable", "not-blueprintable"},
    hidden = true,
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
    name = "linox-entity_hidden-electric-pole",
    selectable_in_game = false,
    flags = {"not-on-map", "hide-alt-info", "placeable-off-grid", "not-deconstructable", "not-blueprintable"},
    hidden = true,
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
  --{
  --  type = "electric-energy-interface",
  --  name = "linox-entity_reactive-power",
  --  icon = "__base__/graphics/icons/accumulator.png",
  --  selectable_in_game = false,
  --  flags = {"not-on-map", "hide-alt-info", "not-deconstructable", "not-blueprintable"},
  --  hidden = true,
  --  collision_mask = {layers = {}},
  --  energy_source = {
  --    type = "electric",
  --    buffer_capacity = "1GJ",
  --    usage_priority = "secondary-input",
  --  },
  --  gui_mode = "admins",
  --  energy_production = "0kW",
  --  energy_usage = "0kW",
  --}
}