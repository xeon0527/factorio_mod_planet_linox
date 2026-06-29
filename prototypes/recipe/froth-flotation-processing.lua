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
    categories = {"linox-recipe-category_chemical-tank"},
    ingredients =
    {
      {type = "item", name = "rare-earth-powder", amount = 2},
      {type = "item", name = "calcite", amount = 1},
      {type = "fluid", name = "water", amount = 100},
    },
    results = {
      {type = "item", name = "hydrophilic-rare-earth-powder", shared_probability = { min = 0, max = 0.5 }, amount_min = 1, amount_max = 2},
      {type = "item", name = "hydrophobic-rare-earth-powder", shared_probability = { min = 0.5, max = 1 }, amount_min = 1, amount_max = 2},
    },
    allow_productivity = true,
    maximum_productivity = 5.0,

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
  },
}