local util_icon = require("scripts.util.icon")

data:extend {
  {
    type = "recipe",
    name = "linox-recipe_tungsten-extraction",
    icons = util_icon.recipe_icon_linox("__space-age__/graphics/icons/tungsten-ore.png", 64),
    subgroup = "vulcanus-processes",
    order = "c[tungsten]-aa",
    energy_required = 8,
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
      {type = "item", name = "stone", amount = 10},
      {type = "item", name="tungsten-ore", amount=5}
    },
    allow_productivity = true,
  },
}