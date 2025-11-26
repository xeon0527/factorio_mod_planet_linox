local util_icon = require("scripts.util.icon")

data:extend {
  {
    type = "technology",
    name = "linox-technology_facility-upgrade",
    icons = util_icon.technology_icon_script_research("__base__/graphics/technology/gate.png", 256),
    essential = true,
    prerequisites = {"linox-technology_exploring-linox-landing-site"},
    research_trigger = {
      type = "scripted",
      trigger_description = {"technology-description.linox-technology-trigger-description_lorax-talking"}
    },
  },
    {
      type = "technology",
      name = "linox-technology_facility-factoryizing",
      icons = util_icon.technology_icon_script_research("__base__/graphics/technology/stone-wall.png", 256),
      prerequisites = {"linox-technology_facility-upgrade"},
      research_trigger = {
        type = "scripted",
        trigger_description = {"technology-description.linox-technology-trigger-description_lorax-talking"}
      },
    },
      {
        type = "technology",
        name = "linox-technology_expanding-factory-1",
        icons = util_icon.technology_icon_script_research("__base__/graphics/technology/stone-wall.png", 256),
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
          icons = util_icon.technology_icon_linox_mod("__base__/graphics/technology/stone-wall.png", 256),
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
            icons = util_icon.technology_icon_linox_mod("__base__/graphics/technology/stone-wall.png", 256),
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
      name = "linox-technology_rocket-silo-foundation",
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
    },
    --{
    --  type = "technology",
    --  name = "linox-technology_planetary-power-network",
    --  icon = "__base__/graphics/technology/electric-energy-distribution-1.png",
    --  icon_size = 256,
    --  prerequisites = {"linox-technology_facility-upgrade"},
    --  unit =
    --  {
    --    count = 250,
    --    ingredients =
    --    {
    --      {"automation-science-pack", 1},
    --      {"logistic-science-pack", 1},
    --      {"chemical-science-pack", 1},
    --      {"military-science-pack", 1},
    --      {"production-science-pack", 1},
    --      {"utility-science-pack", 1},
    --      {"space-science-pack", 1},
    --      {"metallurgic-science-pack", 1},
    --    },
    --    time = 60
    --  }
    --},
    --  {
    --    type = "technology",
    --    name = "linox-technology_planetary-power-network-capacity",
    --    icon = "__base__/graphics/technology/electric-energy-distribution-1.png",
    --    icon_size = 256,
    --    prerequisites = {"linox-technology_planetary-power-network"},
    --    unit =
    --    {
    --      count_formula = "2^(L-1)*1000",
    --      ingredients =
    --      {
    --        {"automation-science-pack", 1},
    --        {"logistic-science-pack", 1},
    --        {"chemical-science-pack", 1},
    --        {"military-science-pack", 1},
    --        {"production-science-pack", 1},
    --        {"utility-science-pack", 1},
    --        {"space-science-pack", 1},
    --        {"metallurgic-science-pack", 1},
    --      },
    --      time = 60
    --    },
    --    max_level = "infinite",
    --    upgrade = true,
    --  },



      --{
      --  type = "technology",
      --  name = "linox-technology_expanding-factory",
      --  icon = "__base__/graphics/technology/stone-wall.png",
      --  icon_size = 256,
      --  prerequisites = {
      --    "linox-technology_facility-upgrade",
      --    "linox-technology_facility-factoryizing"
      --  },
      --  unit =
      --  {
      --    count_formula = "2^(L-1)*1000",
      --    ingredients =
      --    {
      --      {"automation-science-pack", 1},
      --      {"logistic-science-pack", 1},
      --      {"chemical-science-pack", 1},
      --      {"military-science-pack", 1},
      --      {"production-science-pack", 1},
      --      {"utility-science-pack", 1},
      --      {"space-science-pack", 1},
      --      {"metallurgic-science-pack", 1},
      --    },
      --    time = 60
      --  },
      --  max_level = 7,
      --  upgrade = true,
      --},
    {
      type = "technology",
      name = "linox-technology-cargo-elevator",
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
    },

    {
      type = "technology",
      name = "linox-technology_power-converter",
      icons = util_icon.technology_icon_script_research("__base__/graphics/technology/electric-energy-acumulators.png", 256),
      prerequisites = {"linox-technology_rare-earth-refining"},
      research_trigger = {
        type = "scripted",
        trigger_description = {"technology-description.linox-technology-trigger-description_lorax-purchase"}
      },
    },
};