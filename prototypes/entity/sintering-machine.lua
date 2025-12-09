local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")

data:extend {
  {
    type = "assembling-machine",
    name = "linox-building_sintering-machine",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "linox-building_sintering-machine"},
    max_health = 300,
    corpse = "assembling-machine-3-remnants",
    dying_explosion = "assembling-machine-3-explosion",

    icon = "__linox__/graphics/icons/sintering-machine.png",
    collision_box = {{-1.8, -1.8}, {1.8, 1.8}},
    selection_box = {{-2, -2}, {2, 2}},
    damaged_trigger_effect = hit_effects.entity(),
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
    impact_category = "metal",
    working_sound =
    {
      sound = {filename = "__base__/sound/assembling-machine-t3-1.ogg", volume = 0.45, audible_distance_modifier = 0.5},
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },

    fast_replaceable_group = "assembling-machine",
    crafting_speed = 1,
    crafting_categories = { "linox-recipe-category_sintering" },
    module_slots = 5,

    energy_usage = "450kW",
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "50kW",
      emissions_per_minute = { pollution = 4 }
    },

    circuit_wire_max_distance = 10,
    circuit_connector = circuit_connector_definitions["assembling-machine"],

    graphics_set =
    {
      animation =
      {
        layers =
        {
          util.sprite_load("__linox__/graphics/entity/sintering-machine/glass-furnace-hr-animation", {
            animation_speed = 1,
            frame_count = 80,
            scale = 0.48,
            shift = util.by_pixel(0, -12),
          }),
          {
            filename = "__linox__/graphics/entity/sintering-machine/glass-furnace-hr-shadow.png",
            animation_speed = 1,
            width = 500,
            height = 350,
            scale = 0.48,
            frame_count = 1,
            repeat_count = 80,
            draw_as_shadow = true,
            shift = util.by_pixel(0, -12),
          },
          util.sprite_load("__linox__/graphics/entity/sintering-machine/glass-furnace-hr-emission1", {
            animation_speed = 1,
            frame_count = 80,
            scale = 0.48,
            draw_as_glow = true,
            blend_mode = "additive",
            shift = util.by_pixel(0, -12),
          }),
          util.sprite_load("__linox__/graphics/entity/sintering-machine/glass-furnace-hr-emission2", {
            animation_speed = 1,
            frame_count = 80,
            scale = 0.48,
            draw_as_glow = true,
            blend_mode = "additive",
            shift = util.by_pixel(0, -12),
          }),
        }
      }
    },
  }
}

--data:extend { entity, }

data:extend {
  {
    type = "item",
    name = "linox-building_sintering-machine",
    icon = "__linox__/graphics/icons/sintering-machine.png",
    icon_size = 64,
    stack_size = 20,
    weight = 50 * kg,
    place_result = "linox-building_sintering-machine",
    subgroup = "production-machine",
    order = "ca",
    inventory_move_sound = item_sounds.electric_large_inventory_move,
    pick_sound = item_sounds.electric_large_inventory_pickup,
    drop_sound = item_sounds.electric_large_inventory_move,
    default_import_location = "linox-planet_linox",
  },
}

data:extend {
  {
    type = "recipe",
    name = "linox-building_sintering-machine",
    energy_required = 5,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "electronic-circuit", amount = 10},
      {type = "item", name = "tungsten-plate", amount = 10},
      {type = "item", name = "steel-plate", amount = 10},
      {type = "item", name = "tungsten-gear-wheel", amount = 10},
      {type = "item", name = "tungsten-stick", amount = 10},
    },
    --surface_conditions =
    --{
    --  {
    --    property = "magnetic-field",
    --    min = 1600,
    --    max = 1600,
    --  },
    --  {
    --    property = "gravity",
    --    min = 2,
    --    max = 2
    --  }
    --},
    results = {{type="item", name="linox-building_sintering-machine", amount=1}}
  },
}