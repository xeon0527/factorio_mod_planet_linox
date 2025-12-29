local __MODULE__ = {}

__MODULE__.data_update = function()
  if mods["DistributionRequestPlanner"] and settings.startup["linox-settings_compatibility-distribution-request-planner"].value then
    data:extend {
      {
        type = "technology",
        name = "linox-technology_distribution-request-planner",
        order = "linox",
        icons = {
          {
            icon = "__base__/graphics/technology/worker-robots-speed.png",
            icon_size = 256,
          },
          {
            icon = "__base__/graphics/icons/requester-chest.png",
            icon_size = 64,
            scale = 1,
            shift = {30, 30},
            floating = true
          }
        },
        effects =
        {
          {
            type = "nothing",
            icon = "__base__/graphics/icons/requester-chest.png",
            icon_size = 64,
            effect_description = {"technology-icon-description.distribution-request-planner"},
            use_icon_overlay_constant = true,
          },
        },
        prerequisites = {
          "linox-technology_erbium-data-card",
          "linox-technology_neodymium-data-card",
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
            {"linox-item_neodymium-data-card", 1},
            {"linox-item_erbium-data-card", 1},
          },
          time = 60
        },
        ignore_tech_cost_multiplier = true,
      },
    }

    data.raw["shortcut"]["give-item-requester"].technology_to_unlock = "linox-technology_distribution-request-planner"
    data.raw["shortcut"]["give-item-requester"].unavailable_until_unlocked = true
  end
end

return __MODULE__