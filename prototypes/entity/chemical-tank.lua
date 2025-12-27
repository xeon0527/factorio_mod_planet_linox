local tint = { 1.0, 0.33, 0.33 };

---@diagnostic disable: assign-type-mismatch, undefined-global
local hit_effects = require("__base__.prototypes.entity.hit-effects")
local item_sounds = require("__base__.prototypes.item_sounds")

data:extend {
  {
    type = "assembling-machine",
    name = "linox-building_chemical-tank",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "linox-building_chemical-tank"},
    max_health = 300,
    corpse = "assembling-machine-3-remnants",
    dying_explosion = "assembling-machine-3-explosion",

    icon = "__linox__/graphics/icons/chemical-tank.png",
    icon_size = 64,
    collision_box = {{-1.8, -1.8}, {1.8, 1.8}},
    selection_box = {{-2, -2}, {2, 2}},
    damaged_trigger_effect = hit_effects.entity(),
    open_sound = {filename = "__base__/sound/open-close/fluid-open.ogg", volume = 0.55},
    close_sound = {filename = "__base__/sound/open-close/fluid-close.ogg", volume = 0.54},
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
    impact_category = "metal-large",
    working_sound =
    {
      sound = {filename = "__space-age__/sound/entity/biochamber/biochamber-loop.ogg", volume = 0.4},
      max_sounds_per_prototype = 3,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },

    fast_replaceable_group = "assembling-machine",
    crafting_speed = 1,
    crafting_categories = { "linox-recipe-category_chemical-tank" },
    module_slots = 5,

    energy_usage = "700kW",
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "50kW",
      emissions_per_minute = { pollution = 4 }
    },
    forced_symmetry = "horizontal",

    circuit_wire_max_distance = 10,
    circuit_connector = circuit_connector_definitions["electromagnetic-plant"],
    
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures,
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        secondary_draw_orders = { north = -1 },
        pipe_connections = {{ flow_direction="input-output", direction = defines.direction.west, position = {-1.5, 0.5} }}
      },
      {
        production_type = "input",
        pipe_picture = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures,
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        secondary_draw_orders = { north = -1 },
        pipe_connections = {{ flow_direction="input-output", direction = defines.direction.east, position = {1.5, -0.5} }}
      },
      {
        production_type = "output",
        pipe_picture = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures,
        pipe_covers = pipecoverspictures(),
        volume = 100,
        secondary_draw_orders = { north = -1 },
        pipe_connections = {{ flow_direction="input-output", direction = defines.direction.south, position = {0.5, 1.5} }}
      },
      {
        production_type = "output",
        pipe_picture = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures,
        pipe_covers = pipecoverspictures(),
        volume = 100,
        secondary_draw_orders = { north = -1 },
        pipe_connections = {{ flow_direction="input-output", direction = defines.direction.north, position = {-0.5, -1.5} }}
      }
    },
    fluid_boxes_off_when_no_fluid_recipe = true,

    graphics_set =
    {
      animation =
      {
        layers =
        {
          {
            filename = "__linox__/graphics/entity/chemical-tank/oxidizer-hr-animation-1.png",
            animation_speed = 1,
            width = 280,
            height = 320,
            scale = 0.45,
            frame_count = 60,
            line_length = 8,
            shift = util.by_pixel(0, -16),
          },
          {
            filename = "__linox__/graphics/entity/chemical-tank/oxidizer-hr-shadow.png",
            animation_speed = 1,
            width = 700,
            height = 500,
            scale = 0.45,
            frame_count = 1,
            repeat_count = 60,
            draw_as_shadow = true,
            shift = util.by_pixel(0, -16),
          },
          {
            filename = "__linox__/graphics/entity/chemical-tank/oxidizer-hr-color1-1.png",
            animation_speed = 1,
            width = 280,
            height = 320,
            scale = 0.45,
            frame_count = 60,
            line_length = 8,
            shift = util.by_pixel(0, -16),
            tint = tint,
          },
          {
            filename = "__linox__/graphics/entity/chemical-tank/oxidizer-hr-emission-1.png",
            animation_speed = 1,
            width = 280,
            height = 320,
            scale = 0.45,
            frame_count = 60,
            line_length = 8,
            draw_as_glow = true,
            blend_mode = "additive",
            shift = util.by_pixel(0, -16),
          },
        }
      }
    },
  }
}

data:extend {
  {
    type = "item",
    name = "linox-building_chemical-tank",
    icon = "__linox__/graphics/icons/chemical-tank.png",
    icon_size = 64,
    stack_size = 10,
    weight = 100 * kg,
    place_result = "linox-building_chemical-tank",
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
    name = "linox-building_chemical-tank",
    energy_required = 3,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "advanced-circuit", amount = 10},
      {type = "item", name = "tungsten-plate", amount = 10},
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
    --  },
    --},
    results = {{type = "item", name = "linox-building_chemical-tank", amount = 1}}
  },
}