data:extend {
  {
    type = "recipe",
    name = "linox-recipe_tungsten-extraction",
    energy_required = 16,
    enabled = false,
    category = "metallurgy",
    subgroup = "vulcanus-processes",
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