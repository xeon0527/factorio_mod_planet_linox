local tint = {255, 175, 225}

data:extend {
  {
    type = "fluid",
    name = "low-concentration-erbium-solution",
    icons = {
      {
        icon = "__space-age__/graphics/icons/fluid/lithium-brine.png",
        icon_size = 64,
        tint = tint,
      }
    },
    subgroup = "fluid",
    order = "linox-erbium-a",
    default_temperature = 15,

    base_color = tint,
    flow_color = tint,
  },

  {
    type = "recipe",
    name = "low-concentration-erbium-solution",
    icons = {
      {
        icon = "__space-age__/graphics/icons/fluid/lithium-brine.png",
        icon_size = 64,
        tint = tint,
      }
    },
    category = "chemistry-or-cryogenics",
    subgroup = "fluid-recipes",
    order = "linox-erbium-a",
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
      {type = "item", name = "hydrophilic-rare-earth-powder", amount = 1},
      {type = "fluid", name = "sulfuric-acid", amount = 100},
    },
    energy_required = 2,
    results =
    {
      {type = "fluid", name = "low-concentration-erbium-solution", amount = 25},
      {type = "fluid", name = "waste-water", amount = 75},
    },

    main_product = "low-concentration-erbium-solution",

    allow_productivity = true,
  },
}