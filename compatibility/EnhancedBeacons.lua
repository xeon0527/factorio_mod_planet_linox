local __MODULE__ = {}

__MODULE__.data_update = function()
  if mods["EnhancedBeacons"] then
    local enhanced_beacons = data.raw["beacon"]["beacon"]
    local erbium_beacons = data.raw["beacon"]["linox-building_erbium-beacon"]
  
    erbium_beacons.energy_usage = enhanced_beacons.energy_usage
    erbium_beacons.distribution_effectivity = enhanced_beacons.distribution_effectivity
    erbium_beacons.distribution_effectivity_bonus_per_quality_level = enhanced_beacons.distribution_effectivity_bonus_per_quality_level
    erbium_beacons.module_slots = enhanced_beacons.module_slots * 2
    erbium_beacons.supply_area_distance = enhanced_beacons.supply_area_distance
    erbium_beacons.profile = enhanced_beacons.profile
    erbium_beacons.icons_positioning = enhanced_beacons.icons_positioning
  end
end

return __MODULE__