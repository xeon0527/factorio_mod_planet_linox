data:extend {
  {
    type = "recipe",
    name = "linox-recipe_samarium-centrifugation",
    energy_required = 10,
    enabled = false,
    auto_recycle = false,
    category = "centrifuging",
    subgroup = "vulcanus-processes",
    ingredients =
    {
      {type = "item", name = "linox-item_rare-earth-ore", amount = 10},
    },
    results = {{type="item", name="linox-item_samarium", amount=1}},
    allow_decomposition = false,
    allow_productivity = true,
  },
}