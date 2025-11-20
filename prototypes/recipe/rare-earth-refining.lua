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
    ingredients =
    {
      {type="item", name="stone", amount=100},
      {type = "fluid", name = "sulfuric-acid", amount = 25},
    },
    results = {
      {type="item", name="linox-item_rare-earth-ore", amount = 1},
    },
    allow_decomposition = false,
    allow_productivity = true,
    allow_quality = false,
  },
}