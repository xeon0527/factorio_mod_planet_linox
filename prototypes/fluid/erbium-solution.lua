local tint = {255, 50, 150}

data:extend {
  {
    type = "fluid",
    name = "erbium-solution",
    icon = "__linox__/graphics/icons/erbium-solution.png",
    icon_size = 64,
    subgroup = "fluid",
    order = "linox-erbium-c",
    default_temperature = 15,

    base_color = tint,
    flow_color = tint,
  },

  {
    type = "recipe",
    name = "erbium-solution",
    icon = "__linox__/graphics/icons/erbium-solution.png",
    icon_size = 64,
    category = "linox-recipe-category_chemical-tank",
    subgroup = "fluid-recipes",
    order = "linox-erbium-c",
    auto_recycle = false,
    enabled = false,
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
      {type = "fluid", name = "high-concentration-erbium-solution", amount = 100},
      {type = "fluid", name = "steam", amount = 3000},
    },
    energy_required = 3,
    results =
    {
      {type = "fluid", name = "erbium-solution", amount = 25},
      {type = "fluid", name = "waste-water", amount = 375},
    },

    main_product = "erbium-solution",

    allow_productivity = true,
  },
}