---@diagnostic disable: assign-type-mismatch
local __tint = { 1.0, 1.0, 1.0 }

data:extend {
  {
    type = "assembling-machine",
    name = "linox-special_internel-pipeline",
    icons = {
      {
        icon = "__space-exploration-graphics__/graphics/icons/radiator-blue.png",
        tint = __tint,
      }
    },

    flag = {
      "not-rotatable",
      "not-repairable",
      "not-deconstructable",
      "not-blueprintable",
      "not-flammable",
      "no-automated-item-removal",
      "no-automated-item-insertion",
      "not-upgradable",
      "not-in-kill-statistics",
      "not-in-made-in",
    },

    max_health = 1000,
    --allowed_effects = {"speed", "productivity"},

    crafting_speed = 1,
    crafting_categories = { "linox-recipe-category_internel-pipeline" },
    map_color = {1.0, 0.5, 0.0},
    fixed_quality = "normal",

    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},

    fluid_boxes = {
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{ flow_direction="output", position = {0, -1}, direction = defines.direction.north }},
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{ flow_direction="output", position = {0, 1}, direction = defines.direction.south }},
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{ flow_direction="output", position = {1, 0}, direction = defines.direction.east }},
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{ flow_direction="output", position = {-1, 0}, direction = defines.direction.west }},
      },
    },

    impact_category = "metal",
    open_sound = {filename = "__base__/sound/open-close/pumpjack-open.ogg", volume = 0.5},
    close_sound = {filename = "__base__/sound/open-close/pumpjack-close.ogg", volume = 0.5},
    working_sound =
    {
      sound = {filename = "__base__/sound/pumpjack.ogg", volume = 0.7, audible_distance_modifier = 0.6},
      max_sounds_per_prototype = 3,
      fade_in_ticks = 4,
      fade_out_ticks = 10
    },

    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
    },
    energy_usage = "1MW",

    graphics_set = {
      animation =
      {
        layers =
        {
          {
            priority = "high",
            width = 196,
            height = 275,
            frame_count = 20,
            shift = util.by_pixel(-0, -12),
            animation_speed = 2/3,
            scale = 0.5,
            tint = __tint,
            stripes =
            {
              {
                filename = "__space-exploration-graphics-4__/graphics/entity/radiator/radiator-blue.png",
                width_in_frames = 10,
                height_in_frames = 2,
              },
            }
          },
          {
            draw_as_shadow = true,
            filename = "__space-exploration-graphics-4__/graphics/entity/radiator/radiator-shadow.png",
            priority = "high",
            width = 242,
            height = 147,
            frame_count = 1,
            line_length = 1,
            repeat_count = 20,
            shift = util.by_pixel(25, 11),
            animation_speed = 2/3,
            scale = 0.5,
          },
        },
      },
    },
  },
}