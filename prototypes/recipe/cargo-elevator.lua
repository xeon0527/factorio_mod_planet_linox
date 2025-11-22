local recipe = {
  type = "recipe",
  name = "linox-recipe_cargo-elevator",
  energy_required = 10,
  enabled = false,
  ingredients =
  {
    {type = "item", name = "linox-item_tungsten-gear-wheel", amount = 25},
    {type = "item", name = "electronic-circuit", amount = 10},
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
  results = {{type="item", name="linox-item_cargo-elevator", amount=1}}
}

data:extend { recipe, }