---@diagnostic disable: assign-type-mismatch
local item_sounds = require("__base__.prototypes.item_sounds")

local fan = {
  filename = "__space-exploration-graphics-3__/graphics/entity/big-turbine/fan.png",
  frame_count = 4,
  line_length = 4,
  width = 656/4,
  height = 116,
  run_mode = "backward",
  scale = 0.46,
}

local fan_south = table.deepcopy(fan)
fan_south.shift = util.by_pixel(0, -63.5)
local fan_east = table.deepcopy(fan)
fan_east.shift = util.by_pixel(-10, -58.5)

local length = 10
local width = 7

data:extend {
  {
    type = "generator",
    name = "linox-building_neodymium-permanent-magnet-generator",
    icon = "__space-exploration-graphics__/graphics/icons/big-turbine.png",
    icon_size = 64,
    alert_icon_shift = { 0, 0.375 },
    
    burns_fluid = false,
    scale_fluid_usage = true,
    max_power_output = "250MW",
    fluid_usage_per_tick = 43,

    collision_box = {  { -(width/2-0.25), -(length/2-0.9) }, { (width/2-0.25), (length/2-0.9) } },
    selection_box =  {  { -width/2, -(length/2-0.5) }, { width/2, (length/2-0.5) } },

    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    efficiency = 1,
    minable = {
      mining_time = 1.0,
      result = "linox-building_neodymium-permanent-magnet-generator",
    },

    energy_source = { type = "electric", usage_priority = "secondary-output" },
    fast_replaceable_group = "steam-engine",
    flags = {"placeable-neutral","player-creation"},
    fluid_box = {
      pipe_covers = pipecoverspictures(),
      volume = 2000,
      filter = "steam",
      minimum_temperature = 100.0,
      pipe_connections = {
        {
          position = { 0, 4 },
          flow_direction = "input-output",
          direction = defines.direction.south
        },
        {
          position = { 0, -4 },
          flow_direction = "input-output",
          direction = defines.direction.north
        },
      },
      production_type = "input-output"
    },
    max_health = 2000,
    maximum_temperature = 500,

    perceived_performance = { minimum = 0.25, performance_to_activity_rate = 0.5 },
    smoke = {
      {
        name = "turbine-smoke",
        frequency = 0.3125,
        slow_down_factor = 1,
        starting_frame_deviation = 60,
        starting_vertical_speed = 0.08,
        north_position = fan_south.shift,
        east_position = fan_east.shift,
      }
    },
    impact_category = "metal-large",
    working_sound = table.deepcopy(data.raw.generator["steam-turbine"].working_sound),

    horizontal_animation =
    {
      layers = {
        {
          filename = "__space-exploration-graphics-3__/graphics/entity/big-turbine/east.png",
          frame_count = 1,
          line_length = 1,
          repeat_count = 4,
          width = 640,
          height = 480,
          shift = {0,-0.25},
          scale = 0.45,
        },
        {
          draw_as_shadow = true,
          filename = "__space-exploration-graphics-3__/graphics/entity/big-turbine/east_shadow.png",
          frame_count = 1,
          line_length = 1,
          repeat_count = 4,
          width = 832,
          height = 384,
          shift = {1.35,0.4},
          scale = 0.45,
        },
        fan_east,
      }
    },
    vertical_animation = {
      layers = {
        {
          filename = "__space-exploration-graphics-3__/graphics/entity/big-turbine/south.png",
          frame_count = 1,
          line_length = 1,
          repeat_count = 4,
          width = 448,
          height = 672,
          shift = {0,-0.25},
          scale = 0.45,
        },
        {
          draw_as_shadow = true,
          filename = "__space-exploration-graphics-3__/graphics/entity/big-turbine/south_shadow.png",
          frame_count = 1,
          line_length = 1,
          repeat_count = 4,
          width = 640,
          height = 576,
          shift = {1.35,0.4},
          scale = 0.45,
        },
        fan_south,
      }
    },
  },

  {
    type = "recipe",
    name = "linox-building_neodymium-permanent-magnet-generator",
    energy_required = 60,
    enabled = false,
    ingredients = {
      {type = "item", name = "tungsten-gear-wheel", amount = 100},
      {type = "item", name = "tungsten-stick", amount = 100},
      {type = "item", name = "tungsten-plate", amount = 100},
      {type = "item", name = "pipe", amount = 50},
      {type = "item", name = "copper-cable", amount = 500},
      {type = "item", name = "neodymium-permanent-magnet", amount = 50},
      {type = "item", name = "dysprosium-powder", amount = 5},
      {type = "item", name = "samarium", amount = 25},
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
    results = {{type = "item", name = "linox-building_neodymium-permanent-magnet-generator", amount = 1}},
  },

  {
    type = "item",
    name = "linox-building_neodymium-permanent-magnet-generator",
    icon = "__space-exploration-graphics__/graphics/icons/big-turbine.png",
    icon_size = 64,

    subgroup = "energy",
    order = "f[nuclear-energy]-d[steam-turbine]",
    inventory_move_sound = item_sounds.steam_inventory_move,
    pick_sound = item_sounds.steam_inventory_pickup,
    drop_sound = item_sounds.steam_inventory_move,
    place_result = "linox-building_neodymium-permanent-magnet-generator",
    default_import_location = "linox-planet_linox",
    stack_size = 1,
    weight = 1000 * kg,
  },
}