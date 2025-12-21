local item_sounds = require("__base__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")

local __MODULE__ = {}

__MODULE__.data = function()
  if mods["multi_surface_promethium_plate_recipe"] then
    data:extend {
      {
        type = "item",
        name = "msppr-linox",
        icon = "__space-exploration-graphics__/graphics/icons/naquium-ore-crushed.png",
        icon_size = 64,
        subgroup = "msppr",
        inventory_move_sound = item_sounds.sulfur_inventory_move,
        pick_sound = item_sounds.resource_inventory_pickup,
        drop_sound = item_sounds.sulfur_inventory_move,
        stack_size = 100,
        weight = 1 * kg,
        random_tint_color = item_tints.iron_rust,
      },
      {
        type = "recipe",
        name = "msppr-linox",
        subgroup = "science-pack",
        category = "linox-recipe-category_sintering",
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
        enabled = false,
        ingredients = {
            { type = "item", name = "dysprosium-powder", amount = 1 },
            { type = "item", name = "samarium", amount = 1 },
            { type = "item", name = "erbium-powder", amount = 1 },
            { type = "item", name = "neodymium-permanent-magnet", amount = 1 },
        },
        energy_required = 5,
        msppr = {
            result = { type = "item", name = "msppr-linox", amount = 1 },
            recipe_chain_order = "vulcanus",
        },
        results = { { type = "item", name = "msppr-linox", amount = 1 } },
        allow_productivity = false,
        auto_recycle = false,
    },
    }


    
  end
end

return __MODULE__