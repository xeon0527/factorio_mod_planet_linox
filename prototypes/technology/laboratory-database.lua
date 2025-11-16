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
      name = "linox-technology_linox-petrochemicals",
      icon = "__base__/graphics/technology/advanced-oil-processing.png",
      icon_size = 256,
      prerequisites = {"linox-technology_laboratory-database"},
      unit =
      {
        count = 500,
        ingredients =
        {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"chemical-science-pack", 1},
          {"military-science-pack", 1},
          {"production-science-pack", 1},
          {"utility-science-pack", 1},
          {"space-science-pack", 1},
          {"metallurgic-science-pack", 1},
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
      name = "linox-technology_recursive-blueprint",
      icon = "__space-age__/graphics/technology/quantum-processor.png",
      icon_size = 256,
      prerequisites = {"linox-technology_laboratory-database"},
      unit =
      {
        count = 500,
        ingredients =
        {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"chemical-science-pack", 1},
          {"military-science-pack", 1},
          {"production-science-pack", 1},
          {"utility-science-pack", 1},
          {"space-science-pack", 1},
          {"metallurgic-science-pack", 1},
        },
        time = 60
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
      name = "linox-technology_tungsten-processing",
      icon = "__space-age__/graphics/technology/tungsten-steel.png",
      icon_size = 256,
      prerequisites = {"linox-technology_laboratory-database"},
      unit =
      {
        count = 500,
        ingredients =
        {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"chemical-science-pack", 1},
          {"military-science-pack", 1},
          {"production-science-pack", 1},
          {"utility-science-pack", 1},
          {"space-science-pack", 1},
          {"metallurgic-science-pack", 1},
        },
        time = 60
      },
      effects =
      {
        { type = "unlock-recipe", recipe = "linox-recipe_tungsten-gear-wheel" },
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
        },
        unit =
        {
          count = 500,
          ingredients =
          {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1},
            {"military-science-pack", 1},
            {"production-science-pack", 1},
            {"utility-science-pack", 1},
            {"space-science-pack", 1},
            {"metallurgic-science-pack", 1},
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
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1},
            {"military-science-pack", 1},
            {"production-science-pack", 1},
            {"utility-science-pack", 1},
            {"space-science-pack", 1},
            {"metallurgic-science-pack", 1},
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
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"chemical-science-pack", 1},
          {"military-science-pack", 1},
          {"production-science-pack", 1},
          {"utility-science-pack", 1},
          {"space-science-pack", 1},
          {"metallurgic-science-pack", 1},
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
        },
        unit =
        {
          count = 2500,
          ingredients =
          {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1},
            {"military-science-pack", 1},
            {"production-science-pack", 1},
            {"utility-science-pack", 1},
            {"space-science-pack", 1},
            {"metallurgic-science-pack", 1},
          },
          time = 60
        },
        effects =
        {
          { type = "unlock-recipe", recipe = "linox-recipe_advanced-rocket-silo" },
        },
      },
};