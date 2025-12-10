local tint = {225, 225, 225}

data:extend {
  {
    type = "fluid",
    name = "neodymium-solution",
    icon = "__linox__/graphics/icons/neodymium-solution.png",
    icon_size = 64,
    subgroup = "fluid",
    --order = "b[new-fluid]-e[aquilo]-a[ammoniacal-solution]",
    default_temperature = 15,

    base_color = tint,
    flow_color = tint,
  },

  {
    type = "recipe",
    name = "neodymium-solution",
    icon = "__linox__/graphics/icons/neodymium-solution.png",
    icon_size = 64,
    category = "linox-recipe-category_chemical-tank",
    subgroup = "fluid-recipes",
    order = "d[other-chemistry]",
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
      {type = "fluid", name = "high-concentration-neodymium-solution", amount = 100},
      {type = "fluid", name = "water", amount = 900},
    },
    energy_required = 3,
    results =
    {
      {type = "fluid", name = "neodymium-solution", amount = 25},
      {type = "fluid", name = "waste-water", amount = 975},
    },

    main_product = "neodymium-solution",

    allow_productivity = true,
  },
}