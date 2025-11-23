data:extend {
  {
    type = "recipe",
    name = "linox-recipe_stone-extraction",
    energy_required = 16,
    enabled = false,
    category = "metallurgy",
    ingredients =
    {
      {type = "fluid", name = "lava", amount = 500},
      {type = "item", name = "calcite", amount = 1},
    },
    results = {{type="item", name="stone", amount=50}},
    allow_productivity = true,
  },
}