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

  data.raw["recipe"]["blueprint-deployer"].hidden = true
  data.raw["recipe"]["blueprint-deployer"].hidden_in_factoriopedia = true
  data.raw["tips-and-tricks-item"]["recursive-pb-deployer"] = nil

  data.raw["tips-and-tricks-item"]["recursive-pb-common"].category = "linox-tips-and-tricks_category"
  data.raw["tips-and-tricks-item"]["recursive-pb-common"].indent = 1
  data.raw["tips-and-tricks-item"]["recursive-pb-common"].order = "zai"

  data.raw["tips-and-tricks-item"]["recursive-pb-deployer2"].category = "linox-tips-and-tricks_category"
  data.raw["tips-and-tricks-item"]["recursive-pb-deployer2"].indent = 2
  data.raw["tips-and-tricks-item"]["recursive-pb-deployer2"].order = "zaia"

  data.raw["tips-and-tricks-item"]["recursive-pb-scanner"].category = "linox-tips-and-tricks_category"
  data.raw["tips-and-tricks-item"]["recursive-pb-scanner"].indent = 2
  data.raw["tips-and-tricks-item"]["recursive-pb-scanner"].order = "zaib"

  data.raw["tips-and-tricks-item"]["recursive-bp-offset-tool"].category = "linox-tips-and-tricks_category"
  data.raw["tips-and-tricks-item"]["recursive-bp-offset-tool"].indent = 2
  data.raw["tips-and-tricks-item"]["recursive-bp-offset-tool"].order = "zaic"

  data.raw["recipe"]["blueprint-deployer2"].ingredients = {
    {type = "item", name = "electronic-circuit", amount = 1},
    {type = "item", name = "iron-plate", amount = 10},
  }


end

return __MODULE__