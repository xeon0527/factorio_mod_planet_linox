data:extend {
  {
    type = "recipe",
    name = "linox-recipe_tungsten-extraction",
    subgroup = "vulcanus-processes",
    order = "c[tungsten]-aa",
    energy_required = 16,
    enabled = false,
    category = "metallurgy",
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
    ingredients =
    {
      {type = "fluid", name = "lava", amount = 500},
      {type = "item", name = "calcite", amount = 1},
    },
    results = {
      {type = "item", name = "stone", amount = 15},
      {type = "item", name="tungsten-ore", amount=5}
    },
    icon = "__space-age__/graphics/icons/tungsten-ore.png",
    icon_size = 64,
    allow_productivity = true,
  },
}