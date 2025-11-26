local util_icon = require("scripts.util.icon")

data:extend {
  {
    type = "recipe",
    name = "linox-recipe_stone-extraction",
    icons = util_icon.recipe_icon_linox("__base__/graphics/icons/stone.png", 64),
    energy_required = 12,
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