local output_connection_point = {
  wire = { red = {92/64-1.5, -108/64},   green = {102/64-1.5, -102/64}, },
  shadow = { red = {92/64-1.5 + 1, 0.5},   green = {102/64-1.5 + 1, 0.5}, },
}

data:extend {
  {
    type = "container",
    name = "linox-entity_npc-network-terminal",
    flags = {
      "not-rotatable",
      "placeable-neutral",
      "placeable-off-grid",
      "get-by-unit-number", 
      "not-deconstructable",
      "not-blueprintable", 
    },

    icon = "__base__/graphics/icons/accumulator.png",
    max_health = 1000,
    collision_box = {{-1.6, -1.6}, {1.6, 1.6}},
    selection_box = {{-2, -2}, {2, 2}},
    drawing_box_vertical_extension = 0,
    picture = {
      layers =
      {
        {
          filename = "__space-exploration-graphics__/graphics/entity/spaceship-console/spaceship-console-base.png",
          priority = "high",
          width = 256,
          height = 256,
          frame_count = 1,
          line_length = 1,
          shift = util.by_pixel(0, -16+3),
          animation_speed = 1,
          scale = 0.5,
        },
        {
          filename = "__space-exploration-graphics__/graphics/entity/spaceship-console/spaceship-console-white.png",
          priority = "high",
          width = 256,
          height = 256,
          frame_count = 1,
          line_length = 1,
          shift = util.by_pixel(0, -16+3),
          animation_speed = 1,
          scale = 0.5,
          blend_mode = "additive",
          draw_as_glow = true,
        },
        {
          draw_as_shadow = true,
          filename = "__space-exploration-graphics__/graphics/entity/spaceship-console/spaceship-console-shadow.png",
          priority = "high",
          width = 110,
          height = 74,
          frame_count = 1,
          line_length = 1,
          shift = util.by_pixel(75, 16+3),
          animation_speed = 1,
          scale = 0.5,
        },
      }
    },
    inventory_size = 0,
    circuit_wire_max_distance = 10,
    circuit_connector = {
      points = {
        wire = { green = {-92/64, -108/64},   red = {-102/64, -102/64}, },
        shadow = { green = {-92/64 + 1, 0.5},   red = {-102/64 + 1, 0.5}, },
      }
    },
  },
  {
    type = "constant-combinator",
    name = "linox-entity_npc-network-terminal-output",
    icon = "__base__/graphics/icons/accumulator.png",
    hidden = true,
    flags = {"placeable-player", "player-creation", "placeable-off-grid",  "not-rotatable", "not-deconstructable", "hide-alt-info"},
    max_health = 1000,
    collision_box = {{-0.5, -2}, {0.5, 2}},
    selection_box = {{-0.5, -2}, {0.5, 2}},
    scale_info_icons = false,
    selectable_in_game = true,
    selection_priority = 150,
    item_slot_count = 10,
    circuit_wire_connection_points = { output_connection_point,  output_connection_point,  output_connection_point,  output_connection_point, },
    circuit_wire_max_distance = 10,
    activity_led_light = {
      intensity = 0.8,
      size = 1,
    },
    activity_led_light_offsets = {{0, 0},{0, 0},{0, 0},{0, 0}},
  }
}
