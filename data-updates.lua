
local effects_idx = {};

for i, effects in ipairs(data.raw.technology["construction-robotics"].effects) do
  if effects.recipe == "blueprint-deployer" or 
      effects.recipe == "blueprint-deployer2" or 
      effects.recipe == "recursive-blueprints-scanner" then
        
    table.insert(effects_idx, i);
  end;
end

for i = #effects_idx, 1, -1 do
  table.remove(data.raw.technology["construction-robotics"].effects, effects_idx[i]);
end

local recipe_dp1 = data.raw["recipe"]["blueprint-deployer"];
recipe_dp1.ingredients = {
  {type = "item", name = "electronic-circuit", amount = 1},
  {type = "item", name = "iron-plate", amount = 10},
}

local recipe_dp2 = data.raw["recipe"]["blueprint-deployer2"];
recipe_dp2.ingredients = {
  {type = "item", name = "electronic-circuit", amount = 1},
  {type = "item", name = "iron-plate", amount = 10},
}

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