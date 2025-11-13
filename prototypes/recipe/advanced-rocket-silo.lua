data:extend {
  {
    type = "recipe",
    name = "linox-recipe_advanced-rocket-silo",
    enabled = false,
    category = "metallurgy",
    ingredients =
    {
      {type = "item", name = "rocket-silo", amount = 1},
      {type = "item", name = "refined-concrete", amount = 1000},
      {type = "item", name = "linox-item_tungsten-gear-wheel", amount = 1000},
      {type = "item", name = "tungsten-carbide", amount = 500},
      {type = "item", name = "linox-item_samarium", amount = 100}
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
    energy_required = 240,
    results = {{type="item", name="linox-item_advanced-rocket-silo", amount=1}},
    requester_paste_multiplier = 1
  },
}