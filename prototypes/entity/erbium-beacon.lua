local item_sounds = require("__base__.prototypes.item_sounds")

local entity = table.deepcopy(data.raw["beacon"]["beacon"]);
entity.name = "linox-building_erbium-beacon"
entity.icon = "__space-exploration-graphics__/graphics/icons/wide-beacon.png"
entity.icon_size = 64
entity.minable = {mining_time = 0.2, result = "linox-building_erbium-beacon"}
entity.module_slots = 4
entity.graphics_set = nil
entity.animation = {
  layers = {
    {
      animation_speed = 0.5,
      filename = "__space-exploration-graphics-4__/graphics/entity/wide-beacon/wide-beacon.png",
      frame_count = 32,
      width = 256,
      height = 320,
      line_length = 8,
      shift = { 0, -0.25 },
      scale = 0.33,
    },
    {
      draw_as_shadow = true,
      animation_speed = 0.5,
      filename = "__space-exploration-graphics-4__/graphics/entity/wide-beacon/wide-beacon-shadow.png",
      frame_count = 32,
      width = 330,
      height = 174,
      line_length = 4,
      shift = { 0.38, 0.36+4/32 },
      scale = 0.33,
    },
  }
}
entity.water_reflection = nil

data.raw["beacon"]["beacon"].next_upgrade = "linox-building_erbium-beacon"

data:extend {
  entity,
  {
    type = "item",
    name = "linox-building_erbium-beacon",
    icon = "__space-exploration-graphics__/graphics/icons/wide-beacon.png",
    subgroup = "module",
    order = "a[beacon]",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    place_result = "linox-building_erbium-beacon",
    default_import_location = "linox-planet_linox",
    stack_size = 20,
    weight = 50 * kg,
  },

  {
    type = "recipe",
    name = "linox-building_erbium-beacon",
    enabled = false,
    energy_required = 15,
    ingredients =
    {
      {type = "item", name = "beacon", amount = 1},
      {type = "item", name = "erbium-powder", amount = 4},
    },
    --surface_conditions = {
    --  {
    --    property = "magnetic-field",
    --    min = 1600,
    --    max = 1600,
    --  },
    --  {
    --    property = "gravity",
    --    min = 2,
    --    max = 2
    --  }
    --},
    results = {{type="item", name="linox-building_erbium-beacon", amount=1}}
  },
}