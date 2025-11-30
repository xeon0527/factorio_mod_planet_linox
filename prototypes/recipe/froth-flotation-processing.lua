data:extend {
  {
    type = "recipe",
    name = "linox-recipe_froth-flotation-processing",
    subgroup = "vulcanus-processes",
    icons = {
      {
        icon = "__core__/graphics/icons/controller/ps/color/circle.png",
        icon_size = 40,
        scale = 1.6,
      },
      {
        icon = "__linox__/graphics/icons/rare-earth-powder.png",
        icon_size = 64,
        scale = 0.85,
        floating = true,
      }
    },
    
    energy_required = 2,
    enabled = false,
    auto_recycle = false,
    category = "linox-recipe-category_chemical-tank",
    ingredients =
    {
      {type = "item", name = "rare-earth-powder", amount = 2},
      {type = "item", name = "calcite", amount = 1},
      {type = "fluid", name = "water", amount = 100},
    },
    results = {
      {type = "item", name = "hydrophilic-rare-earth-powder", probability = 0.25, amount_min = 0, amount_max = 2},
      {type = "item", name = "hydrophobic-rare-earth-powder", probability = 0.25,amount_min = 0, amount_max = 2},
      {type = "item", name = "stone", probability = 0.5,amount = 2},
    },
    allow_productivity = true,
  },
}