local util_icon = require("scripts.util.icon")

data:extend {
  {
    type = "recipe",
    name = "linox-recipe_linox-foundry",
    icons = util_icon.recipe_icon_linox("__space-age__/graphics/icons/foundry.png", 64),
    categories = {"metallurgy", "crafting-with-fluid"},
    enabled = false,
    ingredients =
    {
      {type = "item", name = "tungsten-plate", amount = 50},
      {type = "item", name = "steel-plate", amount = 50},
      {type = "item", name = "electronic-circuit", amount = 30},
      {type = "item", name = "rare-earth-powder", amount = 10},
      {type = "fluid", name = "lava", amount = 100}
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
    energy_required = 10,
    results = {{type="item", name="foundry", amount=1}}
  },
}