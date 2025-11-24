local tint = { 1.0, 0.66, 0.66 };
local speed_ratio = 4.0

local entity = table.deepcopy(data.raw["rocket-silo"]["rocket-silo"]);
entity.name = "linox-building_advanced-rocket-silo";

entity.crafting_speed = 1;
entity.module_slots = 6;
entity.rocket_entity = "linox-building_advanced-rocket-silo-rocket";
entity.minable = {mining_time = 1, result = "linox-building_advanced-rocket-silo"};

entity.base_day_sprite.tint = tint;
entity.base_front_sprite.tint = tint;
--entity.door_back_sprite.tint = tint;
--entity.door_front_sprite.tint = tint;

entity.door_opening_speed = (speed_ratio / (4.25 * 60));
entity.doors_sound.speed = speed_ratio;
entity.raise_rocket_sound.speed = speed_ratio;
entity.open_sound.speed = speed_ratio;
entity.close_sound.speed = speed_ratio;
entity.open_sound.speed = speed_ratio;
entity.close_sound.speed = speed_ratio;
entity.alarm_sound = nil;
entity.quick_alarm_sound = nil;

entity.icon = nil;
entity.icons = {{
  icon = "__base__/graphics/icons/rocket-silo.png",
  tint = tint,
}};

data:extend{ entity, }

local entity2 = table.deepcopy(data.raw["rocket-silo-rocket"]["rocket-silo-rocket"]);
entity2.name = "linox-building_advanced-rocket-silo-rocket";

entity2.rising_speed = speed_ratio / (7 * 60);
entity2.engine_starting_speed = speed_ratio / (5.5 * 60);
entity2.flying_speed = speed_ratio / (2000 * 60);
entity2.flying_acceleration = 0.04;

entity2.rocket_sprite.layers[1].tint = tint;
entity2.flying_sound.speed = 4.0;

data:extend{ entity2, }



local item = table.deepcopy(data.raw["item"]["rocket-silo"]);
item.name = "linox-building_advanced-rocket-silo";
item.order = "z-aa"
item.icon = nil;
item.icons = {{
  icon = "__base__/graphics/icons/rocket-silo.png",
  tint = tint,
}};
item.place_result = "linox-building_advanced-rocket-silo";
item.weight = 1 * tons;

data:extend { item, }



data:extend {
  {
    type = "recipe",
    name = "linox-building_advanced-rocket-silo",
    enabled = false,
    category = "metallurgy",
    ingredients =
    {
      {type = "item", name = "rocket-silo", amount = 1},
      {type = "item", name = "refined-concrete", amount = 1000},
      {type = "item", name = "tungsten-gear-wheel", amount = 1000},
      {type = "item", name = "tungsten-carbide", amount = 500},
      {type = "item", name = "samarium", amount = 100}
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
    energy_required = 240,
    results = {{type="item", name="linox-building_advanced-rocket-silo", amount=1}},
    requester_paste_multiplier = 1
  },
}