data:extend {
  {
    type = "technology",
    name = "linox-technology_planetary-mining-technology",
    icon = "__space-age__/graphics/technology/big-mining-drill.png",
    icon_size = 256,
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
      icon = "__space-age__/graphics/icons/tungsten-ore-3.png",
      icon_size = 64,
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
        icon = "__space-age__/graphics/technology/tungsten-steel.png",
        icon_size = 256,
        prerequisites = {"linox-technology_tungsten-extraction"},
        research_trigger = {
          type = "scripted",
          trigger_description = {"technology-description.linox-technology-trigger-description_lorax-purchase"}
        },
        effects =
        {
          { type = "unlock-recipe", recipe = "linox-recipe_tungsten-gear-wheel" },
          { type = "unlock-recipe", recipe = "linox-recipe_tungsten-stick" },
        },
      },
      {
        type = "technology",
        name = "linox-technology_stone-extraction",
        icon = "__base__/graphics/icons/stone.png",
        icon_size = 64,
        prerequisites = {"linox-technology_planetary-mining-technology"},
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
      icon = "__space-age__/graphics/technology/foundry.png",
      icon_size = 256,
      prerequisites = {"linox-technology_planetary-mining-technology"},
      effects =
      {
        {
          type = "unlock-recipe",
          recipe = "linox-recipe_mantle-extractor",
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
    },
      {
        type = "technology",
        name = "linox-technology_rare-earth-refining",
        icon = "__space-exploration-graphics__/graphics/technology/sand-processing.png",
        icon_size = 128,
        prerequisites = {"linox-technology_mantle-extraction"},
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "linox-recipe_rare-earth-refining",
          },
          {
            type = "unlock-recipe",
            recipe = "linox-recipe_rare-earth-data-card",
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
      },
        {
          type = "technology",
          name = "linox-technology_samarium-centrifugation",
          icon = "__space-exploration-graphics__/graphics/technology/iridium-processing.png",
          icon_size = 128,
          prerequisites = {"linox-technology_rare-earth-refining"},
          effects =
          {
            {
              type = "unlock-recipe",
              recipe = "linox-recipe_samarium-centrifugation",
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
        icon = "__base__/graphics/technology/oil-gathering.png",
        icon_size = 256,
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