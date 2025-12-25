local util_icon = require("scripts.util.icon")

data:extend {
  {
    type = "technology",
    name = "linox-technology_planet-discovery-linox",
    order = "linox",
    icons = PlanetsLib.technology_icon_constant_planet("__linox__/graphics/icons/planet-linox.png", 512),
    essential = true,
    effects =
    {
      {
        type = "unlock-space-location",
        space_location = "linox-planet_linox",
        use_icon_overlay_constant = true
      }
    },
    prerequisites = {
      "planet-discovery-vulcanus",
      "construction-robotics",
      --"logistic-system",
      "metallurgic-science-pack",
      "circuit-network",
    },
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
    order = "linox",
    icons = util_icon.technology_icon_constant_damage_size("__linox__/graphics/icons/planet-linox.png", 512),
    prerequisites = {"linox-technology_planet-discovery-linox"},
    unit =
    {
      count = 250,
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
};