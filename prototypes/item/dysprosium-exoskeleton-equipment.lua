local item_sounds = require("__base__.prototypes.item_sounds")
local tint = {175,175,0}

data:extend {
  {
    type = "movement-bonus-equipment",
    name = "dysprosium-exoskeleton-equipment",
    sprite =
    {
      filename = "__base__/graphics/equipment/exoskeleton-equipment.png",
      width = 128,
      height = 256,
      priority = "medium",
      scale = 0.5,
      tint = tint,
    },
    shape =
    {
      width = 2,
      height = 4,
      type = "full"
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    energy_consumption = "100kW",
    movement_bonus = 0.5,
    categories = {"armor"}
  },

  {
    type = "item",
    name = "dysprosium-exoskeleton-equipment",
    icons = {
      {
        icon = "__base__/graphics/icons/exoskeleton-equipment.png",
        tint = tint,
      },
    },
    place_as_equipment_result = "dysprosium-exoskeleton-equipment",
    subgroup = "utility-equipment",
    order = "d[exoskeleton]-a[exoskeleton-equipment]",
    inventory_move_sound = item_sounds.exoskeleton_inventory_move,
    pick_sound = item_sounds.exoskeleton_inventory_pickup,
    drop_sound = item_sounds.exoskeleton_inventory_move,
    stack_size = 20
  },

  {
    type = "recipe",
    name = "dysprosium-exoskeleton-equipment",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {type = "item", name = "exoskeleton-equipment", amount = 1},
      {type = "item", name = "electric-engine-unit", amount = 15},
      {type = "item", name = "tungsten-plate", amount = 10},
      {type = "item", name = "tungsten-gear-wheel", amount = 10},
      {type = "item", name = "tungsten-stick", amount = 10},
      {type = "item", name = "dysprosium-powder", amount = 5},
    },
    results = {{type="item", name="dysprosium-exoskeleton-equipment", amount=1}}
  },
}