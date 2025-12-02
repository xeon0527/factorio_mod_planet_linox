local sounds = require("__base__.prototypes.entity.sounds")

data:extend {
  {
    type = "lab",
    name = "linox-building_linox-supercomputer",
    icon = "__space-exploration-graphics__/graphics/icons/supercomputer-3.png",
    icon_size = 64,
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.5, result = "linox-building_linox-supercomputer"},

    fast_replaceable_group = "lab",
    impact_category = "metal-large",
    max_health = 1000,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    alert_icon_shift = util.by_pixel(0, 0),

    open_sound = sounds.lab_open,
    close_sound = sounds.lab_close,
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/lab.ogg",
        volume = 0.7,
        modifiers = {volume_multiplier("main-menu", 2.2), volume_multiplier("tips-and-tricks", 0.8)},
        audible_distance_modifier = 0.7,
      },
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },

    collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
    collision_mask = {layers={item=true, meltable=true, object=true, player=true, water_tile=true, is_object=true, is_lower_object=true}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    drawing_box_vertical_extension = 1.5,

    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    energy_usage = "250kW",
    researching_speed = 5,

    inputs =
    {
      "linox-item_lava-data-card",
      "linox-item_rare-earth-data-card",
      "linox-item_samarium-data-card",
      "linox-item_dysprosium-data-card",
      "linox-item_neodymium-data-card",
      "linox-item_erbium-data-card",
    },
    module_slots = 4,
    icons_positioning =
    {
---@diagnostic disable-next-line: assign-type-mismatch
      {inventory_index = defines.inventory.lab_modules, shift = {0, 0.9}},
---@diagnostic disable-next-line: assign-type-mismatch
      {inventory_index = defines.inventory.lab_input, shift = {0, 0}, max_icons_per_row = 4, separation_multiplier = 1/1.1}
    },

    off_animation =
    {
      layers =
      {
        {
          filename = "__space-exploration-graphics-5__/graphics/entity/supercomputer/supercomputer-3.png",
          priority = "high",
          width = 320,
          height = 384,
          frame_count = 1,
          shift = util.by_pixel(-0, -16),
          animation_speed = 1,
          scale = 0.5,
        },
        {
          draw_as_shadow = true,
          filename = "__space-exploration-graphics-5__/graphics/entity/supercomputer/supercomputer-shadow.png",
          priority = "high",
          width = 264,
          height = 234,
          frame_count = 1,
          line_length = 1,
          shift = util.by_pixel(75, 23),
          animation_speed = 1,
          scale = 0.5,
        },
      },
    },
    on_animation =
    {
      layers =
      {
        {
          filename = "__space-exploration-graphics-5__/graphics/entity/supercomputer/supercomputer-3.png",
          priority = "high",
          width = 320,
          height = 384,
          frame_count = 1,
          repeat_count = 9,
          shift = util.by_pixel(-0, -16),
          animation_speed = 1,
          scale = 0.5,
        },
        {
          draw_as_shadow = true,
          filename = "__space-exploration-graphics-5__/graphics/entity/supercomputer/supercomputer-shadow.png",
          priority = "high",
          width = 264,
          height = 234,
          frame_count = 1,
          line_length = 1,
          repeat_count = 9,
          shift = util.by_pixel(75, 23),
          animation_speed = 1,
          scale = 0.5,
        },
        {
          filename = "__space-exploration-graphics-5__/graphics/entity/supercomputer/supercomputer-3-working.png",
          priority = "high",
          width = 720/9,
          height = 258,
          frame_count = 9,
          shift = util.by_pixel(-0, -25),
          animation_speed = 1,
          scale = 0.5,
        },
      },
    },
  }
}



data:extend {
  {
    type = "item",
    name = "linox-building_linox-supercomputer",
    icon = "__space-exploration-graphics__/graphics/icons/supercomputer-3.png",
    icon_size = 64,
    subgroup = "production-machine",
    order = "z[lab]-a",
    stack_size = 10,
    weight = 10 * tons,
    place_result = "linox-building_linox-supercomputer",
    default_import_location = "linox-planet_linox",
  },
}



local recipe = {
  type = "recipe",
  name = "linox-building_linox-supercomputer",
  energy_required = 3,
  enabled = false,
  ingredients =
  {
    {type = "item", name = "tungsten-gear-wheel", amount = 10},
    {type = "item", name = "tungsten-stick", amount = 10},
    {type = "item", name = "electronic-circuit", amount = 25},
    {type = "item", name = "iron-plate", amount = 10},
    {type = "item", name = "copper-plate", amount = 10},
  },
  surface_conditions =
    {
      {
        property = "magnetic-field",
        min = 1600,
        max = 1600,
      },
      {
        property = "gravity",
        min = 2,
        max = 2
      },
    },
  results = {{type="item", name="linox-building_linox-supercomputer", amount=1}},
}

data:extend { recipe, }