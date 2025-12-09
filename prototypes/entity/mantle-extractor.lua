local shadow =
{
  filename = "__space-exploration-graphics-3__/graphics/entity/core-miner/core-miner-shadow.png",
  priority = "high",
  width = 951,
  height = 491,
  frame_count = 1,
  shift = {2 + 3/32, 1 + 22/32},
  draw_as_shadow = true,
  scale=0.5,
}

local shadow_anim = table.deepcopy(shadow);
shadow_anim.repeat_count = 30;

data:extend {
  {
    type = "offshore-pump",
    name = "linox-building_mantle-extractor",
    icon = "__space-exploration-graphics__/graphics/icons/core-miner.png",
    icon_size = 64,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.5, result = "linox-building_mantle-extractor"},
    max_health = 1000,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-5.2, -5.2}, {5.2, 5.2}},
    collision_mask = {layers={item=true, object=true, player=true, water_tile=true, elevated_rail=true, is_object=true, is_lower_object=true, meltable=true}},
    selection_box = {{-5.5, -5.5}, {5.5, 5.5}},
    damaged_trigger_effect = require ("__base__.prototypes.entity.hit-effects").entity(),
    pumping_speed = 8.333334,
    fluid_source_offset = { 0, 0 },
    tile_buildability_rules = nil,
    energy_usage = "25MW",
    vector_to_place_result = { 0, -5.85 },
    --module_slots = 4,

    surface_conditions = {
      { property = "magnetic-field", min = 1 },
      { property = "gravity", min = 1 }
    },
    
    fluid_box =
    {
      filter = "lava",
      volume = 100,
      pipe_covers = pipecoverspictures(),
      production_type = "output",
      pipe_connections =
      {
        {
          position = {0, -5.05 },
---@diagnostic disable-next-line: assign-type-mismatch
          direction = defines.direction.north,
          flow_direction = "output"
        }
      }
    },



    graphics_set = {
      always_draw_idle_animation = false,
      animation = {
        layers = {
          shadow_anim,
          {
            priority = "high",
            width = 691,
            height = 737,
            frame_count = 30,
            animation_speed = 1,
            shift = {0, -8/32},
            scale=0.5,
            stripes =
            {
              {
                filename = "__space-exploration-graphics-3__/graphics/entity/core-miner/core-miner-1.png",
                width_in_frames = 2,
                height_in_frames = 2,
              },
              {
                filename = "__space-exploration-graphics-3__/graphics/entity/core-miner/core-miner-2.png",
                width_in_frames = 2,
                height_in_frames = 2,
              },
              {
                filename = "__space-exploration-graphics-3__/graphics/entity/core-miner/core-miner-3.png",
                width_in_frames = 2,
                height_in_frames = 2,
              },
              {
                filename = "__space-exploration-graphics-3__/graphics/entity/core-miner/core-miner-4.png",
                width_in_frames = 2,
                height_in_frames = 2,
              },
              {
                filename = "__space-exploration-graphics-3__/graphics/entity/core-miner/core-miner-5.png",
                width_in_frames = 2,
                height_in_frames = 2,
              },
              {
                filename = "__space-exploration-graphics-3__/graphics/entity/core-miner/core-miner-6.png",
                width_in_frames = 2,
                height_in_frames = 2,
              },
              {
                filename = "__space-exploration-graphics-3__/graphics/entity/core-miner/core-miner-7.png",
                width_in_frames = 2,
                height_in_frames = 2,
              },
              {
                filename = "__space-exploration-graphics-3__/graphics/entity/core-miner/core-miner-8.png",
                width_in_frames = 2,
                height_in_frames = 1,
              },
            },
          },
        }
      },
      working_visualisations =
      {
        { animation = shadow },
        {
          effect = "uranium-glow", -- changes alpha based on energy source light intensity
          light = {intensity = 1, size = 32, shift = {0.0, 0.0}, color = {r = 1.0, g = 0.6, b = 0.1}}
        },
      },
    },
    impact_category = "metal-large",
    working_sound =
    {
      sound =
      {
        {
          filename = "__base__/sound/electric-mining-drill.ogg",
          volume = 1
        },
      },
      apparent_volume = 2
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 350 },
    },
  }
}



data:extend {
  {
    type = "item",
    name = "linox-building_mantle-extractor",
    icon = "__space-exploration-graphics__/graphics/icons/core-miner.png",
    icon_size = 64,
    stack_size = 1,
    weight = 1 * tons,
    place_result = "linox-building_mantle-extractor",
    subgroup = "extraction-machine",
    order = "b[fluids]-b[offshore-pump]",
    default_import_location = "linox-planet_linox",
  },
}



local recipe = {
  type = "recipe",
  name = "linox-building_mantle-extractor",
  energy_required = 60,
  enabled = false,
  ingredients =
  {
    {type = "item", name = "tungsten-plate", amount = 250},
    {type = "item", name = "pumpjack", amount = 10},
    {type = "item", name = "steel-plate", amount = 100},
    {type = "item", name = "concrete", amount = 100},
    {type = "item", name = "pipe", amount = 500},
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
  results = {{type="item", name="linox-building_mantle-extractor", amount=1}},
  auto_recycle = true,
}

data:extend { recipe, }