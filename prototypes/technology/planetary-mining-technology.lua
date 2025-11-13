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
        count = 1000,
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
      }
    },
      {
        type = "technology",
        name = "linox-technology_stone-extraction",
        icon = "__base__/graphics/icons/stone.png",
        icon_size = 64,
        prerequisites = {"linox-technology_mantle-extraction"},
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "linox-recipe_stone-extraction",
          },
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
        }
      },
      {
        type = "technology",
        name = "linox-technology_tungsten-extraction",
        icon = "__space-age__/graphics/icons/tungsten-ore.png",
        icon_size = 64,
        prerequisites = {"linox-technology_mantle-extraction"},
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "linox-recipe_tungsten-extraction",
          },
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
        }
      },
      {
        type = "technology",
        name = "linox-technology_casting-stone-brick",
        icon = "__base__/graphics/icons/stone-brick.png",
        icon_size = 64,
        prerequisites = {"linox-technology_mantle-extraction"},
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "linox-recipe_casting-stone-brick",
          },
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
        }
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
        }
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
            {
              type = "unlock-recipe",
              recipe = "linox-recipe_turbo-pump",
            },
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
          }
        },
};