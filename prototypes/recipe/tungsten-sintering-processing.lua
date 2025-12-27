local util_icon = require("scripts.util.icon")

data:extend {
  {
    type = "recipe",
    name = "linox-recipe_tungsten-sintering-plate",
    icons = util_icon.recipe_icon_sintering("__space-age__/graphics/icons/tungsten-plate.png", 64),
    energy_required = 1,
    enabled = false,
    category = "linox-recipe-category_sintering",
    ingredients =
    {
      {type = "item", name = "tungsten-ore", amount = 2},
    },
    results = {{type="item", name="tungsten-plate", amount=1}},
    auto_recycle = false,
    allow_productivity = true,
    maximum_productivity = 5.0,
  },

  {
    type = "recipe",
    name = "linox-recipe_tungsten-sintering-gear-wheel",
    icons = util_icon.recipe_icon_sintering("__base__/graphics/icons/iron-gear-wheel.png", 64, {1.0, 0.66, 1.0}),
    energy_required = 1,
    enabled = false,
    category = "linox-recipe-category_sintering",
    ingredients =
    {
      {type = "item", name = "tungsten-ore", amount = 2},
    },
    results = {{type="item", name="tungsten-gear-wheel", amount=1}},
    auto_recycle = false,
    allow_productivity = true,
    maximum_productivity = 5.0,
  },

  {
    type = "recipe",
    name = "linox-recipe_tungsten-sintering-stick",
    icons = util_icon.recipe_icon_sintering("__base__/graphics/icons/iron-stick.png", 64, {1.0, 0.66, 1.0}),
    energy_required = 1,
    enabled = false,
    category = "linox-recipe-category_sintering",
    ingredients =
    {
      {type = "item", name = "tungsten-ore", amount = 2},
    },
    results = {{type="item", name="tungsten-stick", amount=2}},
    auto_recycle = false,
    allow_productivity = true,
    maximum_productivity = 5.0,
  },
}