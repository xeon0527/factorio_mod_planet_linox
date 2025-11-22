local recipe = {
  type = "recipe",
  name = "linox-recipe_rare-earth-data-card",
  energy_required = 5,
  enabled = false,
  ingredients =
  {
    {type = "item", name = "linox-item_rare-earth-ore", amount = 2},
    {type = "item", name = "calcite", amount = 2},
    {type = "item", name = "tungsten-ore", amount = 2},
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
  results = {{type="item", name="linox-item_rare-earth-data-card", amount=1}},
}

data:extend { recipe, }