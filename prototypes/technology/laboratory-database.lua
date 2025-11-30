local util_icon = require("scripts.util.icon")

data:extend {
  {
    type = "technology",
    name = "linox-technology_laboratory-database",
    icons = util_icon.technology_icon_script_research("__base__/graphics/technology/space-science-pack.png", 256),
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
      icons = util_icon.technology_icon_script_research("__rec-blue-plus__/graphics/blueprint-deployer-icon.png", 64),
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
      essential = true,
    },
    {
      type = "technology",
      name = "linox-technology_linox-supercomputer",
      icons = util_icon.technology_icon_script_research("__space-exploration-graphics__/graphics/technology/supercomputer-3.png", 128),
      prerequisites = {"linox-technology_laboratory-database"},
      research_trigger = {
        type = "scripted",
        trigger_description = {"technology-description.linox-technology-trigger-description_lorax-purchase"}
      },
      effects =
      {
        { type = "unlock-recipe", recipe = "linox-building_linox-supercomputer" },
        { type = "unlock-recipe", recipe = "linox-item_lava-data-card" },
      },
      essential = true,
    },


    {
      type = "technology",
      name = "linox-technology_linox-petrochemicals",
      icons = util_icon.technology_icon_linox_mod("__base__/graphics/technology/oil-processing.png", 256),
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
      ignore_tech_cost_multiplier = true,
    },
    {
      type = "technology",
      name = "linox-technology_samarium-data-card",
      icon = "__space-exploration-graphics__/graphics/technology/catalogue/energy-catalogue-1.png",
      icon_size = 128,
      prerequisites = {
        "linox-technology_tungsten-processing",
        "linox-technology_sintering-machine",
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
        { type = "unlock-recipe", recipe = "linox-item_samarium-data-card" },
      },
      ignore_tech_cost_multiplier = true,
      essential = true,
    },







      {
        type = "technology",
        name = "linox-technology_turbo-pump",
        icons = util_icon.technology_icon_linox_mod("__base__/graphics/technology/fluid-handling.png", 256),
        prerequisites = {
          "linox-technology_samarium-data-card",
        },
        unit =
        {
          count = 250,
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
          { type = "unlock-recipe", recipe = "linox-building_turbo-pump" },
          { type = "unlock-recipe", recipe = "linox-building_outlet" },
        },
        ignore_tech_cost_multiplier = true,
      },
      {
        type = "technology",
        name = "linox-technology_core-roboport",
        icon = "__space-exploration-graphics__/graphics/technology/supercharger.png",
        icon_size = 128,
        prerequisites = {
          "linox-technology_tungsten-processing",
          "construction-robotics",
          "linox-technology_rare-earth-refining",
          "linox-technology_linox-petrochemicals",
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
          { type = "unlock-recipe", recipe = "linox-building_core-roboport" },
        },
        ignore_tech_cost_multiplier = true,
      },



    {
      type = "technology",
      name = "linox-technology_enhanced-space-engineering",
      icons = util_icon.technology_icon_linox_mod("__base__/graphics/technology/rocket-silo.png", 256),
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
      ignore_tech_cost_multiplier = true,
    },
      {
        type = "technology",
        name = "linox-technology_advanced-rocket-silo",
        icons = {
          {
            icon = "__base__/graphics/technology/rocket-silo.png",
            icon_size = 256,
            tint = {1.0, 0.66, 0.66},
          },
          {
            icon = "__linox__/graphics/icons/planet-linox-64.png",
            icon_size = 64,
            scale = 0.5,
            shift = {46, 46},
            floating = true
          }
        },
        essential = true,
        prerequisites = {
          "linox-technology_dysprosium-data-card",
          "linox-technology_samarium-data-card",
        },
        unit =
        {
          count = 750,
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
          { type = "unlock-recipe", recipe = "linox-building_advanced-rocket-silo" },
        },
        ignore_tech_cost_multiplier = true,
      },
      {
        type = "technology",
        name = "linox-technology_safety-of-entering-orbit",
        icons = util_icon.technology_icon_linox_mod("__space-age__/graphics/technology/rocket-part-productivity.png", 256),
        prerequisites = {
          "linox-technology_enhanced-space-engineering",
          "linox-technology_rare-earth-refining",
        },
        unit =
        {
          count_formula = "L*250",
          ingredients =
          {
            {"linox-item_lava-data-card", 1},
            {"linox-item_rare-earth-data-card", 1},
          },
          time = 60
        },
        max_level = 14,
        upgrade = true,
        ignore_tech_cost_multiplier = true,
      },

      {
        type = "technology",
        name = "linox-technology_sintering-machine",
        icon = "__linox__/graphics/technology/sintering-machine.png",
        icon_size = 640,
        prerequisites = {
          "linox-technology_tungsten-processing",
          "linox-technology_samarium-centrifugation",
        },
        unit =
        {
          count = 150,
          ingredients =
          {
            {"linox-item_lava-data-card", 2},
            {"linox-item_rare-earth-data-card", 2},
          },
          time = 60
        },
        effects =
        {
          { type = "unlock-recipe", recipe = "linox-building_sintering-machine" },
          { type = "unlock-recipe", recipe = "samarium" },
        },
        ignore_tech_cost_multiplier = true,
      },

      {
        type = "technology",
        name = "linox-technology_tungsten-sintering-processing",
        icons = {
          {
            icon = "__linox__/graphics/technology/sintering-machine.png",
            icon_size = 640,
            tint = {0.5, 0.5, 0.5, 0.5},
          },
          {
            icon = "__space-age__/graphics/icons/tungsten-plate.png",
            icon_size = 64,
            shift = {0, -25},
            scale = 0.75,
            draw_background = true,
            floating = true,
          },
          {
            icon = "__base__/graphics/icons/iron-gear-wheel.png",
            icon_size = 64,
            tint = {1.0, 0.66, 1.0},
            shift = {-32, 25},
            scale = 0.75,
            draw_background = true,
            floating = true,
          },
          {
            icon = "__base__/graphics/icons/iron-stick.png",
            icon_size = 64,
            tint = {1.0, 0.66, 1.0},
            shift = {32, 25},
            scale = 0.75,
            draw_background = true,
            floating = true,
          },
        },
        prerequisites = {
          "linox-technology_sintering-machine",
        },
        unit =
        {
          count = 200,
          ingredients =
          {
            {"linox-item_lava-data-card", 2},
            {"linox-item_rare-earth-data-card", 2},
          },
          time = 60
        },
        effects =
        {
          { type = "unlock-recipe", recipe = "linox-recipe_tungsten-sintering-plate" },
          { type = "unlock-recipe", recipe = "linox-recipe_tungsten-sintering-gear-wheel" },
          { type = "unlock-recipe", recipe = "linox-recipe_tungsten-sintering-stick" },
        },
        ignore_tech_cost_multiplier = true,
      },

      {
        type = "technology",
        name = "linox-technology_froth-flotation-processing",
        icon = "__linox__/graphics/technology/chemical-tank.png",
        icon_size = 640,
        prerequisites = {
          "linox-technology_rare-earth-refining",
          "linox-technology_linox-petrochemicals",
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
          { type = "unlock-recipe", recipe = "linox-building_chemical-tank" },
          { type = "unlock-recipe", recipe = "linox-recipe_froth-flotation-processing" },
        },
        ignore_tech_cost_multiplier = true,
      },

      {
        type = "technology",
        name = "linox-technology_dysprosium-extraction",
        icons = {
          {
            icon = "__linox__/graphics/technology/white-powder.png",
            icon_size = 256,
            tint = { 75, 75, 0 }
          },
        },
        prerequisites = {
          "linox-technology_froth-flotation-processing",
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
          { type = "unlock-recipe", recipe = "dysprosium-powder" },
        },
        ignore_tech_cost_multiplier = true,
      },

      {
        type = "technology",
        name = "linox-technology_dysprosium-data-card",
        icon = "__space-exploration-graphics__/graphics/technology/catalogue/material-catalogue-1.png",
        icon_size = 128,
        prerequisites = {
          "linox-technology_dysprosium-extraction",
        },
        unit =
        {
          count = 375,
          ingredients =
          {
            {"linox-item_lava-data-card", 1},
            {"linox-item_rare-earth-data-card", 1},
          },
          time = 60
        },
        effects =
        {
          { type = "unlock-recipe", recipe = "linox-item_dysprosium-data-card" },
        },
        ignore_tech_cost_multiplier = true,
      },

      {
        type = "technology",
        name = "linox-technology_dysprosium-exoskeleton-equipment",
        icons = util_icon.technology_icon_constant_equipment("__base__/graphics/technology/exoskeleton-equipment.png", 256, {175,175,0}),
        prerequisites = {
          "linox-technology_dysprosium-data-card",
          "exoskeleton-equipment",
        },
        unit =
        {
          count = 500,
          ingredients =
          {
            {"linox-item_lava-data-card", 1},
            {"linox-item_rare-earth-data-card", 1},
            {"linox-item_dysprosium-data-card", 1},
          },
          time = 60
        },
        effects =
        {
          { type = "unlock-recipe", recipe = "dysprosium-exoskeleton-equipment" },
        },
        ignore_tech_cost_multiplier = true,
      },
};