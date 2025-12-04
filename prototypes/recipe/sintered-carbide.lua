local util_icon = require("scripts.util.icon")

data:extend {
  {
    type = "recipe",
    name = "linox-recipe_sintered-carbide",
    icons = util_icon.recipe_icon_sintering("__space-age__/graphics/icons/tungsten-carbide.png", 64),
    energy_required = 1,
    enabled = false,
    category = "linox-recipe-category_sintering",
    ingredients =
    {
      {type = "item", name = "coal", amount = 4},
      {type = "item", name = "tungsten-ore", amount = 2},
    },
    results = {{type="item", name="tungsten-carbide", amount = 1}},
    auto_recycle = false,
    allow_productivity = true,
  },
}