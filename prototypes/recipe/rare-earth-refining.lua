data:extend {
  {
    type = "recipe",
    name = "linox-recipe_rare-earth-refining",
    icon = "__linox__/graphics/icons/rare-earth-powder.png",
    energy_required = 4,
    enabled = false,
    auto_recycle = false,
    category = "chemistry-or-cryogenics",
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
      {type = "fluid", name = "sulfuric-acid", amount = 200},
    },
    results = {
      {type="item", name="rare-earth-powder", amount = 1},
    },
    --allow_decomposition = false,
    allow_productivity = true,
    --allow_quality = false,
  },
}