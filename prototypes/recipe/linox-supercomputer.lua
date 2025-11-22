local tint = {1.0, 0.5, 1.0};

local recipe = {
  type = "recipe",
  name = "linox-recipe_linox-supercomputer",
  energy_required = 3,
  enabled = false,
  ingredients =
  {
    {type = "item", name = "linox-item_tungsten-gear-wheel", amount = 10},
    {type = "item", name = "linox-item_tungsten-stick", amount = 10},
    {type = "item", name = "electronic-circuit", amount = 25},
    {type = "item", name = "iron-plate", amount = 10},
    {type = "item", name = "copper-plate", amount = 10},
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
  results = {{type="item", name="linox-item_linox-supercomputer", amount=1}},
}

data:extend { recipe, }