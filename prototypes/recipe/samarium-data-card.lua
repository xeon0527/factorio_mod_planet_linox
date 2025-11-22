local recipe = {
  type = "recipe",
  name = "linox-recipe_samarium-data-card",
  energy_required = 5,
  enabled = false,
  ingredients =
  {
    {type = "item", name = "linox-item_samarium", amount = 2},
    {type = "item", name = "advanced-circuit", amount = 5},
    {type = "item", name = "processing-unit", amount = 5},
    {type = "item", name = "tungsten-carbide", amount = 2},
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
  results = {{type="item", name="linox-item_samarium-data-card", amount=1}},
}

data:extend { recipe, }