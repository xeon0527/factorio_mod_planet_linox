local sounds = require("__base__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")

local glow_tint = {1,1,1,1}

data:extend {
  {
    type = "item",
    name = "linox-building_huge-heat-exchanger",
    icon = "__space-exploration-graphics__/graphics/icons/big-heat-exchanger.png",
    icon_size = 64,

    subgroup = "energy",
    order = "f[nuclear-energy]-c[heat-exchanger]",
    inventory_move_sound = item_sounds.steam_inventory_move,
    pick_sound = item_sounds.steam_inventory_pickup,
    drop_sound = item_sounds.steam_inventory_move,
    place_result = "linox-building_huge-heat-exchanger",
    default_import_location = "linox-planet_linox",
    stack_size = 1,
    weight = 1000 * kg,
  },

  {
    type = "recipe",
    name = "linox-building_huge-heat-exchanger",
    energy_required = 60,
    enabled = false,
    ingredients = {
      {type = "item", name = "tungsten-plate", amount = 100},
      {type = "item", name = "tungsten-stick", amount = 100},
      {type = "item", name = "pipe", amount = 100},
      {type = "item", name = "copper-plate", amount = 1000},
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
      }
    },
    results = {{type = "item", name = "linox-building_huge-heat-exchanger", amount = 1}},
  },

  {
    type = "boiler",
    name = "linox-building_huge-heat-exchanger",
    icon = "__space-exploration-graphics__/graphics/icons/big-heat-exchanger.png",
    icon_size = 64,
    burning_cooldown = 20,
    collision_box = {{-2.3,-2.3},{2.3,2.3}},
    selection_box = {{-2.5,-2.5},{2.5,2.5}},
    drawing_box_vertical_extension = 1.5,
    corpse = "big-remnants",
    damaged_trigger_effect = {
      entity_name = "spark-explosion",
      offset_deviation = {{ -0.5, -0.5 },{ 0.5, 0.5 }},
      offsets = {{ 0, 1 }},
      type = "create-entity"
    },
    dying_explosion = "medium-explosion",
    energy_consumption = "250MW",
    max_health = 500,
    minable = {
      mining_time = 1.0,
      result = "linox-building_huge-heat-exchanger",
    },

    energy_source = {
      connections = {
        {
          direction = defines.direction.south,
          position = {
            x=0,
            y=2
          }
        }
      },
      heat_glow = {
        east = {
          filename = "__base__/graphics/entity/heat-exchanger/heatex-E-heated.png",
          height = 62,
          priority = "extra-high",
          shift = {
            -0.6875-1.5,
            -0.375-0.5
          },
          width = 60
        },
        north = {
          filename = "__base__/graphics/entity/heat-exchanger/heatex-N-heated.png",
          height = 70,
          priority = "extra-high",
          shift = {
            0,
            0.25+1
          },
          tint = {
            b = 0.75,
            g = 0.85,
            r = 1
          },
          width = 38
        },
        south = {
          filename = "__base__/graphics/entity/heat-exchanger/heatex-S-heated.png",
          height = 40,
          priority = "extra-high",
          shift = {
            0,
            -1.125-1
          },
          tint = nil,
          width = 28
        },
        west = {
          filename = "__base__/graphics/entity/heat-exchanger/heatex-W-heated.png",
          height = 64,
          priority = "extra-high",
          shift = {
            0.625+1.5,
            -0.375-0.5
          },
          width = 60
        }
      },
      heat_picture = {
        east = {
          tint = glow_tint,
          blend_mode = "additive",
          filename = "__space-exploration-graphics-3__/graphics/entity/big-heat-exchanger/east_heated.png",
          frame_count = 1,
          line_length = 1,
          width = 128,
          height = 128,
          shift = {-2,-0.5},
          scale = 0.5,
        },
        north = {
          tint = glow_tint,
          blend_mode = "additive",
          filename = "__space-exploration-graphics-3__/graphics/entity/big-heat-exchanger/north_heated.png",
          frame_count = 1,
          line_length = 1,
          width = 64,
          height = 160,
          shift = {0,1.25},
          scale = 0.5,
        },
        south = {
          tint = glow_tint,
          blend_mode = "additive",
          filename = "__space-exploration-graphics-3__/graphics/entity/big-heat-exchanger/south_heated.png",
          frame_count = 1,
          line_length = 1,
          width = 64,
          height = 64,
          shift = {0,-2.5},
          scale = 0.5,
        },
        west = {
          tint = glow_tint,
          blend_mode = "additive",
          filename = "__space-exploration-graphics-3__/graphics/entity/big-heat-exchanger/west_heated.png",
          frame_count = 1,
          line_length = 1,
          width = 128,
          height = 128,
          shift = {2,-0.5},
          scale = 0.5,
        },
      },
      heat_pipe_covers = {
        east = {
          tint = glow_tint,
          blend_mode = "additive",
          filename = "__base__/graphics/entity/heat-exchanger/heatex-endings-heated.png",
          frame_count = 1,
          height = 64,
          priority = "high",
          scale = 0.5,
          width = 64,
          x = 64,
          y = 0
        },
        north = {
          tint = glow_tint,
          blend_mode = "additive",
          filename = "__base__/graphics/entity/heat-exchanger/heatex-endings-heated.png",
          frame_count = 1,
          height = 64,
          priority = "high",
          scale = 0.5,
          width = 64,
          x = 0,
          y = 0
        },
        south = {
          tint = glow_tint,
          blend_mode = "additive",
          filename = "__base__/graphics/entity/heat-exchanger/heatex-endings-heated.png",
          frame_count = 1,
          height = 64,
          priority = "high",
          scale = 0.5,
          width = 64,
          x = 128,
          y = 0
        },
        west = {
          tint = glow_tint,
          blend_mode = "additive",
          filename = "__base__/graphics/entity/heat-exchanger/heatex-endings-heated.png",
          frame_count = 1,
          height = 64,
          priority = "high",
          scale = 0.5,
          width = 64,
          x = 192,
          y = 0
        }
      },
      max_temperature = 1000,
      max_transfer = "2GW",
      min_working_temperature = 500,
      minimum_glow_temperature = 350,
      pipe_covers = {
        east = {
          filename = "__base__/graphics/entity/heat-exchanger/heatex-endings.png",
          frame_count = 1,
          height = 64,
          priority = "high",
          scale = 0.5,
          width = 64,
          x = 64,
          y = 0
        },
        north = {
          filename = "__base__/graphics/entity/heat-exchanger/heatex-endings.png",
          frame_count = 1,
          height = 64,
          priority = "high",
          scale = 0.5,
          width = 64,
          x = 0,
          y = 0
        },
        south = {
          filename = "__base__/graphics/entity/heat-exchanger/heatex-endings.png",
          frame_count = 1,
          height = 64,
          priority = "high",
          scale = 0.5,
          width = 64,
          x = 128,
          y = 0
        },
        west = {
          filename = "__base__/graphics/entity/heat-exchanger/heatex-endings.png",
          frame_count = 1,
          height = 64,
          priority = "high",
          scale = 0.5,
          width = 64,
          x = 192,
          y = 0
        }
      },
      specific_heat = "1MJ",
      type = "heat"
    },
    fire = {},
    fire_glow = {},
    flags = {
      "placeable-neutral",
      "player-creation"
    },

    fluid_box = {
      volume = 1000,
      filter = "water",
      height = 2,
      pipe_connections = {
        {
          position = {
            -2,
            1
          },
          flow_direction = "input-output",
          direction = defines.direction.west,
        },
        {
          position = {
            2,
            1
          },
          flow_direction = "input-output",
          direction = defines.direction.east
        }
      },
      pipe_covers = {
        east = {
          layers = {
            {
              filename = "__base__/graphics/entity/pipe-covers/pipe-cover-east.png",
              height = 128,
              priority = "extra-high",
              scale = 0.5,
              width = 128
            },
            {
              draw_as_shadow = true,
              filename = "__base__/graphics/entity/pipe-covers/pipe-cover-east-shadow.png",
              height = 128,
              priority = "extra-high",
              scale = 0.5,
              width = 128
            }
          }
        },
        north = {
          layers = {
            {
              filename = "__base__/graphics/entity/pipe-covers/pipe-cover-north.png",
              height = 128,
              priority = "extra-high",
              scale = 0.5,
              width = 128
            },
            {
              draw_as_shadow = true,
              filename = "__base__/graphics/entity/pipe-covers/pipe-cover-north-shadow.png",
              height = 128,
              priority = "extra-high",
              scale = 0.5,
              width = 128
            }
          }
        },
        south = {
          layers = {
            {
              filename = "__base__/graphics/entity/pipe-covers/pipe-cover-south.png",
              height = 128,
              priority = "extra-high",
              scale = 0.5,
              width = 128
            },
            {
              draw_as_shadow = true,
              filename = "__base__/graphics/entity/pipe-covers/pipe-cover-south-shadow.png",
              height = 128,
              priority = "extra-high",
              scale = 0.5,
              width = 128
            }
          }
        },
        west = {
          layers = {
            {
              filename = "__base__/graphics/entity/pipe-covers/pipe-cover-west.png",
              height = 128,
              priority = "extra-high",
              scale = 0.5,
              width = 128
            },
            {
              draw_as_shadow = true,
              filename = "__base__/graphics/entity/pipe-covers/pipe-cover-west-shadow.png",
              height = 128,
              priority = "extra-high",
              scale = 0.5,
              width = 128
            }
          }
        }
      },
      production_type = "input-output"
    },
    mode = "output-to-separate-pipe",
    output_fluid_box = {
      volume = 2000,
      
      filter = "steam",
      height = 2,
      pipe_connections = {
        {
          position = {
            0,
            -2
          },
          flow_direction = "output",
          direction = defines.direction.north
        }
      },
      pipe_covers = {
        east = {
          layers = {
            {
              filename = "__base__/graphics/entity/pipe-covers/pipe-cover-east.png",
              height = 128,
              priority = "extra-high",
              scale = 0.5,
              width = 128
            },
            {
              draw_as_shadow = true,
              filename = "__base__/graphics/entity/pipe-covers/pipe-cover-east-shadow.png",
              height = 128,
              priority = "extra-high",
              scale = 0.5,
              width = 128
            }
          }
        },
        north = {
          layers = {
            {
              filename = "__base__/graphics/entity/pipe-covers/pipe-cover-north.png",
              height = 128,
              priority = "extra-high",
              scale = 0.5,
              width = 128
            },
            {
              draw_as_shadow = true,
              filename = "__base__/graphics/entity/pipe-covers/pipe-cover-north-shadow.png",
              height = 128,
              priority = "extra-high",
              scale = 0.5,
              width = 128
            }
          }
        },
        south = {
          layers = {
            {
              filename = "__base__/graphics/entity/pipe-covers/pipe-cover-south.png",
              height = 128,
              priority = "extra-high",
              scale = 0.5,
              width = 128
            },
            {
              draw_as_shadow = true,
              filename = "__base__/graphics/entity/pipe-covers/pipe-cover-south-shadow.png",
              height = 128,
              priority = "extra-high",
              scale = 0.5,
              width = 128
            }
          }
        },
        west = {
          layers = {
            {
              filename = "__base__/graphics/entity/pipe-covers/pipe-cover-west.png",
              height = 128,
              priority = "extra-high",
              scale = 0.5,
              width = 128
            },
            {
              draw_as_shadow = true,
              filename = "__base__/graphics/entity/pipe-covers/pipe-cover-west-shadow.png",
              height = 128,
              priority = "extra-high",
              scale = 0.5,
              width = 128
            }
          }
        }
      },
      production_type = "output"
    },

    pictures =
    {
      east = {
        structure = {
          layers = {
            {
              filename = "__space-exploration-graphics-3__/graphics/entity/big-heat-exchanger/east.png",
              frame_count = 1,
              line_length = 1,
              width = 384,
              height = 384,
              shift = {0,-0.5},
              scale = 0.5,
            },
            {
              draw_as_shadow = true,
              filename = "__space-exploration-graphics-3__/graphics/entity/big-heat-exchanger/east_shadow.png",
              frame_count = 1,
              line_length = 1,
              width = 512,
              height = 352,
              shift = {1,0.25},
              scale = 0.5,
            },
          }
      },
      },
      north = {
        structure = {
          layers = {
            {
              filename = "__space-exploration-graphics-3__/graphics/entity/big-heat-exchanger/north.png",
              frame_count = 1,
              line_length = 1,
              width = 384,
              height = 384,
              shift = {0,-0.5},
              scale = 0.5,
            },
            {
              draw_as_shadow = true,
              filename = "__space-exploration-graphics-3__/graphics/entity/big-heat-exchanger/north_shadow.png",
              frame_count = 1,
              line_length = 1,
              width = 512,
              height = 320,
              shift = {1.5,0.5},
              scale = 0.5,
            },
          }
      },
      },
      south = {
        structure = {
          layers = {
            {
              filename = "__space-exploration-graphics-3__/graphics/entity/big-heat-exchanger/south.png",
              frame_count = 1,
              line_length = 1,
              width = 384,
              height = 384,
              shift = {0,-0.5},
              scale = 0.5,
            },
            {
              draw_as_shadow = true,
              filename = "__space-exploration-graphics-3__/graphics/entity/big-heat-exchanger/south_shadow.png",
              frame_count = 1,
              line_length = 1,
              width = 512,
              height = 256,
              shift = {1.5,0.5},
              scale = 0.5,
            },
          }
      },
      },
      west = {
        structure = {
          layers = {
            {
              filename = "__space-exploration-graphics-3__/graphics/entity/big-heat-exchanger/west.png",
              frame_count = 1,
              line_length = 1,
              width = 384,
              height = 384,
              shift = {0,-0.5},
              scale = 0.5,
            },
            {
              draw_as_shadow = true,
              filename = "__space-exploration-graphics-3__/graphics/entity/big-heat-exchanger/west_shadow.png",
              frame_count = 1,
              line_length = 1,
              width = 448,
              height = 352,
              shift = {1,0.25},
              scale = 0.5,
            },
          }
        }
      },
    },
    target_temperature = 500,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    impact_category = "metal",
    working_sound = {
      fade_in_ticks = 10,
      fade_out_ticks = 30,
      max_sounds_per_type = 3,
      sound = {
        filename = "__base__/sound/boiler.ogg",
        volume = 2.0
      }
    },
  },
}