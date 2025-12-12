if not settings.startup["linox-settings_remove-logistic-system"].value then
  table.insert(data.raw["technology"]["linox-technology_planet-discovery-linox"].prerequisites, "logistic-system")
end

require("compatibility.aai-signal-transmission").data_update()
require("compatibility.EnhancedBeacons").data_update()
require("compatibility.Moshine").data_update()
require("compatibility.recursive-blueprints").data_update()
require("compatibility.squeak-through-2").data_update()