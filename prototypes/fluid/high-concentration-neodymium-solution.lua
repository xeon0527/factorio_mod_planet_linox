local tint = {110, 110, 110}

data:extend {
  {
    type = "fluid",
    name = "high-concentration-neodymium-solution",
    icons = {
      {
        icon = "__space-age__/graphics/icons/fluid/lithium-brine.png",
        icon_size = 64,
        tint = tint,
      },
    },
    subgroup = "fluid",
    order = "linox-neodymium-b",
    default_temperature = 15,

    base_color = tint,
    flow_color = tint,
  },

  {
    type = "recipe",
    name = "high-concentration-neodymium-solution",
    icons = {
      {
        icon = "__space-age__/graphics/icons/fluid/lithium-brine.png",
        icon_size = 64,
        tint = tint,
      }
    },
    category = "chemistry-or-cryogenics",
    subgroup = "fluid-recipes",
    order = "linox-neodymium-b",
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
      {type = "fluid", name = "low-concentration-neodymium-solution", amount = 100},
      {type = "fluid", name = "petroleum-gas", amount = 200},
    },
    energy_required = 2,
    results =
    {
      {type = "fluid", name = "high-concentration-neodymium-solution", amount = 25},
      {type = "fluid", name = "waste-water", amount = 275, ignored_by_productivity = 275},
    },

    main_product = "high-concentration-neodymium-solution",

    allow_productivity = true,
  },
}