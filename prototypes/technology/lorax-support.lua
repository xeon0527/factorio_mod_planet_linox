local util_icon = require("scripts.util.icon")

data:extend {
  {
    type = "technology",
    name = "linox-technology_lorax-support",
    icons = {
      {
        icon = "__space-exploration-graphics__/graphics/technology/supercomputer-3.png",
        icon_size = 128,
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-recipe-productivity.png",
        icon_size = 128,
        scale = 0.75,
        floating = true,
      },
      {
        icon = "__core__/graphics/icons/technology/effect-constant/effect-constant-upgrade-planner.png",
        icon_size = 64,
        scale = 1,
        shift = {30, 30},
        floating = true
      }
    },
    prerequisites = {"linox-technology_exploring-linox-landing-site"},
    research_trigger = {
      type = "scripted",
      trigger_description = {"technology-description.linox-technology-trigger-description_lorax-purchase"}
    },
    effects =
    {
      {
        type = "change-recipe-productivity",
        recipe = "linox-item_lava-data-card",
        change = 0.25
      },
      {
        type = "change-recipe-productivity",
        recipe = "linox-item_rare-earth-data-card",
        change = 0.25
      },
      {
        type = "change-recipe-productivity",
        recipe = "linox-item_samarium-data-card",
        change = 0.25
      },
      {
        type = "change-recipe-productivity",
        recipe = "linox-item_dysprosium-data-card",
        change = 0.25
      },
    },
  },

  {
    type = "technology",
    name = "linox-technology_build-data-catalog",
    icons = util_icon.technology_icon_script_research("__space-exploration-graphics__/graphics/technology/catalogue/universal-catalogue.png", 128),
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/universal-catalogue.png",
    icon_size = 128,
    prerequisites = {
      "linox-technology_dysprosium-data-card",
      "linox-technology_samarium-data-card",
    },
    research_trigger = {
      type = "scripted",
      trigger_description = {"technology-description.linox-technology-trigger-description_lorax-purchase"}
    },
    effects =
    {
      {
        type = "change-recipe-productivity",
        recipe = "linox-item_neodymium-data-card",
        change = 0.25
      },
    },
  }
}