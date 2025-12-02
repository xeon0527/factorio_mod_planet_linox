
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

local my_upgrade_data = {
  {
    handler = "linox-mu-handler_chemical-plant-productivity",
    technology_name = "linox-technology_chemical-plant-productivity",
    modifier_icon = {icon = "__base__/graphics/icons/chemical-plant.png"},
    entity_names = {"chemical-plant"},
    module_effects = {productivity = 0.1,},
    effect_name = {"technology-name.linox-technology_chemical-plant-productivity"}, --would make an effect that says "My custom string: -10% Productivity
  },
}

local mupgrades = require("__machine-upgrades__.lib.technology-maker")
mupgrades.handle_modifier_data(my_upgrade_data)