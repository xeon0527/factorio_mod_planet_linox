local util_icon = require("scripts.util.icon")

data:extend {
  {
    type = "recipe",
    name = "linox-recipe_chemical-filter_holmium-solution",
    localised_name = {"", {"entity-name.linox-building_chemical-filter"}, " - ", {"fluid-name.holmium-solution"}},
    category = "linox-recipe-category_chemical-filter",
    subgroup = "fulgora-processes",
    order = "b[holmium]-b[holmium-solution]",
    auto_recycle = false,
    energy_required = 5,
    ingredients =
    {
      {type = "item", name = "holmium-ore", amount = 2},
      {type = "item", name = "stone", amount = 1},
      {type = "fluid", name = "water", amount = 10}
    },
    results =
    {
      {type = "fluid", name="holmium-solution", amount = 100}
    },
    allow_productivity = true,
    maximum_productivity = 5.0,
    main_product = "holmium-solution",
    enabled = false,
    crafting_machine_tint =
    {
      primary = {r = 0.598, g = 0.274, b = 0.501, a = 0.502}, -- #98457f80
      secondary = {r = 0.524, g = 0.499, b = 0.521, a = 0.502}, -- #857f8480
      tertiary = {r = 0.716, g = 0.716, b = 0.716, a = 0.502}, -- #b6b6b680
      quaternary = {r = 0.768, g = 0.487, b = 0.684, a = 0.502}, -- #c37cae80
    }
  },
}