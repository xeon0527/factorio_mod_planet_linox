local util_icon = require("scripts.util.icon")

data:extend {
  {
    type = "recipe",
    name = "linox-recipe_chemical-tank_heavy-oil-cracking",
    category = "linox-recipe-category_chemical-tank",
    enabled = true,
    energy_required = 1,
    ingredients =
    {
      {type = "fluid", name = "water", amount = 30},
      {type = "fluid", name = "heavy-oil", amount = 40}
    },
    results =
    {
      {type = "fluid", name = "light-oil", amount = 30}
    },
    allow_productivity = true,
    maximum_productivity = 5.0,
    main_product = "",
    localised_name = {"", {"entity-name.linox-building_chemical-tank"}, " - ", {"recipe-name.heavy-oil-cracking"}},

    icons = util_icon.recipe_icon_chemical_tank("__base__/graphics/icons/fluid/heavy-oil-cracking.png", 64),
    subgroup = "fluid-recipes",
    order = "b[fluid-chemistry]-a[heavy-oil-cracking]",
    crafting_machine_tint =
    {
      primary = {r = 1.000, g = 0.642, b = 0.261, a = 1.000}, -- #ffa342ff
      secondary = {r = 1.000, g = 0.722, b = 0.376, a = 1.000}, -- #ffb85fff
      tertiary = {r = 0.854, g = 0.659, b = 0.576, a = 1.000}, -- #d9a892ff
      quaternary = {r = 1.000, g = 0.494, b = 0.271, a = 1.000}, -- #ff7e45ff
    }
  },

  {
    type = "recipe",
    name = "linox-recipe_chemical-tank_light-oil-cracking",
    category = "linox-recipe-category_chemical-tank",
    enabled = true,
    energy_required = 1,
    ingredients =
    {
      {type = "fluid", name = "water", amount = 30},
      {type = "fluid", name = "light-oil", amount = 30}
    },
    results =
    {
      {type = "fluid", name = "petroleum-gas", amount = 20}
    },
    allow_productivity = true,
    maximum_productivity = 5.0,
    main_product = "",
    localised_name = {"", {"entity-name.linox-building_chemical-tank"}, " - ", {"recipe-name.light-oil-cracking"}},
    icons = util_icon.recipe_icon_chemical_tank("__base__/graphics/icons/fluid/light-oil-cracking.png", 64),
    subgroup = "fluid-recipes",
    order = "b[fluid-chemistry]-b[light-oil-cracking]",
    crafting_machine_tint =
    {
      primary = {r = 0.764, g = 0.596, b = 0.780, a = 1.000}, -- #c298c6ff
      secondary = {r = 0.762, g = 0.551, b = 0.844, a = 1.000}, -- #c28cd7ff
      tertiary = {r = 0.895, g = 0.773, b = 0.596, a = 1.000}, -- #e4c597ff
      quaternary = {r = 1.000, g = 0.734, b = 0.290, a = 1.000}, -- #ffbb49ff
    }
  },

  {
    type = "recipe",
    name = "linox-recipe_chemical-tank_sulfuric-acid",
    category = "linox-recipe-category_chemical-tank",
    subgroup = "fluid-recipes",
    order = "c[oil-products]-b[sulfuric-acid]",
    energy_required = 1,
    enabled = true,
    localised_name = {"", {"entity-name.linox-building_chemical-tank"}, " - ", {"fluid-name.sulfuric-acid"}},
    icons = util_icon.recipe_icon_chemical_tank("__base__/graphics/icons/fluid/sulfuric-acid.png", 64),
    ingredients =
    {
      {type = "item", name = "sulfur", amount = 5},
      {type = "item", name = "iron-plate", amount = 1},
      {type = "fluid", name = "water", amount = 100}
    },
    results =
    {
      {type = "fluid", name = "sulfuric-acid", amount = 50}
    },
    allow_productivity = true,
    maximum_productivity = 5.0,
    crafting_machine_tint =
    {
      primary = {r = 1.000, g = 0.958, b = 0.000, a = 1.000}, -- #fff400ff
      secondary = {r = 1.000, g = 0.852, b = 0.172, a = 1.000}, -- #ffd92bff
      tertiary = {r = 0.876, g = 0.869, b = 0.597, a = 1.000}, -- #dfdd98ff
      quaternary = {r = 0.969, g = 1.000, b = 0.019, a = 1.000}, -- #f7ff04ff
    }
  },

  {
    type = "recipe",
    name = "linox-recipe_chemical-tank_lubricant",
    category = "linox-recipe-category_chemical-tank",
    enabled = true,
    localised_name = {"", {"entity-name.linox-building_chemical-tank"}, " - ", {"fluid-name.lubricant"}},
    icons = util_icon.recipe_icon_chemical_tank("__base__/graphics/icons/fluid/lubricant.png", 64),
    energy_required = 1,
    ingredients =
    {
      {type = "fluid", name = "heavy-oil", amount = 10}
    },
    results =
    {
      {type = "fluid", name = "lubricant", amount = 10}
    },
    allow_productivity = true,
    maximum_productivity = 5.0,
    subgroup = "fluid-recipes",
    order = "c[oil-products]-a[lubricant]",
    crafting_machine_tint =
    {
      primary = {r = 0.268, g = 0.723, b = 0.223, a = 1.000}, -- #44b838ff
      secondary = {r = 0.432, g = 0.793, b = 0.386, a = 1.000}, -- #6eca62ff
      tertiary = {r = 0.647, g = 0.471, b = 0.396, a = 1.000}, -- #a57865ff
      quaternary = {r = 1.000, g = 0.395, b = 0.127, a = 1.000}, -- #ff6420ff
    }
  },
}