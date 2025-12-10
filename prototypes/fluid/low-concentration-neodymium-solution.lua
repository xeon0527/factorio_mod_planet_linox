local tint = {100, 100, 100}

data:extend {
  {
    type = "fluid",
    name = "low-concentration-neodymium-solution",
    icons = {
      {
        icon = "__space-age__/graphics/icons/fluid/lithium-brine.png",
        icon_size = 64,
        tint = tint,
      }
    },
    subgroup = "fluid",
    --order = "b[new-fluid]-e[aquilo]-a[ammoniacal-solution]",
    default_temperature = 15,

    base_color = tint,
    flow_color = tint,
  },

  {
    type = "recipe",
    name = "low-concentration-neodymium-solution",
    icons = {
      {
        icon = "__space-age__/graphics/icons/fluid/lithium-brine.png",
        icon_size = 64,
        tint = tint,
      }
    },
    category = "chemistry-or-cryogenics",
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
      {type = "item", name = "hydrophobic-rare-earth-powder", amount = 1},
      {type = "fluid", name = "sulfuric-acid", amount = 100},
    },
    energy_required = 1,
    results =
    {
      {type = "fluid", name = "low-concentration-neodymium-solution", amount = 25},
      {type = "fluid", name = "waste-water", amount = 75},
    },

    main_product = "low-concentration-neodymium-solution",

    allow_productivity = true,
  },
}