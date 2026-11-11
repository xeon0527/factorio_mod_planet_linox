local function _SETTINGS_no_logistic_system()
  if not settings.startup["linox-settings_hard-mode_no-logistic-system"].value then
    table.insert(data.raw["technology"]["linox-technology_planet-discovery-linox"].prerequisites, "logistic-system")
  end
end

local function _SETTINGS_anywhere_mantle_extractor()
  if not settings.startup["linox-settings_hard-mode_disable-mantle-extractor"].value and
        settings.startup["linox-settings_easy-mode_anywhere-mantle-extractor"].value then
    data.raw["assembling-machine"]["linox-building_mantle-extractor"].surface_conditions = nil
  end
end

local function _SETTINGS_surface_condition()
  if settings.startup["linox-settings_hard-mode_use-surface-condition"].value then
    local recipes = {
      "linox-building_advanced-rocket-silo",
      "linox-building_chemical-filter",
      "linox-building_chemical-tank",
      "linox-building_core-roboport",
      "linox-building_erbium-beacon",
      "linox-building_huge-heat-exchanger",
      "linox-building_linox-supercomputer",
      "linox-building_neodymium-bulk-inserter",
      "linox-building_neodymium-permanent-magnet-generator",
      "linox-building_neodymium-stack-inserter",
      "linox-building_outlet",
      "linox_samarium-construction-robot",
      "linox_samarium-logistic-robot",
      "linox-building_sintering-machine",
      "linox-building_turbo-pump",
    }

    if not settings.startup["linox-settings_hard-mode_disable-mantle-extractor"].value then
      table.insert(recipes, "linox-building_mantle-extractor")
    end
  
    for _, r in pairs(recipes) do
      data.raw["recipe"][r].surface_conditions = __LINOX_SURFACE_CONDITION__
    end
  end
end

local function _nuke_destruction_prevention()
  local property = {
    property = "linox-no-nuke",
    min = 0,
    max = 0,
  }

  local explosions = {
    "nuke-effects-nauvis",
    "nuke-effects-aquilo",
    "nuke-effects-vulcanus",
    "nuke-effects-space"
  }


  for _, exp in pairs(explosions) do
    if data.raw["explosion"][exp].surface_conditions == nil then
      data.raw["explosion"][exp].surface_conditions = {}
    end

    table.insert(data.raw["explosion"][exp].surface_conditions, property)
  end
end

local function _SETTINGS_disable_mantle_extractor()
  if settings.startup["linox-settings_hard-mode_disable-mantle-extractor"].value then
    data.raw["technology"]["linox-technology_mantle-extraction"] = nil
    data.raw["technology"]["linox-technology_rare-earth-refining"].prerequisites = {"linox-technology_planetary-mining-technology", "linox-technology_linox-supercomputer"}
    data.raw["technology"]["linox-technology_ultra-deep-drilling"].prerequisites = {"linox-technology_planetary-mining-technology", "linox-technology_linox-supercomputer"}
  end
end

_SETTINGS_no_logistic_system()
_SETTINGS_anywhere_mantle_extractor()
_SETTINGS_surface_condition()
_SETTINGS_disable_mantle_extractor()

_nuke_destruction_prevention()

-- Enable Linox Foundry Recipe
table.insert(data.raw["technology"]["foundry"].effects, {
  type = "unlock-recipe",
  recipe = "linox-recipe_linox-foundry"
})