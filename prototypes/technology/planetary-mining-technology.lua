local util_icon = require("scripts.util.icon")

data:extend {
  {
    type = "technology",
    name = "linox-technology_planetary-mining-technology",
    icons = util_icon.technology_icon_script_research("__space-age__/graphics/technology/big-mining-drill.png", 256),
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
        icons = util_icon.technology_icon_linox_mod("__base__/graphics/technology/oil-gathering.png", 256),
        prerequisites = {"linox-technology_mantle-extraction"},
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "linox-recipe_advanced-acid-neutralisation",
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
};