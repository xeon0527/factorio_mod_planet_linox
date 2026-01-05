if not settings.startup["linox-settings_remove-logistic-system"].value then
  table.insert(data.raw["technology"]["linox-technology_planet-discovery-linox"].prerequisites, "logistic-system")
end

require("modules/compatibility/aai-signal-transmission").data_update()
require("modules/compatibility/even-pickier-dollies").data_update()
require("modules/compatibility/EnhancedBeacons").data_update()
require("modules/compatibility/Moshine").data_update()
require("modules/compatibility/recursive-blueprints").data_update()
require("modules/compatibility/squeak-through-2").data_update()
require("modules/compatibility/DistributionRequestPlanner").data_update()