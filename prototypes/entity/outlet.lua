local item_sounds = require("__base__.prototypes.item_sounds")

local tint = { 222, 232, 107 }
local entity = table.deepcopy(data.raw["offshore-pump"]["offshore-pump"]);

entity.graphics_set.animation.north.layers[1].tint  = tint
entity.graphics_set.animation.east.layers[1].tint   = tint
entity.graphics_set.animation.south.layers[1].tint  = tint
entity.graphics_set.animation.west.layers[1].tint   = tint

data:extend {
  {
    type = "furnace",
    name = "linox-building_outlet",
    icons = {{
      icon = "__base__/graphics/icons/offshore-pump.png",
      tint = tint,
    }};

    flags = {"placeable-neutral", "player-creation", "filter-directions"},
    collision_mask = {layers={object=true, train=true, is_object=true, is_lower_object=true}}, -- collide just with object-layer and train-layer which don't collide with water, this allows us to build on 1 tile wide ground
    tile_buildability_rules =
    {
      {area = {{-0.4, -0.4}, {0.4, 0.4}}, required_tiles = {layers={ground_tile=true}}, colliding_tiles = {layers={water_tile=true}}, remove_on_collision = true},
      {area = {{-1, -2}, {1, -1}}, required_tiles = {layers={water_tile=true}}, colliding_tiles = {layers={}}},
    },
    minable = {mining_time = 0.1, result = "linox-building_outlet"},
    fast_replaceable_group = "linox-building_outlet",
    max_health = 150,
    source_inventory_size = 0,
		result_inventory_size = 0,
    crafting_categories = { "linox-recipe-category_outlet" },
    crafting_speed = 1,
    corpse = "offshore-pump-remnants",
    dying_explosion = "offshore-pump-explosion",
    fluid_source_offset = {0, -1},
    resistances =
    {
      {
        type = "fire",
        percent = 70
      },
      {
        type = "impact",
        percent = 30
      }
    },
    collision_box = {{-0.6, -1.05}, {0.6, 0.3}},
    selection_box = {{-0.6, -1.49}, {0.6, 0.49}},
    damaged_trigger_effect = entity.damaged_trigger_effect,
    fluid_boxes =
    {
      {
        volume = 100,
        pipe_covers = pipecoverspictures(),
        production_type = "input",
        pipe_connections =
        {
          {
            position = {0, 0},
  ---@diagnostic disable-next-line: assign-type-mismatch
            direction = defines.direction.south,
            flow_direction = "input"
          }
        }
      }
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "10kW",
      emissions_per_minute = { pollution = 25 },
    },
    energy_usage = "490kW",
    tile_width = 1,
    tile_height = 1,
    impact_category = "metal",
    open_sound = entity.open_sound,
    close_sound = entity.close_sound,
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/offshore-pump.ogg",
        volume = 0.5,
        modifiers = volume_multiplier("tips-and-tricks", 1.1),
        audible_distance_modifier = 0.7,
      },
      match_volume_to_activity = true,
      max_sounds_per_prototype = 3,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    perceived_performance = {minimum = 0.5},
    always_draw_fluid = true,

    graphics_set = entity.graphics_set,
  },

  {
    type = "item",
    name = "linox-building_outlet",
    icons = {{
      icon = "__base__/graphics/icons/offshore-pump.png",
      tint = tint,
    }},
    subgroup = "extraction-machine",
    order = "b[pipe]-d[turbo-pump]",
    place_result = "linox-building_outlet",
    stack_size = 50,
    default_import_location = "linox-planet_linox",
    weight = 20 * kg,

    inventory_move_sound = item_sounds.fluid_inventory_move,
    pick_sound = item_sounds.fluid_inventory_pickup,
    drop_sound = item_sounds.fluid_inventory_move,
  },

  {
    type = "recipe",
    name = "linox-building_outlet",
    energy_required = 3,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "offshore-pump", amount = 1},
      {type = "item", name = "pipe", amount = 5},
      {type = "item", name = "tungsten-carbide", amount = 2},
      {type = "item", name = "tungsten-gear-wheel", amount = 5},
      {type = "item", name = "samarium", amount = 1},
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
    results = {{type="item", name="linox-building_outlet", amount=1}}
  }
  
}