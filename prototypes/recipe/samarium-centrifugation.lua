data:extend {
  {
    type = "recipe",
    name = "linox-recipe_samarium-centrifugation",
    energy_required = 3,
    enabled = false,
    auto_recycle = false,
    category = "centrifuging",
    ingredients =
    {
      {type = "item", name = "rare-earth-powder", amount = 5},
    },
    results = {{type="item", name="samarium-powder", amount=2}},
    --allow_decomposition = false,
    allow_productivity = true,
  },
}