local item_sounds = require("__base__.prototypes.item_sounds")

local entity = table.deepcopy(data.raw["furnace"]["electric-furnace"]);

entity.name = "linox-building_sintering-machine"
entity.minable = {mining_time = 0.2, result = "linox-building_sintering-machine"}
entity.icon = "__linox__/graphics/icons/sintering-machine.png"
entity.collision_box = {{-1.8, -1.8}, {1.8, 1.8}}
entity.selection_box = {{-2, -2}, {2, 2}}
entity.crafting_speed = 1
entity.crafting_categories = { "linox-recipe-category_sintering-machine" }

entity.module_slots = 4

entity.energy_usage = "10kJ"
entity.energy_source =
{
  type = "electric",
  usage_priority = "secondary-input",
  drain = "50kW"
};

entity.graphics_set = {
  animation = {
    layers = {
      util.sprite_load("__linox__/graphics/entity/sintering-machine/glass-furnace-hr-animation", {
        animation_speed = 1,
        frame_count = 80,
        scale = 0.48,
        shift = util.by_pixel(0, -12),
      }),
      {
        filename = "__linox__/graphics/entity/sintering-machine/glass-furnace-hr-shadow.png",
        animation_speed = 1,
        width = 500,
        height = 350,
        scale = 0.48,
        frame_count = 1,
        repeat_count = 80,
        draw_as_shadow = true,
        shift = util.by_pixel(0, -12),
      },
    }
  },
  working_visualisations = {
    {
      animation = {
        layers = {
          util.sprite_load("__linox__/graphics/entity/sintering-machine/glass-furnace-hr-emission1", {
            animation_speed = 1,
            frame_count = 80,
            scale = 0.48,
            draw_as_glow = true,
            blend_mode = "additive",
            shift = util.by_pixel(0, -12),
          }),
          util.sprite_load("__linox__/graphics/entity/sintering-machine/glass-furnace-hr-emission2", {
            animation_speed = 1,
            frame_count = 80,
            scale = 0.48,
            draw_as_glow = true,
            blend_mode = "additive",
            shift = util.by_pixel(0, -12),
          }),
        }
      }
    }
  }
}

data:extend { entity, }



data:extend {
  {
    type = "item",
    name = "linox-building_sintering-machine",
    icon = "__linox__/graphics/icons/sintering-machine.png",
    icon_size = 64,
    stack_size = 20,
    weight = 50 * kg,
    place_result = "linox-building_sintering-machine",
    subgroup = "smelting-machine",
    order = "ca",
    inventory_move_sound = item_sounds.electric_large_inventory_move,
    pick_sound = item_sounds.electric_large_inventory_pickup,
    drop_sound = item_sounds.electric_large_inventory_move,
    default_import_location = "linox-planet_linox",
  },
}

data:extend {
  {
    type = "recipe",
    name = "linox-building_sintering-machine",
    energy_required = 5,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "electronic-circuit", amount = 10},
      {type = "item", name = "tungsten-plate", amount = 10},
      {type = "item", name = "steel-plate", amount = 10},
      {type = "item", name = "tungsten-gear-wheel", amount = 10},
      {type = "item", name = "tungsten-stick", amount = 10},
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
    results = {{type="item", name="linox-building_sintering-machine", amount=1}}
  },
}