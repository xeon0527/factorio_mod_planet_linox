local recipe = {
  type = "recipe",
  name = "linox-recipe_turbo-pump",
  energy_required = 5,
  enabled = false,
  ingredients =
  {
    {type = "item", name = "pump", amount = 1},
    {type = "item", name = "pipe", amount = 5},
    {type = "item", name = "tungsten-carbide", amount = 2},
    {type = "item", name = "linox-item_tungsten-gear-wheel", amount = 5},
    {type = "item", name = "linox-item_samarium", amount = 5},
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
  results = {{type="item", name="linox-item_turbo-pump", amount=1}}
}

data:extend { recipe, }