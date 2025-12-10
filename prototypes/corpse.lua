---@diagnostic disable: undefined-global
data:extend{
  {
    type = "corpse",
    name = "neodymium-bulk-inserter-remnants",
    icon = "__linox__/graphics/icons/neodymium-bulk-inserter.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "inserter-remnants",
    order = "a-f-aa",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (4,
    {
      filename = "__linox__/graphics/entity/neodymium-bulk-inserter/remnants/bulk-inserter-remnants.png",
      line_length = 1,
      width = 132,
      height = 96,
      direction_count = 1,
      shift = util.by_pixel(3, -1.5),
      scale = 0.5
    })
  },
  {
    type = "corpse",
    name = "neodymium-stack-inserter-remnants",
    icon = "__linox__/graphics/icons/neodymium-stack-inserter.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "inserter-remnants",
    order = "a-h-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (4,
    {
      filename = "__linox__/graphics/entity/neodymium-stack-inserter/remnants/stack-inserter-remnants.png",
      line_length = 1,
      width = 132,
      height = 96,
      direction_count = 1,
      shift = util.by_pixel(3, -1.5),
      scale = 0.5
    })
  },
}