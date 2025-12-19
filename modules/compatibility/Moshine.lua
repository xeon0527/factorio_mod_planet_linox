local util_icon = require("scripts.util.icon")

local __MODULE__ = {}

__MODULE__.data_update = function()
  if mods["Moshine"] and settings.startup["linox-settings_enable-moshine-neodymium-recipe"].value then
    data:extend {
      {
        type = "recipe",
        name = "linox-moshine-recipe_neodymium-crushing",
        icons = util_icon.recipe_icon_linox("__Moshine__/graphics/icons/neodymium.png", 64),
        ingredients = {{type = "item", name = "neodymium", amount = 2}},
        results = {{type="item", name="neodymium-powder", amount = 1}},
        allow_productivity = true,
        enabled = false,
        category = "crushing",
      },
      {
        type = "technology",
        name = "linox-moshine-technology_neodymium-crushing",
        icon = "__Moshine__/graphics/technology/moshine-tech-magnet.png",
        icon_size = 256,
        prerequisites = {
          "linox-technology_neodymium-extraction",
        },
        unit =
        {
          count = 250,
          ingredients =
          {
            {"linox-item_lava-data-card", 1},
            {"linox-item_rare-earth-data-card", 1},
            {"linox-item_samarium-data-card", 1},
            {"linox-item_dysprosium-data-card", 1},
          },
          time = 60
        },
        effects =
        {
          { type = "unlock-recipe", recipe = "linox-moshine-recipe_neodymium-crushing" },
        },
        ignore_tech_cost_multiplier = true,
        essential = true,
      },
    }
  end
end

return __MODULE__