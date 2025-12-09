local item_sounds = require("__base__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")

local tint = { 222, 232, 107 }

local entity = table.deepcopy(data.raw["logistic-robot"]["logistic-robot"]);
entity.name = "linox_samarium-logistic-robot"
entity.icon = nil
entity.icons = {{
  icon = "__base__/graphics/icons/logistic-robot.png",
  tint = tint,
}}
entity.minable = {mining_time = 0.1, result = "linox_samarium-logistic-robot"}
entity.resistances =
{
  {
    type = "fire",
    percent = 100,
  },
  {
    type = "electric",
    percent = 50,
  }
}
entity.max_health = 200
entity.speed = 0.15
--entity.max_energy = "2.0MJ"
--entity.energy_per_tick = "0.25kJ"
--entity.speed_multiplier_when_out_of_energy = 1.0
--entity.energy_per_move = "25kJ"
entity.idle.tint = tint
entity.idle_with_cargo.tint = tint
entity.in_motion.tint = tint
entity.in_motion_with_cargo.tint = tint

data:extend { entity };

data:extend {
  {
    type = "item",
    name = "linox_samarium-logistic-robot",
    icons = {{
      icon = "__base__/graphics/icons/logistic-robot.png",
      tint = tint,
    }},
    subgroup = "logistic-network",
    order = "a[robot]-aa",
    inventory_move_sound = item_sounds.robotic_inventory_move,
    pick_sound = item_sounds.robotic_inventory_pickup,
    drop_sound = item_sounds.robotic_inventory_move,
    place_result = "linox_samarium-logistic-robot",
    stack_size = 50,
    random_tint_color = item_tints.iron_rust
  },

  {
    type = "recipe",
    name = "linox_samarium-logistic-robot",
    enabled = false,
    ingredients =
    {
      {type = "item", name = "logistic-robot", amount = 1},
      {type = "item", name = "samarium", amount = 1}
    },
    results = {{type="item", name="linox_samarium-logistic-robot", amount=1}}
  },
}