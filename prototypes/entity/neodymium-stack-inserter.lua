---@diagnostic disable: undefined-global
local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")

data:extend {
  {
    type = "inserter",
    name = "linox-building_neodymium-stack-inserter",
    icon = "__linox__/graphics/icons/neodymium-stack-inserter.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    stack_size_bonus = 4,
    bulk = true,
    grab_less_to_match_belt_stack = true,
    wait_for_full_hand = true,
    enter_drop_mode_if_held_stack_spoiled = true,
    max_belt_stack_size = 4,
    minable = { mining_time = 0.1, result = "linox-building_neodymium-stack-inserter" },
    max_health = 160,
    corpse = "neodymium-stack-inserter-remnants",
    dying_explosion = "stack-inserter-explosion",
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
    energy_per_movement = "50kJ",
    energy_per_rotation = "50kJ",
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "25kW"--"1kW"
    },
    heating_energy = "50kW",
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
      filename = "__linox__/graphics/entity/neodymium-stack-inserter/stack-inserter-hand-base.png",
      priority = "extra-high",
      width = 32,
      height = 136,
      scale = 0.25
    },
    hand_closed_picture =
    {
      filename = "__linox__/graphics/entity/neodymium-stack-inserter/stack-inserter-hand-closed.png",
      priority = "extra-high",
      width = 112,
      height = 164,
      scale = 0.25
    },
    hand_open_picture =
    {
      filename = "__linox__/graphics/entity/neodymium-stack-inserter/stack-inserter-hand-open.png",
      priority = "extra-high",
      width = 134,
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
      filename = "__space-age__/graphics/entity/stack-inserter/stack-inserter-hand-closed-shadow.png",
      priority = "extra-high",
      width = 112,
      height = 164,
      scale = 0.25
    },
    hand_open_shadow =
    {
      filename = "__space-age__/graphics/entity/stack-inserter/stack-inserter-hand-open-shadow.png",
      priority = "extra-high",
      width = 134,
      height = 164,
      scale = 0.25
    },
    platform_picture =
    {
      sheet =
      {
        filename = "__linox__/graphics/entity/neodymium-stack-inserter/stack-inserter-platform.png",
        priority = "extra-high",
        width = 105,
        height = 79,
        shift = util.by_pixel(1.5, 7.5-1),
        scale = 0.5
      }
    },
    platform_frozen =
    {
      sheet =
      {
        filename = "__space-age__/graphics/entity/frozen/inserter/inserter-platform.png",
        priority = "extra-high",
        width = 105,
        height = 79,
        shift = util.by_pixel(1.5, 7.5-1),
        scale = 0.5
      }
    },
    hand_base_frozen =
    {
      filename = "__space-age__/graphics/entity/stack-inserter/stack-inserter-arm-frozen.png",
      priority = "extra-high",
      x = 134 * 2,
      width = 134,
      height = 136,
      scale = 0.25
    },
    hand_closed_frozen =
    {
      filename = "__space-age__/graphics/entity/stack-inserter/stack-inserter-arm-frozen.png",
      priority = "extra-high",
      x = 134,
      width = 134,
      height = 164,
      scale = 0.25
    },
    hand_open_frozen =
    {
      filename = "__space-age__/graphics/entity/stack-inserter/stack-inserter-arm-frozen.png",
      priority = "extra-high",
      width = 134,
      height = 164,
      scale = 0.25
    },
    circuit_connector = circuit_connector_definitions["inserter"],
    circuit_wire_max_distance = inserter_circuit_wire_max_distance,
    default_stack_control_input_signal = inserter_default_stack_control_input_signal
  },

  {
    type = "item",
    name = "linox-building_neodymium-stack-inserter",
    icon = "__linox__/graphics/icons/neodymium-stack-inserter.png",
    subgroup = "inserter",
    color_hint = { text = "N" },
    order = "ib[stack-inserter]",
    inventory_move_sound = item_sounds.inserter_inventory_move,
    pick_sound = item_sounds.inserter_inventory_pickup,
    drop_sound = item_sounds.inserter_inventory_move,
    place_result = "linox-building_neodymium-stack-inserter",
    stack_size = 50,
    default_import_location = "linox-planet_linox",
    weight = 20*kg
  },

  {
    type = "recipe",
    name = "linox-building_neodymium-stack-inserter",
    enabled = false,
    ingredients =
    {
      {type = "item", name = "tungsten-gear-wheel", amount = 15},
      {type = "item", name = "tungsten-stick", amount = 5},
      {type = "item", name = "processing-unit", amount = 3},
      {type = "item", name = "neodymium-permanent-magnet", amount = 1},
      {type = "item", name = "stack-inserter", amount = 1}
    },
    results = {{type="item", name="linox-building_neodymium-stack-inserter", amount=1}}
  },
}