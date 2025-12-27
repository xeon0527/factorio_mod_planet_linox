---@diagnostic disable: assign-type-mismatch
local tint = { 1.0, 0.33, 0.33 };
local hit_effects = require("__base__.prototypes.entity.hit-effects")
local item_sounds = require("__base__.prototypes.item_sounds")

local pipe_pic = table.deepcopy(require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures)
pipe_pic.north.layers[2] = nil
pipe_pic.east.layers[2] = nil
pipe_pic.south.layers[2] = nil
pipe_pic.west.layers[2] = nil

local pipe_covers = table.deepcopy(pipecoverspictures())
pipe_covers.north.layers[2] = nil
pipe_covers.east.layers[2] = nil
pipe_covers.south.layers[2] = nil
pipe_covers.west.layers[2] = nil

data:extend {
  {
    type = "assembling-machine",
    name = "linox-building_chemical-filter",
    icon = "__linox__/graphics/icons/chemical-filter.png",
    icon_size = 64,
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "linox-building_chemical-filter"},
    fast_replaceable_group = "chemical-filter",
    max_health = 300,
    corpse = "chemical-plant-remnants",
    dying_explosion = "chemical-plant-explosion",
    icon_draw_specification = {shift = {0, -0.3}},
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 0.4,
    module_slots = 5,
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},

    crafting_categories = {"linox-recipe-category_chemical-filter"},
    crafting_speed = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 4 },
      drain = "50kW",
    },
    energy_usage = "700kW",

    impact_category = "metal-large",

    open_sound = {filename = "__base__/sound/open-close/fluid-open.ogg", volume = 0.55},
    close_sound = {filename = "__base__/sound/open-close/fluid-close.ogg", volume = 0.54},
    working_sound =
    {
      sound = sound_variations("__base__/sound/chemical-plant", 3, 0.5),
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },

    circuit_wire_max_distance = 10,
    circuit_connector = circuit_connector_definitions["biochamber"],

    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = pipe_pic,
        pipe_covers = pipe_covers,
        volume = 1000,
        secondary_draw_orders = { north = -1 },
        pipe_connections =
        {
          {
            flow_direction="input",
            direction = defines.direction.north,
            position = {-1, -1}
          }
        }
      },
      {
        production_type = "input",
        pipe_picture = pipe_pic,
        pipe_covers = pipe_covers,
        volume = 1000,
        secondary_draw_orders = { north = -1 },
        pipe_connections =
        {
          {
            flow_direction="input",
            direction = defines.direction.north,
            position = {1, -1}
          }
        }
      },
      {
        production_type = "output",
        pipe_picture = pipe_pic,
        pipe_covers = pipe_covers,
        volume = 100,
        secondary_draw_orders = { north = -1 },
        pipe_connections =
        {
          {
            flow_direction = "output",
            direction = defines.direction.south,
            position = {-1, 1}
          }
        }
      },
      {
        production_type = "output",
        pipe_picture = pipe_pic,
        pipe_covers = pipe_covers,
        volume = 100,
        secondary_draw_orders = { north = -1 },
        pipe_connections =
        {
          {
            flow_direction = "output",
            direction = defines.direction.south,
            position = {1, 1}
          }
        }
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
            filename = "__linox__/graphics/entity/chemical-filter/scrubber-animation.png",
            animation_speed = 1,
            width = 210,
            height = 280,
            scale = 0.5,
            frame_count = 60,
            line_length = 10,
            shift = util.by_pixel(0, -8),
          },
          {
            filename = "__linox__/graphics/entity/chemical-filter/scrubber-color1.png",
            animation_speed = 1,
            width = 210,
            height = 280,
            scale = 0.5,
            frame_count = 60,
            line_length = 10,
            shift = util.by_pixel(0, -8),
            tint = tint,
          },
          {
            filename = "__linox__/graphics/entity/chemical-filter/scrubber-shadow.png",
            width = 400,
            height = 350,
            scale = 0.5,
            frame_count = 1,
            repeat_count = 60,
            draw_as_shadow = true,
            shift = util.by_pixel(0, -8),
          },
        }
      }
    },
  },

  {
    type = "item",
    name = "linox-building_chemical-filter",
    icon = "__linox__/graphics/icons/chemical-filter.png",
    icon_size = 64,
    stack_size = 10,
    weight = 100 * kg,
    place_result = "linox-building_chemical-filter",
    subgroup = "production-machine",
    order = "ca",
    inventory_move_sound = item_sounds.electric_large_inventory_move,
    pick_sound = item_sounds.electric_large_inventory_pickup,
    drop_sound = item_sounds.electric_large_inventory_move,
    default_import_location = "linox-planet_linox",
  },

  {
    type = "recipe",
    name = "linox-building_chemical-filter",
    energy_required = 3,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "processing-unit", amount = 10},
      {type = "item", name = "tungsten-plate", amount = 10},
      {type = "item", name = "tungsten-gear-wheel", amount = 10},
      {type = "item", name = "tungsten-stick", amount = 10},
      {type = "item", name = "samarium", amount = 2},
      {type = "item", name = "dysprosium-powder", amount = 2},
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
    results = {{type = "item", name = "linox-building_chemical-filter", amount = 1}}
  },
}