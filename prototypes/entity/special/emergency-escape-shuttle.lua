data:extend
{
  {
    type = "simple-entity",
    name = "linox-special_emergency-escape-shuttle",
    icon = "__space-exploration-graphics__/graphics/icons/space-capsule.png",
    icon_size = 64,
    flags = {
      "not-rotatable",
      "not-repairable",
      "not-blueprintable",
      "hide-alt-info",
      "not-flammable",
      "no-automated-item-removal",
      "no-automated-item-insertion",
      "not-upgradable",
      "not-in-kill-statistics",
      "not-in-made-in",
    },
    minable = {mining_time = 5.0},
    map_color = { 1, 1, 0 },
    hidden = true,
    hidden_in_factoriopedia = true,

    max_health = 500,

    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{-1, -1}, {1, 1}},
    collision_mask = {layers={item=true, object=true, player=true, water_tile=true, elevated_rail=true, is_object=true, is_lower_object=true}},
    
    render_layer = "object",
    pictures = {
      layers = {
        {
          filename = "__space-exploration-graphics__/graphics/entity/space-capsule/space-capsule.png",
          frame_count = 1,
          --y = 362 * 2,
          height = 362,
          width = 188,
          shift = {1/32, -8/32},
          scale = 0.4,
        },
        {
          draw_as_shadow = true,
          filename = "__space-exploration-graphics__/graphics/entity/space-capsule/space-capsule-shadow.png",
          frame_count = 1,
          width = 359,
          height = 120,
          shift = {21/32, 12/32},
          scale = 0.4,
        }
      }
    }
  }
}