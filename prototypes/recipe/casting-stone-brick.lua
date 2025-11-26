local util_icon = require("scripts.util.icon")

data:extend {
  {
    type = "recipe",
    name = "linox-recipe_casting-stone-brick",
    icons = util_icon.recipe_icon_linox("__base__/graphics/icons/stone-brick.png", 64),
    category = "metallurgy",
    energy_required = 3.2,
    enabled = false,
    ingredients = {{type = "item", name = "stone", amount = 2}},
    results = {{type="item", name="stone-brick", amount = 2}},
    allow_productivity = true
  },
}