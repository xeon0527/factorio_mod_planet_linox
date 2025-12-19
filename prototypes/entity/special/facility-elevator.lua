data:extend {
  {
    type = "simple-entity",
    name = "linox-special_facility-elevator",
    icon = "__space-exploration-graphics-5__/graphics/icons/space-elevator.png",
    icon_size = 64,
    flags = {
      "not-rotatable",
      "not-repairable",
      "not-deconstructable",
      "not-blueprintable",
      "hide-alt-info",
      "not-flammable",
      "no-automated-item-removal",
      "no-automated-item-insertion",
      "not-upgradable",
      "not-in-kill-statistics",
      "not-in-made-in",
    },
    map_color = { 1, 1, 1 },

    collision_box = {{-3.9, -3.9}, {3.9, 3.9}},
    selection_box = {{-4, -4}, {4, 4}},
    collision_mask = {layers={item=true, object=true, player=true, water_tile=true, elevated_rail=true, is_object=true, is_lower_object=true}},

    max_health = 1000,

    render_layer = "object",
    pictures = {
      layers = {
        {
          filename = "__space-exploration-graphics-5__/graphics/entity/space-elevator/space-elevator-left.png",
          priority = "high",
          width = 1664,
          height = 1664,
          --shift = util.by_pixel(0, 0),
          scale = 0.154,
        },
        {
          filename = "__space-exploration-graphics-5__/graphics/entity/space-elevator/space-elevator-shadow.png",
          priority = "high",
          width = 2304,
          height = 1344,
          shift = util.by_pixel(0.924*64, 0.308*64 + 5),
          scale = 0.154,
          draw_as_shadow = true,
        }
      }
    }
  }
}