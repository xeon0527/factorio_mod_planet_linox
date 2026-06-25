if not settings.startup["linox-settings_remove-logistic-system"].value then
  table.insert(data.raw["technology"]["linox-technology_planet-discovery-linox"].prerequisites, "logistic-system")
end

require("modules/compatibility/aai-signal-transmission").data_update()
require("modules/compatibility/even-pickier-dollies").data_update()
require("modules/compatibility/EnhancedBeacons").data_update()
require("modules/compatibility/Krastorio2-spaced-out").data_update()
require("modules/compatibility/Moshine").data_update()
require("modules/compatibility/recursive-blueprints").data_update()
require("modules/compatibility/squeak-through-2").data_update()
require("modules/compatibility/DistributionRequestPlanner").data_update()

if data.raw["explosion"]["nuke-effects-nauvis"].surface_conditions then
  table.insert(data.raw["explosion"]["nuke-effects-nauvis"].surface_conditions, {
    property = "linox-no-nuke",
    min = 0,
    max = 0,
  })
else
  data.raw["explosion"]["nuke-effects-nauvis"].surface_conditions = {
    {
      property = "linox-no-nuke",
      min = 0,
      max = 0,
    }
  }
end

table.insert(data.raw["explosion"]["nuke-effects-aquilo"].surface_conditions, {
  property = "linox-no-nuke",
  min = 0,
  max = 0,
})

table.insert(data.raw["explosion"]["nuke-effects-vulcanus"].surface_conditions, {
  property = "linox-no-nuke",
  min = 0,
  max = 0,
})

table.insert(data.raw["explosion"]["nuke-effects-space"].surface_conditions, {
  property = "linox-no-nuke",
  min = 0,
  max = 0,
})