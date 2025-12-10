---@diagnostic disable: undefined-global
local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")

data:extend {
  {
    type = "inserter",
    name = "linox-building_neodymium-bulk-inserter",
    icon = "__linox__/graphics/icons/neodymium-bulk-inserter.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    bulk = true,
    minable = { mining_time = 0.1, result = "linox-building_neodymium-bulk-inserter" },
    max_health = 160,
    corpse = "neodymium-bulk-inserter-remnants",
    dying_explosion = "bulk-inserter-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.4, -0.35}, {0.4, 0.45}},
    damaged_trigger_effect = hit_effects.entity(),
    starting_distance = 0.85,
    pickup_position = {0, -1},
    insert_position = {0, 1.2},
    energy_per_movement = "25kJ",
    energy_per_rotation = "25kJ",
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "25kW" --"1kW"
    },
    extension_speed = 0.3,--0.1,
    rotation_speed = 0.12,--0.04,
    filter_count = 5,
    icon_draw_specification = {scale = 0.5},
    fast_replaceable_group = "inserter",
    open_sound = sounds.inserter_open,
    close_sound = sounds.inserter_close,
    working_sound = sounds.inserter_fast,
    hand_base_picture =
    {
      filename = "__linox__/graphics/entity/neodymium-bulk-inserter/bulk-inserter-hand-base.png",
      priority = "extra-high",
      width = 32,
      height = 136,
      scale = 0.25
    },
    hand_closed_picture =
    {
      filename = "__linox__/graphics/entity/neodymium-bulk-inserter/bulk-inserter-hand-closed.png",
      priority = "extra-high",
      width = 100,
      height = 164,
      scale = 0.25
    },
    hand_open_picture =
    {
      filename = "__linox__/graphics/entity/neodymium-bulk-inserter/bulk-inserter-hand-open.png",
      priority = "extra-high",
      width = 130,
      height = 164,
      scale = 0.25
    },
    hand_base_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-base-shadow.png",
      priority = "extra-high",
      width = 32,
      height = 132,
      scale = 0.25
    },
    hand_closed_shadow =
    {
      filename = "__base__/graphics/entity/bulk-inserter/bulk-inserter-hand-closed-shadow.png",
      priority = "extra-high",
      width = 100,
      height = 164,
      scale = 0.25
    },
    hand_open_shadow =
    {
      filename = "__base__/graphics/entity/bulk-inserter/bulk-inserter-hand-open-shadow.png",
      priority = "extra-high",
      width = 130,
      height = 164,
      scale = 0.25
    },
    platform_picture =
    {
      sheet =
      {
        filename = "__linox__/graphics/entity/neodymium-bulk-inserter/bulk-inserter-platform.png",
        priority = "extra-high",
        width = 105,
        height = 79,
        shift = util.by_pixel(1.5, 7.5-1),
        scale = 0.5
      }
    },
    circuit_connector = circuit_connector_definitions["inserter"],
    circuit_wire_max_distance = inserter_circuit_wire_max_distance,
    default_stack_control_input_signal = inserter_default_stack_control_input_signal
  },

  {
    type = "item",
    name = "linox-building_neodymium-bulk-inserter",
    icon = "__linox__/graphics/icons/neodymium-bulk-inserter.png",
    subgroup = "inserter",
    color_hint = { text = "N" },
    order = "ia[bulk-inserter]",
    inventory_move_sound = item_sounds.inserter_inventory_move,
    pick_sound = item_sounds.inserter_inventory_pickup,
    drop_sound = item_sounds.inserter_inventory_move,
    place_result = "linox-building_neodymium-bulk-inserter",
    stack_size = 50,
    default_import_location = "linox-planet_linox",
    weight = 20*kg
  },

  {
    type = "recipe",
    name = "linox-building_neodymium-bulk-inserter",
    enabled = false,
    ingredients =
    {
      {type = "item", name = "tungsten-gear-wheel", amount = 15},
      {type = "item", name = "tungsten-stick", amount = 5},
      {type = "item", name = "neodymium-permanent-magnet", amount = 2},
      {type = "item", name = "bulk-inserter", amount = 1}
    },
    results = {{type="item", name="linox-building_neodymium-bulk-inserter", amount=1}}
  },
}