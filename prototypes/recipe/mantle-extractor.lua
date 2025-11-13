local recipe = {
  type = "recipe",
  name = "linox-recipe_mantle-extractor",
  energy_required = 60,
  enabled = false,
  category = "metallurgy",
  ingredients =
  {
    {type = "item", name = "tungsten-plate", amount = 250},
    {type = "item", name = "pumpjack", amount = 10},
    {type = "item", name = "steel-plate", amount = 100},
    {type = "item", name = "concrete", amount = 100},
    {type = "item", name = "pipe", amount = 500},
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
  results = {{type="item", name="linox-item_mantle-extractor", amount=1}}
}

data:extend { recipe, }