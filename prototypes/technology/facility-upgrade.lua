data:extend {
  {
    type = "technology",
    name = "linox-technology_facility-upgrade",
    icon = "__base__/graphics/technology/gate.png",
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
      name = "linox-technology_facility-factoryizing",
      icon = "__base__/graphics/technology/stone-wall.png",
      icon_size = 256,
      prerequisites = {"linox-technology_facility-upgrade"},
      research_trigger = {
        type = "scripted",
        trigger_description = {"technology-description.linox-technology-trigger-description_lorax-talking"}
      },
    },
      {
        type = "technology",
        name = "linox-technology_expanding-factory-1",
        icon = "__base__/graphics/technology/stone-wall.png",
        icon_size = 256,
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
          icon = "__base__/graphics/technology/stone-wall.png",
          icon_size = 256,
          prerequisites = {
            "linox-technology_expanding-factory-1"
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
          upgrade = true,
          ignore_tech_cost_multiplier = true,
        },
          {
            type = "technology",
            name = "linox-technology_expanding-factory-3",
            icon = "__base__/graphics/technology/stone-wall.png",
            icon_size = 256,
            prerequisites = {
              "linox-technology_expanding-factory-2",
              "linox-technology_samarium-centrifugation",
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
            upgrade = true,
            ignore_tech_cost_multiplier = true,
          },


    {
      type = "technology",
      name = "linox-technology_rocket-silo-foundation",
      icon = "__space-age__/graphics/technology/foundation.png",
      icon_size = 256,
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
      icon = "__base__/graphics/technology/engine.png",
      icon_size = 256,
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
};