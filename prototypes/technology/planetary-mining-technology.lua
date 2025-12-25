local util_icon = require("scripts.util.icon")

data:extend {
  {
    type = "technology",
    name = "linox-technology_planetary-mining-technology",
    order = "linox",
    icons = util_icon.technology_icon_script_research("__linox__/graphics/technology/planetary-mining-technology.png", 500),
    essential = true,
    prerequisites = {"linox-technology_exploring-linox-landing-site"},
    research_trigger = {
      type = "scripted",
      trigger_description = {"technology-description.linox-technology-trigger-description_lorax-talking"}
    },
    effects =
    {
      { type = "unlock-recipe", recipe = "linox-recipe_low-temp-separation-of-calcium", },
    },
  },
    {
      type = "technology",
      name = "linox-technology_tungsten-extraction",
      order = "linox",
      icons = util_icon.technology_icon_script_research("__space-age__/graphics/icons/tungsten-ore-3.png", 64),
      prerequisites = {"linox-technology_planetary-mining-technology"},
      research_trigger = {
        type = "scripted",
        trigger_description = {"technology-description.linox-technology-trigger-description_lorax-purchase"}
      },
      effects =
      {
        { type = "unlock-recipe", recipe = "linox-recipe_tungsten-extraction", },
      },
    },
      {
        type = "technology",
        name = "linox-technology_tungsten-processing",
        order = "linox",
        icons = util_icon.technology_icon_script_research("__space-age__/graphics/technology/tungsten-steel.png", 256),
        prerequisites = {"linox-technology_tungsten-extraction"},
        research_trigger = {
          type = "scripted",
          trigger_description = {"technology-description.linox-technology-trigger-description_lorax-purchase"}
        },
        effects =
        {
          { type = "unlock-recipe", recipe = "tungsten-gear-wheel" },
          { type = "unlock-recipe", recipe = "tungsten-stick" },
        },
      },
      {
        type = "technology",
        name = "linox-technology_stone-extraction",
        order = "linox",
        icons = util_icon.technology_icon_linox_mod("__base__/graphics/icons/stone.png", 64),
        prerequisites = {"linox-technology_planetary-mining-technology", "linox-technology_linox-supercomputer"},
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "linox-recipe_stone-extraction",
          },
          {
            type = "unlock-recipe",
            recipe = "linox-recipe_casting-stone-brick",
          },
        },
        unit =
        {
          count = 300,
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
      name = "linox-technology_mantle-extraction",
      order = "linox",
      icon = "__space-exploration-graphics__/graphics/technology/core-miner.png",
      icon_size = 128,
      prerequisites = {"linox-technology_planetary-mining-technology", "linox-technology_linox-supercomputer"},
      effects =
      {
        {
          type = "unlock-recipe",
          recipe = "linox-building_mantle-extractor",
        },
      },
      unit =
      {
        count = 250,
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
        name = "linox-technology_rare-earth-refining",
        order = "linox",
        icon = "__linox__/graphics/technology/rare-earth-refining.png",
        icon_size = 256,
        prerequisites = {"linox-technology_mantle-extraction"},
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "linox-recipe_rare-earth-refining",
          },
          {
            type = "unlock-recipe",
            recipe = "linox-item_rare-earth-data-card",
          },
        },
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
        essential = true,
      },
        {
          type = "technology",
          name = "linox-technology_samarium-centrifugation",
          order = "linox",
          icons = {
            {
              icon = "__linox__/graphics/technology/white-powder.png",
              icon_size = 256,
              tint = { 222, 232, 107 }
            },
          },
          prerequisites = {"linox-technology_rare-earth-refining"},
          effects =
          {
            {
              type = "unlock-recipe",
              recipe = "linox-recipe_samarium-centrifugation",
            },
            {
              type = "unlock-recipe",
              recipe = "centrifuge",
            },
          },
          unit =
          {
            count = 350,
            ingredients =
            {
              {"linox-item_lava-data-card", 1},
              {"linox-item_rare-earth-data-card", 1},
            },
            time = 60
          },
          ignore_tech_cost_multiplier = true,
        },
      {
        type = "technology",
        name = "linox-technology_ultra-deep-drilling",
        order = "linox",
        icons = util_icon.technology_icon_linox_mod("__base__/graphics/technology/oil-gathering.png", 256),
        prerequisites = {"linox-technology_mantle-extraction"},
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "linox-recipe_advanced-acid-neutralisation",
          },
          {
            type = "nothing",
            icons = util_icon.icon_constant_recipe_productivity("__space-exploration-graphics__/graphics/icons/radiator-blue.png", 64),
            effect_description = {"technology-icon-description.internel-pipeline-add-2"},
          },
        },
        unit =
        {
          count = 250,
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
        name = "linox-technology_adding-pipeline_samarium",
        order = "linox",
        icons = util_icon.technology_icon_constant_recipe_productivity("__space-exploration-graphics__/graphics/technology/radiator-blue.png", 128),
        prerequisites = {"linox-technology_samarium-data-card"},
        localised_name = {"technology-name.linox-technology_adding-pipeline"},
        localised_description = {"technology-description.linox-technology_adding-pipeline"},
        effects =
        {
          {
            type = "nothing",
            icons = util_icon.icon_constant_recipe_productivity("__space-exploration-graphics__/graphics/icons/radiator-blue.png", 64),
            effect_description = {"technology-icon-description.internel-pipeline-add-1"},
          },
        },
        unit =
        {
          count = 1000,
          ingredients =
          {
            {"linox-item_lava-data-card", 1},
            {"linox-item_rare-earth-data-card", 1},
            {"linox-item_samarium-data-card", 1},
          },
          time = 60
        },
        ignore_tech_cost_multiplier = true,
      },
      {
        type = "technology",
        name = "linox-technology_adding-pipeline_dysprosium",
        order = "linox",
        icons = util_icon.technology_icon_constant_recipe_productivity("__space-exploration-graphics__/graphics/technology/radiator-blue.png", 128),
        prerequisites = {"linox-technology_dysprosium-data-card"},
        localised_name = {"technology-name.linox-technology_adding-pipeline"},
        localised_description = {"technology-description.linox-technology_adding-pipeline"},
        effects =
        {
          {
            type = "nothing",
            icons = util_icon.icon_constant_recipe_productivity("__space-exploration-graphics__/graphics/icons/radiator-blue.png", 64),
            effect_description = {"technology-icon-description.internel-pipeline-add-1"},
          },
        },
        unit =
        {
          count = 1000,
          ingredients =
          {
            {"linox-item_lava-data-card", 1},
            {"linox-item_rare-earth-data-card", 1},
            {"linox-item_dysprosium-data-card", 1},
          },
          time = 60
        },
        ignore_tech_cost_multiplier = true,
      },

      {
        type = "technology",
        name = "linox-technology_adding-pipeline_neodymium",
        order = "linox",
        icons = util_icon.technology_icon_constant_recipe_productivity("__space-exploration-graphics__/graphics/technology/radiator-blue.png", 128),
        prerequisites = {"linox-technology_neodymium-data-card"},
        localised_name = {"technology-name.linox-technology_adding-pipeline"},
        localised_description = {"technology-description.linox-technology_adding-pipeline"},
        effects =
        {
          {
            type = "nothing",
            icons = util_icon.icon_constant_recipe_productivity("__space-exploration-graphics__/graphics/icons/radiator-blue.png", 64),
            effect_description = {"technology-icon-description.internel-pipeline-add-1"},
          },
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
        ignore_tech_cost_multiplier = true,
      },
      {
        type = "technology",
        name = "linox-technology_adding-pipeline_erbium",
        order = "linox",
        icons = util_icon.technology_icon_constant_recipe_productivity("__space-exploration-graphics__/graphics/technology/radiator-blue.png", 128),
        prerequisites = {"linox-technology_erbium-data-card"},
        localised_name = {"technology-name.linox-technology_adding-pipeline"},
        localised_description = {"technology-description.linox-technology_adding-pipeline"},
        effects =
        {
          {
            type = "nothing",
            icons = util_icon.icon_constant_recipe_productivity("__space-exploration-graphics__/graphics/icons/radiator-blue.png", 64),
            effect_description = {"technology-icon-description.internel-pipeline-add-1"},
          },
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
            {"linox-item_erbium-data-card", 1},
          },
          time = 60
        },
        ignore_tech_cost_multiplier = true,
      },
};