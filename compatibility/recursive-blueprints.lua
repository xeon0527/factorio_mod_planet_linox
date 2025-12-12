local __MODULE__ = {}

__MODULE__.data_update = function()
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

  data.raw["recipe"]["blueprint-deployer"].ingredients = {
    {type = "item", name = "electronic-circuit", amount = 1},
    {type = "item", name = "iron-plate", amount = 10},
  }

  data.raw["recipe"]["blueprint-deployer2"].ingredients = {
    {type = "item", name = "electronic-circuit", amount = 1},
    {type = "item", name = "iron-plate", amount = 10},
  }
end

return __MODULE__