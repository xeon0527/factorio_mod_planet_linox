local tint = {1.0, 0.5, 1.0};

local recipe = {
  type = "recipe",
  name = "linox-recipe_lava-data-card",
  category = "crafting-with-fluid",
  energy_required = 5,
  enabled = false,
  ingredients =
  {
    {type = "item", name = "linox-item_tungsten-gear-wheel", amount = 5},
    {type = "item", name = "linox-item_tungsten-stick", amount = 10},
    {type = "fluid", name = "lava", amount = 50},
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
  results = {{type="item", name="linox-item_lava-data-card", amount=1}},
}

data:extend { recipe, }