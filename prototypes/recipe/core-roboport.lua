local recipe = {
  type = "recipe",
  name = "linox-recipe_core-roboport",
  energy_required = 10,
  enabled = false,
  ingredients =
  {
    {type = "item", name = "steel-plate", amount = 25},
    {type = "item", name = "linox-item_tungsten-gear-wheel", amount = 25},
    {type = "item", name = "advanced-circuit", amount = 25},
    {type = "item", name = "processing-unit", amount = 10},
    {type = "item", name = "tungsten-carbide", amount = 10},
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
  results = {{type="item", name="linox-item_core-roboport", amount=1}},
  icon = "__space-exploration-graphics__/graphics/icons/supercharger.png",
  icon_size = 64,
}

data:extend { recipe, }