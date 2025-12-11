local util_icon = require("scripts.util.icon")
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

if not settings.startup["linox-settings_remove-logistic-system"].value then
  table.insert(data.raw["technology"]["linox-technology_planet-discovery-linox"].prerequisites, "logistic-system")
end

if mods["Moshine"] and settings.startup["linox-settings_enable-moshine-neodymium-recipe"].value then
  data:extend {
    {
      type = "recipe",
      name = "linox-moshine-recipe_neodymium-crushing",
      icons = util_icon.recipe_icon_linox("__Moshine__/graphics/icons/neodymium.png", 64),
      ingredients = {{type = "item", name = "neodymium", amount = 10}},
      results = {{type="item", name="neodymium-powder", amount = 1}},
      allow_productivity = true,
      enabled = false,
    },
    {
      type = "technology",
      name = "linox-moshine-technology_neodymium-crushing",
      icon = "__Moshine__/graphics/technology/moshine-tech-magnet.png",
      icon_size = 256,
      prerequisites = {
        "linox-technology_neodymium-extraction",
      },
      unit =
      {
        count = 250,
        ingredients =
        {
          {"linox-item_lava-data-card", 1},
          {"linox-item_rare-earth-data-card", 1},
          {"linox-item_samarium-data-card", 1},
          {"linox-item_dysprosium-data-card", 1},
        },
        time = 60
      },
      effects =
      {
        { type = "unlock-recipe", recipe = "linox-moshine-recipe_neodymium-crushing" },
      },
      ignore_tech_cost_multiplier = true,
      essential = true,
    },
  }
end

if mods["aai-signal-transmission"] then
  if settings.startup["linox-settings_disable-aai-signal-transmission"].value then
    data.raw.technology["aai-signal-transmission"] = nil
    data.raw.recipe["aai-signal-sender"] = nil
    data.raw.recipe["aai-signal-receiver"] = nil

  elseif not settings.startup["linox-settings_disconnect-aai-signal-transmission"].value then
    local tech = data.raw.technology["aai-signal-transmission"]
    tech.prerequisites = {
      "processing-unit",
      "electric-engine",
      "circuit-network",
      "linox-technology_erbium-data-card",
    }
    tech.unit = {
      count = 1000,
      ingredients =
      {
        {"linox-item_lava-data-card", 1},
        {"linox-item_rare-earth-data-card", 1},
        {"linox-item_samarium-data-card", 1},
        {"linox-item_dysprosium-data-card", 1},
        {"linox-item_erbium-data-card", 1},
      },
      time = 60
    }

    table.insert(data.raw.recipe["aai-signal-sender"].ingredients, {type = "item", name = "erbium-powder", amount = 10})
    table.insert(data.raw.recipe["aai-signal-receiver"].ingredients, {type = "item", name = "erbium-powder", amount = 10})
  end
end