local recipe = {
  type = "recipe",
  name = "linox-recipe_low-temp-separation-of-calcium",
  energy_required = 3,
  enabled = false,
  category = "chemistry",
  ingredients =
  {
    {type = "fluid", name = "lava", amount = 250},
    {type = "item", name = "stone", amount = 1},
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
  results = {{type="item", name="calcite", amount=1}},
allow_productivity = true,
}

data:extend { recipe, }