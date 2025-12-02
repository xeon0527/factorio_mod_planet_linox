local util_icon = require("scripts.util.icon")

data:extend {
  {
    type = "technology",
    name = "linox-technology_chemical-particle-filtering",
    icon = "__linox__/graphics/technology/chemical-filter.png",
    icon_size = 640,
    prerequisites = {
      "linox-technology_build-data-catalog",
    },
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"linox-item_lava-data-card", 1},
        {"linox-item_rare-earth-data-card", 1},
        {"linox-item_samarium-data-card", 1},
        {"linox-item_dysprosium-data-card", 1},
      },
      time = 60
    },
    effects =
    {
      { type = "unlock-recipe", recipe = "linox-building_chemical-filter" },
    },
    ignore_tech_cost_multiplier = true,
  },

  {
    type = "technology",
    name = "linox-technology_waste-water-treatment",
    icons = util_icon.technology_icon_linox_mod("__space-age__/graphics/technology/fish-breeding.png", 256),
    prerequisites = {
      "linox-technology_build-data-catalog",
      "linox-technology_turbo-pump",
    },
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"linox-item_lava-data-card", 1},
        {"linox-item_rare-earth-data-card", 1},
        {"linox-item_samarium-data-card", 1},
        {"linox-item_dysprosium-data-card", 1},
      },
      time = 60
    },
    effects =
    {
      { type = "unlock-recipe", recipe = "linox-building_outlet" },
    },
    ignore_tech_cost_multiplier = true,
  },



  {
    type = "technology",
    name = "linox-technology_neodymium-extraction",
    icon = "__linox__/graphics/technology/neodymium-extraction.png",
    icon_size = 500,
    prerequisites = {
      "linox-technology_chemical-particle-filtering",
      "linox-technology_waste-water-treatment"
    },
    unit =
    {
      count = 2000,
      ingredients =
      {
        {"linox-item_lava-data-card", 1},
        {"linox-item_rare-earth-data-card", 1},
        {"linox-item_samarium-data-card", 1},
        {"linox-item_dysprosium-data-card", 1},
      },
      time = 60
    },
    effects =
    {
      { type = "unlock-recipe", recipe = "low-concentration-neodymium-solution" },
      { type = "unlock-recipe", recipe = "high-concentration-neodymium-solution" },
      { type = "unlock-recipe", recipe = "neodymium-solution" },
      { type = "unlock-recipe", recipe = "neodymium-oxide" },
      { type = "unlock-recipe", recipe = "neodymium-powder" },
    },
    ignore_tech_cost_multiplier = true,
  },

  {
    type = "technology",
    name = "linox-technology_neodymium-data-card",
    icons = {
      {
        icon = "__space-exploration-graphics__/graphics/technology/catalogue/base-catalogue-2.png",
        icon_size = 128,
      },
      {
        icon = "__space-exploration-graphics__/graphics/technology/catalogue/mask-catalogue-2.png",
        icon_size = 128,
      },
    },
    prerequisites = {
      "linox-technology_neodymium-extraction",
    },
    unit =
    {
      count = 2000,
      ingredients =
      {
        {"linox-item_lava-data-card", 1},
        {"linox-item_rare-earth-data-card", 1},
        {"linox-item_samarium-data-card", 1},
        {"linox-item_dysprosium-data-card", 1},
      },
      time = 60
    },
    effects =
    {
      { type = "unlock-recipe", recipe = "linox-item_neodymium-data-card" },
    },
    ignore_tech_cost_multiplier = true,
    essential = true,
  },

  {
    type = "technology",
    name = "linox-technology_neodymium-permanent-magnet",
    icons = {
      {
        icon = "__linox__/graphics/technology/white-cube.png",
        icon_size = 256,
      },
    },
    prerequisites = {
      "linox-technology_neodymium-data-card",
    },
    unit =
    {
      count = 1500,
      ingredients =
      {
        {"linox-item_lava-data-card", 1},
        {"linox-item_rare-earth-data-card", 1},
        {"linox-item_samarium-data-card", 1},
        {"linox-item_dysprosium-data-card", 1},
        {"linox-item_neodymium-data-card", 1},
      },
      time = 60
    },
    effects =
    {
      { type = "unlock-recipe", recipe = "neodymium-permanent-magnet" },
    },
    ignore_tech_cost_multiplier = true,
    essential = true,
  },

  {
    type = "technology",
    name = "linox-technology_neodymium-permanent-magnet-generator",
    icons = {
      {
        icon = "__space-exploration-graphics__/graphics/technology/big-turbine.png",
        icon_size = 128,
      },
    },
    prerequisites = {
      "linox-technology_neodymium-permanent-magnet",
    },
    unit =
    {
      count = 1500,
      ingredients =
      {
        {"linox-item_lava-data-card", 1},
        {"linox-item_rare-earth-data-card", 1},
        {"linox-item_samarium-data-card", 1},
        {"linox-item_dysprosium-data-card", 1},
        {"linox-item_neodymium-data-card", 1},
      },
      time = 60
    },
    effects =
    {
      { type = "unlock-recipe", recipe = "linox-building_neodymium-permanent-magnet-generator" },
      { type = "unlock-recipe", recipe = "linox-building_huge-heat-exchanger" },
    },
    ignore_tech_cost_multiplier = true,
    essential = true,
  },

  -- {
  --   type = "technology",
  --   name = "linox-technology_erbium-extraction",
  --   icon = "__linox__/graphics/technology/erbium-extraction.png",
  --   icon_size = 500,
  --   prerequisites = {
  --     "linox-technology_chemical-particle-filtering",
  --     "linox-technology_waste-water-treatment"
  --   },
  --   unit =
  --   {
  --     count = 2000,
  --     ingredients =
  --     {
  --       {"linox-item_lava-data-card", 1},
  --       {"linox-item_rare-earth-data-card", 1},
  --       {"linox-item_samarium-data-card", 1},
  --       {"linox-item_dysprosium-data-card", 1},
  --     },
  --     time = 60
  --   },
  --   effects =
  --   {
  --     { type = "unlock-recipe", recipe = "low-concentration-erbium-solution" },
  --     { type = "unlock-recipe", recipe = "high-concentration-erbium-solution" },
  --     { type = "unlock-recipe", recipe = "erbium-solution" },
  --     { type = "unlock-recipe", recipe = "erbium-oxide" },
  --     { type = "unlock-recipe", recipe = "erbium-powder" },
  --   },
  --   ignore_tech_cost_multiplier = true,
  -- },

  -- {
  --   type = "technology",
  --   name = "linox-technology_erbium-data-card",
  --   icon = "__space-exploration-graphics__/graphics/technology/catalogue/energy-catalogue-2.png",
  --   icon_size = 128,
  --   prerequisites = {
  --     "linox-technology_erbium-extraction",
  --   },
  --   unit =
  --   {
  --     count = 2000,
  --     ingredients =
  --     {
  --       {"linox-item_lava-data-card", 1},
  --       {"linox-item_rare-earth-data-card", 1},
  --       {"linox-item_samarium-data-card", 1},
  --       {"linox-item_dysprosium-data-card", 1},
  --     },
  --     time = 60
  --   },
  --   effects =
  --   {
  --     { type = "unlock-recipe", recipe = "linox-item_erbium-data-card" },
  --   },
  --   ignore_tech_cost_multiplier = true,
  --   essential = true,
  -- },
}