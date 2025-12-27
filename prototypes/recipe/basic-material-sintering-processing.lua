local util_icon = require("scripts.util.icon")

data:extend {
  {
    type = "recipe",
    name = "linox-recipe_sintering-iron-plate",
    icons = util_icon.recipe_icon_sintering("__base__/graphics/icons/iron-plate.png", 64),
    energy_required = 1,
    enabled = false,
    category = "linox-recipe-category_sintering",
    ingredients =
    {
      {type = "item", name = "iron-ore", amount = 1},
    },
    results = {{type="item", name="iron-plate", amount = 2}},
    auto_recycle = false,
    allow_productivity = true,
    maximum_productivity = 5.0,
  },

  {
    type = "recipe",
    name = "linox-recipe_sintering-iron-gear-wheel",
    icons = util_icon.recipe_icon_sintering("__base__/graphics/icons/iron-gear-wheel.png", 64),
    energy_required = 1,
    enabled = false,
    category = "linox-recipe-category_sintering",
    ingredients =
    {
      {type = "item", name = "iron-ore", amount = 1},
    },
    results = {{type="item", name="iron-gear-wheel", amount = 2}},
    auto_recycle = false,
    allow_productivity = true,
    maximum_productivity = 5.0,
  },

  {
    type = "recipe",
    name = "linox-recipe_sintering-iron-stick",
    icons = util_icon.recipe_icon_sintering("__base__/graphics/icons/iron-stick.png", 64),
    energy_required = 1,
    enabled = false,
    category = "linox-recipe-category_sintering",
    ingredients =
    {
      {type = "item", name = "iron-ore", amount = 1},
    },
    results = {{type="item", name="iron-stick", amount = 4}},
    auto_recycle = false,
    allow_productivity = true,
    maximum_productivity = 5.0,
  },

  {
    type = "recipe",
    name = "linox-recipe_sintering-copper-plate",
    icons = util_icon.recipe_icon_sintering("__base__/graphics/icons/copper-plate.png", 64),
    energy_required = 1,
    enabled = false,
    category = "linox-recipe-category_sintering",
    ingredients =
    {
      {type = "item", name = "copper-ore", amount = 1},
    },
    results = {{type="item", name="copper-plate", amount = 2}},
    auto_recycle = false,
    allow_productivity = true,
    maximum_productivity = 5.0,
  },

  {
    type = "recipe",
    name = "linox-recipe_sintering-copper-cable",
    icons = util_icon.recipe_icon_sintering("__base__/graphics/icons/copper-cable.png", 64),
    energy_required = 1,
    enabled = false,
    category = "linox-recipe-category_sintering",
    ingredients =
    {
      {type = "item", name = "copper-ore", amount = 1},
    },
    results = {{type="item", name="copper-cable", amount = 4}},
    auto_recycle = false,
    allow_productivity = true,
    maximum_productivity = 5.0,
  },

  {
    type = "recipe",
    name = "linox-recipe_sintering-steel-plate",
    icons = util_icon.recipe_icon_sintering("__base__/graphics/icons/steel-plate.png", 64),
    energy_required = 3,
    enabled = false,
    category = "linox-recipe-category_sintering",
    ingredients =
    {
      {type = "item", name = "iron-ore", amount = 1},
    },
    results = {{type="item", name="steel-plate", amount = 1}},
    auto_recycle = false,
    allow_productivity = true,
    emissions_multiplier = 3,
    maximum_productivity = 5.0,
  },
}