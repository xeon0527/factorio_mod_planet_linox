data:extend {
  {
    type = "technology",
    name = "linox-technology_planet-discovery-linox",
    icon = "__space-exploration-graphics__/graphics/entity/starmap/star.png",
    icon_size = 512,
    essential = true,
    effects =
    {
      {
        type = "unlock-space-location",
        space_location = "linox-planet_linox",
        use_icon_overlay_constant = true
      }
    },
    prerequisites = {"planet-discovery-vulcanus"},
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"space-science-pack", 1},
        {"metallurgic-science-pack", 1},
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "linox-technology_exploring-linox-landing-site",
    icon = "__space-exploration-graphics__/graphics/entity/starmap/star.png",
    icon_size = 512,
    prerequisites = {"linox-technology_planet-discovery-linox"},
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