local recipe = {
  type = "recipe",
  name = "linox-recipe_cargo-elevator",
  energy_required = 10,
  enabled = false,
  ingredients =
  {
    {type = "item", name = "linox-item_tungsten-gear-wheel", amount = 50},
    {type = "item", name = "tungsten-plate", amount = 10},
    {type = "item", name = "electric-engine-unit", amount = 5},
    {type = "item", name = "processing-unit", amount = 5},
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
      min = 500,
      max = 500
    }
  },
  results = {{type="item", name="linox-item_cargo-elevator", amount=1}}
}

data:extend { recipe, }