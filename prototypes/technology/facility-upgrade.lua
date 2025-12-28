local util_icon = require("scripts.util.icon")

data:extend {
  {
    type = "technology",
    name = "linox-technology_facility-upgrade",
    order = "linox",
    icons = util_icon.technology_icon_script_research("__linox__/graphics/technology/facility-upgrade.png", 500),
    essential = true,
    prerequisites = {"linox-technology_exploring-linox-landing-site"},
    research_trigger = {
      type = "scripted",
      trigger_description = {"technology-description.linox-technology-trigger-description_lorax-talking"}
    },
  },
    {
      type = "technology",
      name = "linox-technology_get-cargo-landing-pad",
      order = "linox",
      icons = util_icon.technology_icon_script_research("__space-age__/graphics/technology/space-platform.png", 256),
      prerequisites = {"linox-technology_exploring-linox-landing-site"},
      research_trigger = {
        type = "scripted",
        trigger_description = {"technology-description.linox-technology-trigger-description_lorax-talking"}
      },
    },
    {
      type = "technology",
      name = "linox-technology_facility-factoryizing",
      order = "linox",
      icons = util_icon.technology_icon_script_research("__linox__/graphics/technology/facility-factoryizing.png", 512),
      prerequisites = {"linox-technology_facility-upgrade"},
      research_trigger = {
        type = "scripted",
        trigger_description = {"technology-description.linox-technology-trigger-description_lorax-talking"}
      },
    },
      {
        type = "technology",
        name = "linox-technology_expanding-factory-1",
        order = "linox",
        icons = util_icon.technology_icon_script_research("__linox__/graphics/technology/expanding-factory.png", 500),
        prerequisites = {
          "linox-technology_facility-factoryizing"
        },
        research_trigger = {
          type = "scripted",
          trigger_description = {"technology-description.linox-technology-trigger-description_lorax-purchase"}
        },
        upgrade = true,
      },
        {
          type = "technology",
          name = "linox-technology_expanding-factory-2",
          order = "linox",
          icon = "__linox__/graphics/technology/expanding-factory.png",
          icon_size = 500,
          prerequisites = {
            "linox-technology_expanding-factory-1"
          },
          unit =
          {
            count = 200,
            ingredients =
            {
              {"linox-item_lava-data-card", 1},
            },
            time = 60
          },
          upgrade = true,
          ignore_tech_cost_multiplier = true,
        },
          {
            type = "technology",
            name = "linox-technology_expanding-factory-3",
            order = "linox",
            icon = "__linox__/graphics/technology/expanding-factory.png",
            icon_size = 500,
            prerequisites = {
              "linox-technology_expanding-factory-2",
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
            upgrade = true,
            ignore_tech_cost_multiplier = true,
          },
          {
            type = "technology",
            name = "linox-technology_expanding-factory-4",
            order = "linox",
            icon = "__linox__/graphics/technology/expanding-factory.png",
            icon_size = 500,
            prerequisites = {
              "linox-technology_expanding-factory-3",
              "linox-technology_samarium-data-card",
              "linox-technology_dysprosium-data-card",
            },
            unit =
            {
              count = 500,
              ingredients =
              {
                {"linox-item_lava-data-card", 1},
                {"linox-item_rare-earth-data-card", 1},
                {"linox-item_samarium-data-card", 1},
                {"linox-item_dysprosium-data-card", 1},
              },
              time = 60
            },
            upgrade = true,
            ignore_tech_cost_multiplier = true,
          },
          {
            type = "technology",
            name = "linox-technology_expanding-factory-5",
            order = "linox",
            icon = "__linox__/graphics/technology/expanding-factory.png",
            icon_size = 500,
            prerequisites = {
              "linox-technology_expanding-factory-4",
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
            upgrade = true,
            ignore_tech_cost_multiplier = true,
          },
          {
            type = "technology",
            name = "linox-technology_expanding-factory-6",
            order = "linox",
            icon = "__linox__/graphics/technology/expanding-factory.png",
            icon_size = 500,
            prerequisites = {
              "linox-technology_expanding-factory-5",
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
            upgrade = true,
            ignore_tech_cost_multiplier = true,
          },
          {
            type = "technology",
            name = "linox-technology_expanding-factory-7",
            order = "linox",
            icon = "__linox__/graphics/technology/expanding-factory.png",
            icon_size = 500,
            prerequisites = {
              "linox-technology_expanding-factory-6",
            },
            unit =
            {
              count = 4000,
              ingredients =
              {
                {"linox-item_lava-data-card", 1},
                {"linox-item_rare-earth-data-card", 1},
                {"linox-item_samarium-data-card", 1},
                {"linox-item_dysprosium-data-card", 1},
              },
              time = 60
            },
            upgrade = true,
            ignore_tech_cost_multiplier = true,
          },
    {
      type = "technology",
      name = "linox-technology_rocket-silo-foundation",
      order = "linox",
      icons = util_icon.technology_icon_linox_mod("__space-age__/graphics/technology/foundation.png", 256),
      prerequisites = {"linox-technology_facility-upgrade", "linox-technology_enhanced-space-engineering"},
      unit =
      {
        count = 700,
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
      name = "linox-technology_cargo-elevator",
      order = "linox",
      icons = util_icon.technology_icon_linox_mod("__base__/graphics/technology/engine.png", 256),
      prerequisites = {
        "linox-technology_facility-upgrade",
        "linox-technology_tungsten-processing",
      },
      effects =
      {
        {
          type = "unlock-recipe",
          recipe = "linox-building_cargo-elevator",
        },
        {
          type = "unlock-recipe",
          recipe = "linox-building_fluid-elevator",
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
      essential = true,
    },

    {
      type = "technology",
      name = "linox-technology_power-converter",
      order = "linox",
      icons = util_icon.technology_icon_script_research("__base__/graphics/technology/electric-energy-acumulators.png", 256),
      prerequisites = {"linox-technology_rare-earth-refining"},
      research_trigger = {
        type = "scripted",
        trigger_description = {"technology-description.linox-technology-trigger-description_lorax-purchase"}
      },
    },
};