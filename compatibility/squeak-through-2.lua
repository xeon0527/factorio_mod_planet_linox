local __MODULE__ = {}

__MODULE__.data_update = function()
  if not mods["squeak-through-2"] and settings.startup["linox-settings_remove-vanilla-circuit-collision"].value then
    local raws = {
      data.raw["lamp"]["small-lamp"],
  
      data.raw["arithmetic-combinator"]["arithmetic-combinator"],
      data.raw["decider-combinator"]["decider-combinator"],
      data.raw["constant-combinator"]["constant-combinator"],
      data.raw["programmable-speaker"]["programmable-speaker"],
      data.raw["power-switch"]["power-switch"],
      data.raw["display-panel"]["display-panel"],
      data.raw["selector-combinator"]["selector-combinator"],
  
      data.raw["container"]["blueprint-deployer"],
      data.raw["container"]["blueprint-deployer2"],
      data.raw["constant-combinator"]["recursive-blueprints-scanner"],
    }
  
    for _, ett in pairs(raws) do
      ett.collision_box = {{0,0},{0,0}}
    end
  end
end

return __MODULE__