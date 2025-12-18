local __MODULE__ = {}

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