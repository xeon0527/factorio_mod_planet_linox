local item_sounds = require("__base__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")

data:extend {
  {
    type = "tool",
    name = "linox-item_lava-data-card",
    localised_description = {"item-description.linox-item_lava-data-card"},
    icon = "__space-exploration-graphics__/graphics/icons/data/hot-thermodynamics.png",
    subgroup = "science-pack",
    color_hint = { text = "L" },
    order = "la",
    inventory_move_sound = item_sounds.science_inventory_move,
    pick_sound = item_sounds.science_inventory_pickup,
    drop_sound = item_sounds.science_inventory_move,
    stack_size = 200,
    weight = 1 * kg,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value",
    random_tint_color = item_tints.bluish_science
  },
}



local recipe = {
  type = "recipe",
  name = "linox-item_lava-data-card",
  category = "crafting-with-fluid",
  energy_required = 5,
  enabled = false,
  ingredients =
  {
    {type = "item", name = "linox-item_tungsten-gear-wheel", amount = 5},
    {type = "item", name = "linox-item_tungsten-stick", amount = 10},
    {type = "fluid", name = "lava", amount = 50},
  },
  surface_conditions =
    {
      {
        property = "magnetic-field",
        min = 1600,
        max = 1600,
      },
      {
        property = "gravity",
        min = 2,
        max = 2
      }
    },
  results = {{type="item", name="linox-item_lava-data-card", amount=1}},
}

data:extend { recipe, }