local linox_facility = require("scripts.svc.surface.linox-facility")

local surface = linox_facility.get()
if surface then
  local force = game.forces["player"]
  local tech = force.technologies

  local expand_facility_level = 0
  if tech["linox-technology_facility-factoryizing"].researched then
    expand_facility_level = 1

    if tech["linox-technology_expanding-factory-1"].researched then
      expand_facility_level = expand_facility_level + 1
    end

    if tech["linox-technology_expanding-factory-2"].researched then
      expand_facility_level = expand_facility_level + 1
    end

    if tech["linox-technology_expanding-factory-3"].researched then
      expand_facility_level = expand_facility_level + 1
    end

    if tech["linox-technology_expanding-factory-4"].researched then
      expand_facility_level = expand_facility_level + 1
    end

    if tech["linox-technology_expanding-factory-5"].researched then
      expand_facility_level = expand_facility_level + 1
    end

    if tech["linox-technology_expanding-factory-6"].researched then
      expand_facility_level = expand_facility_level + 1
    end

    if tech["linox-technology_expanding-factory-7"].researched then
      expand_facility_level = expand_facility_level + 1
    end
  end

  for level = 0, expand_facility_level do
    linox_facility.expand_facility(level)
  end
end