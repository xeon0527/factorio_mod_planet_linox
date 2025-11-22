local tint = { 1.0, 0.33, 0.33 };

data:extend {
  {
    type = "offshore-pump",
    name = "linox-entity_sulfuric-acid-pumpjack",
    icon = "__base__/graphics/icons/pumpjack.png",
    flags = {"placeable-neutral", "player-creation"},
    max_health = 5000,
    corpse = "pumpjack-remnants",
    dying_explosion = "pumpjack-explosion",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    drawing_box_vertical_extension = 1,
    tile_buildability_rules = nil,

    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "500kW",
    },
    energy_usage = "4.5MW",

    pumping_speed = 10,

    fluid_source_offset = { 0, 0 },
    fluid_box =
    {
      filter = "sulfuric-acid",
      volume = 1000,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        {
---@diagnostic disable-next-line: assign-type-mismatch
          direction = defines.direction.north,
          positions = {{1, -1}, {1, -1}, {-1, 1}, {-1, 1}},
          flow_direction = "output"
        }
      }
    },

    graphics_set = {
      base_render_layer = "ground-patch",--"object",
      base_pictures =
      {
        sheets =
        {
          {
            filename = "__base__/graphics/entity/pumpjack/pumpjack-base.png",
            priority = "high",
            width = 261,
            height = 273,
            shift = util.by_pixel(-2.25, -4.75),
            scale = 0.5,
            tint=tint,
          },
          {
            filename = "__base__/graphics/entity/pumpjack/pumpjack-base-shadow.png",
            priority = "high",
            width = 220,
            height = 220,
            scale = 0.5,
            draw_as_shadow = true,
            shift = util.by_pixel(6, 0.5)
          }
        }
      },
      animation =
      {
        north =
        {
          layers =
          {
            {
              filename = "__base__/graphics/entity/pumpjack/pumpjack-horsehead.png",
              priority = "high",
              animation_speed = 0.5,
              scale = 0.5,
              line_length = 8,
              width = 206,
              height = 202,
              frame_count = 40,
              shift = util.by_pixel(-4, -24),
              tint=tint,
            },
            {
              filename = "__base__/graphics/entity/pumpjack/pumpjack-horsehead-shadow.png",
              priority = "high",
              animation_speed = 0.5,
              draw_as_shadow = true,
              line_length = 8,
              width = 309,
              height = 82,
              frame_count = 40,
              scale = 0.5,
              shift = util.by_pixel(17.75, 14.5)
            }
          }
        }
      },
    },
    open_sound = {filename = "__base__/sound/open-close/pumpjack-open.ogg", volume = 0.5},
    close_sound = {filename = "__base__/sound/open-close/pumpjack-close.ogg", volume = 0.5},
    working_sound =
    {
      sound = {filename = "__base__/sound/pumpjack.ogg", volume = 0.7, audible_distance_modifier = 0.6},
      max_sounds_per_prototype = 3,
      fade_in_ticks = 4,
      fade_out_ticks = 10
    },
  }
}