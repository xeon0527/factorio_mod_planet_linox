local __MODULE__ = {}

__MODULE__.control = function()
  local bootstrap = require("scripts.drv.bootstrap")
  bootstrap.create_init_handler(function()
    if script.active_mods["any-planet-start"] and settings.startup["aps-planet"].value == "linox-planet_linox" then
      local tech = game.forces["player"].technologies
      tech["linox-technology_planet-discovery-linox"].researched = true
      tech["linox-technology_exploring-linox-landing-site"].researched = true

      tech["electronics"].researched = true
      tech["steam-power"].researched = true
      tech["circuit-network"].researched = true
      tech["advanced-combinators"].researched = true
      tech["landfill"].researched = true
      tech["fluid-handling"].researched = true
      tech["oil-processing"].researched = true
      
      --tech["logistic-robotics"].researched = true
      --tech["construction-robotics"].researched = true
      --if not settings.startup["linox-settings_remove-logistic-system"].value then
      --  tech["logistic-system"].researched = true
      --end
      
      tech["calcite-processing"].researched = true
      tech["tungsten-carbide"].researched = true
      tech["foundry"].researched = true
      tech["tungsten-steel"].researched = true

      tech["worker-robots-speed-1"].researched = true
      tech["worker-robots-speed-2"].researched = true
      tech["worker-robots-speed-3"].researched = true
    end
  end)
end

__MODULE__.data = function()
  if mods["any-planet-start"] then
---@diagnostic disable-next-line: undefined-global
    APS.add_planet {
      name = "linox-planet_linox",
      filename = "__linox__/scripts/aps.lua",
      technology = "linox-technology_planet-discovery-linox",
    }
  end
end

__MODULE__.settings = function()
  if mods["any-planet-start"] then
---@diagnostic disable-next-line: undefined-global
  APS.add_choice("linox-planet_linox")
  end
end

return __MODULE__