data:extend {
  {
    type = "recipe",
    name = "linox-recipe_rare-earth-refining",
    icon = "__space-exploration-graphics__/graphics/icons/naquium-ore-crushed.png",
    energy_required = 30,
    enabled = false,
    auto_recycle = false,
    category = "chemistry-or-cryogenics",
    subgroup = "vulcanus-processes",
    ingredients =
    {
      {type="item", name="stone", amount=100, ignored_by_stats = 99},
      {type = "fluid", name = "sulfuric-acid", amount = 25},
    },
    results = {
      {type="item", name="linox-item_rare-earth-ore", amount = 1, ignored_by_productivity = 1},
      {type="item", name="stone", amount=99, ignored_by_stats = 99, ignored_by_productivity = 99},
    },
    emissions_multiplier = 100,
    allow_decomposition = false,
    allow_productivity = true,
    allow_quality = false,
  },
}