local util_icon = require("scripts.util.icon")

data:extend {
  {
    type = "recipe",
    name = "linox-recipe_rapid-distillation",
    icons = util_icon.recipe_icon_linox("__base__/graphics/icons/fluid/coal-liquefaction.png", 64),
    energy_required = 5,
    enabled = false,
    category = "oil-processing",
    ingredients =
    {
      {type = "fluid", name = "lava", amount = 150, fluidbox_index = 1},
      {type = "fluid", name = "crude-oil", amount = 50, fluidbox_index = 2},
    },
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
    results = {
      { type = "item", name = "coal", amount = 5 },
    },
    allow_productivity = true,
  },
  {
    type = "recipe",
    name = "linox-recipe_lava-based-rocket-fuel",
    icons = util_icon.recipe_icon_linox("__base__/graphics/icons/rocket-fuel.png", 64),
    energy_required = 5,
    enabled = false,
    category = "chemistry",
    ingredients =
    {
      { type = "fluid", name = "lava", amount = 100 },
      { type = "item", name = "solid-fuel", amount = 2, },
    },
    results = {
      { type = "item", name = "rocket-fuel", amount = 1 },
    },
    allow_productivity = true,
  },
}