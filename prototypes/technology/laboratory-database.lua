local util_icon = require("scripts.util.icon")

data:extend {
  {
    type = "technology",
    name = "linox-technology_laboratory-database",
    icon = "__base__/graphics/technology/space-science-pack.png",
    icon_size = 256,
    essential = true,
    prerequisites = {"linox-technology_exploring-linox-landing-site"},
    research_trigger = {
      type = "scripted",
      trigger_description = {"technology-description.linox-technology-trigger-description_lorax-talking"}
    },
  },
    {
      type = "technology",
      name = "linox-technology_recursive-blueprint",
      icon = "__rec-blue-plus__/graphics/blueprint-deployer-icon.png",
      icon_size = 64,
      prerequisites = {"linox-technology_laboratory-database"},
      research_trigger = {
        type = "scripted",
        trigger_description = {"technology-description.linox-technology-trigger-description_lorax-purchase"}
      },
      effects =
      {
        { type = "unlock-recipe", recipe = "blueprint-deployer" },
        { type = "unlock-recipe", recipe = "blueprint-deployer2" },
        { type = "unlock-recipe", recipe = "recursive-blueprints-scanner" },
      },
    },
    {
      type = "technology",
      name = "linox-technology_linox-supercomputer",
      icon = "__space-exploration-graphics__/graphics/technology/supercomputer-3.png",
      icon_size = 128,
      prerequisites = {"linox-technology_laboratory-database"},
      research_trigger = {
        type = "scripted",
        trigger_description = {"technology-description.linox-technology-trigger-description_lorax-purchase"}
      },
      effects =
      {
        { type = "unlock-recipe", recipe = "linox-recipe_linox-supercomputer" },
        { type = "unlock-recipe", recipe = "linox-recipe_lava-data-card" },
      },
    },


    {
      type = "technology",
      name = "linox-technology_linox-petrochemicals",
      icon = "__base__/graphics/technology/oil-processing.png",
      icon_size = 256,
      prerequisites = {"linox-technology_ultra-deep-drilling"},
      unit =
      {
        count = 250,
        ingredients =
        {
          {"linox-item_lava-data-card", 1},
        },
        time = 60
      },
      effects =
      {
        { type = "unlock-recipe", recipe = "linox-recipe_rapid-distillation" },
        { type = "unlock-recipe", recipe = "linox-recipe_lava-based-rocket-fuel" },
      },
    },
    {
      type = "technology",
      name = "linox-technology_samarium-data-card",
      icon = "__space-exploration-graphics__/graphics/technology/catalogue/energy-catalogue-1.png",
      icon_size = 256,
      prerequisites = {
        "linox-technology_tungsten-processing",
        "linox-technology_samarium-centrifugation",
        "linox-technology_linox-petrochemicals",
      },
      unit =
      {
        count = 250,
        ingredients =
        {
          {"linox-item_lava-data-card", 1},
          {"linox-item_rare-earth-data-card", 1},
        },
        time = 60
      },
      effects =
      {
        { type = "unlock-recipe", recipe = "linox-recipe_samarium-data-card" },
      },
    },







      {
        type = "technology",
        name = "linox-technology_turbo-pump",
        icon = "__base__/graphics/technology/fluid-handling.png",
        icon_size = 256,
        prerequisites = {
          "linox-technology_tungsten-processing",
          "linox-technology_samarium-centrifugation",
          "linox-technology_linox-petrochemicals",
        },
        unit =
        {
          count = 250,
          ingredients =
          {
            {"linox-item_lava-data-card", 1},
            {"linox-item_rare-earth-data-card", 1},
          },
          time = 60
        },
        effects =
        {
          { type = "unlock-recipe", recipe = "linox-recipe_turbo-pump" },
        },
      },
      {
        type = "technology",
        name = "linox-technology_core-roboport",
        icon = "__space-exploration-graphics__/graphics/technology/supercharger.png",
        icon_size = 128,
        prerequisites = {
          "linox-technology_tungsten-processing",
          "construction-robotics",
        },
        unit =
        {
          count = 500,
          ingredients =
          {
            {"linox-item_lava-data-card", 1},
            {"linox-item_rare-earth-data-card", 1},
          },
          time = 60
        },
        effects =
        {
          { type = "unlock-recipe", recipe = "linox-recipe_core-roboport" },
        },
      },



    {
      type = "technology",
      name = "linox-technology_enhanced-space-engineering",
      icon = "__base__/graphics/technology/rocket-silo.png",
      icon_size = 256,
      prerequisites = {"linox-technology_laboratory-database"},
      unit =
      {
        count = 500,
        ingredients =
        {
          {"linox-item_lava-data-card", 1},
        },
        time = 60
      },
    },
      {
        type = "technology",
        name = "linox-technology_advanced-rocket-silo",
        icon = "__base__/graphics/technology/rocket-silo.png",
        icon_size = 256,
        essential = true,
        prerequisites = {
          "linox-technology_enhanced-space-engineering",
          "linox-technology_tungsten-processing",
          "linox-technology_samarium-centrifugation",
          "linox-technology_rocket-silo-foundation",
          "linox-technology_linox-petrochemicals",
          "linox-technology_samarium-data-card",
        },
        unit =
        {
          count = 1500,
          ingredients =
          {
            {"linox-item_lava-data-card", 1},
            {"linox-item_rare-earth-data-card", 1},
            {"linox-item_samarium-data-card", 1},
          },
          time = 60
        },
        effects =
        {
          { type = "unlock-recipe", recipe = "linox-recipe_advanced-rocket-silo" },
        },
      },
      {
        type = "technology",
        name = "linox-technology_safety-of-entering-orbit",
        icons = util_icon.technology_icon_constant_damage_size("__space-age__/graphics/technology/rocket-part-productivity.png", 256),
        prerequisites = {
          "linox-technology_enhanced-space-engineering",
        },
        unit =
        {
          count_formula = "2^(L-1)*500",
          ingredients =
          {
            {"linox-item_lava-data-card", 1},
            {"linox-item_rare-earth-data-card", 1},
          },
          time = 60
        },
        max_level = 14,
        upgrade = true,
      },
};