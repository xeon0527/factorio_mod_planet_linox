local __MODULE__ = {}

__MODULE__.data_update = function()
  if mods["aai-signal-transmission"] then
    if settings.startup["linox-settings_disable-aai-signal-transmission"].value then
      data.raw.technology["aai-signal-transmission"] = nil
      data.raw.recipe["aai-signal-sender"] = nil
      data.raw.recipe["aai-signal-receiver"] = nil
  
    elseif not settings.startup["linox-settings_disconnect-aai-signal-transmission"].value then
      local tech = data.raw.technology["aai-signal-transmission"]
      tech.prerequisites = {
        "processing-unit",
        "electric-engine",
        "circuit-network",
        "linox-technology_erbium-data-card",
      }
      tech.unit = {
        count = 1000,
        ingredients =
        {
          {"linox-item_lava-data-card", 1},
          {"linox-item_rare-earth-data-card", 1},
          {"linox-item_samarium-data-card", 1},
          {"linox-item_dysprosium-data-card", 1},
          {"linox-item_erbium-data-card", 1},
        },
        time = 60
      }
      tech.ignore_tech_cost_multiplier = true
  
      table.insert(data.raw.recipe["aai-signal-sender"].ingredients, {type = "item", name = "erbium-powder", amount = 10})
      table.insert(data.raw.recipe["aai-signal-receiver"].ingredients, {type = "item", name = "erbium-powder", amount = 10})
    end
  end
end

return __MODULE__