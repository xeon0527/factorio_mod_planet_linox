local tint = { 1.0, 0.66, 0.66 };

local entity = table.deepcopy(data.raw["rocket-silo"]["rocket-silo"]);
entity.name = "linox-entity_advanced-rocket-silo";

entity.crafting_speed = 1;
entity.to_be_inserted_to_rocket_inventory_size = 1;
entity.module_slots = 6;
entity.rocket_entity = "linox-entity_advanced-rocket-silo-rocket";
entity.minable = {mining_time = 1, result = "linox-item_advanced-rocket-silo"};

entity.base_day_sprite.tint = tint;
entity.base_front_sprite.tint = tint;
--entity.door_back_sprite.tint = tint;
--entity.door_front_sprite.tint = tint;

entity.door_opening_speed = (4 / (4.25 * 60));
entity.doors_sound.speed = 4.0;
entity.raise_rocket_sound.speed = 4.0;
entity.open_sound.speed = 4.0;
entity.close_sound.speed = 4.0;
entity.open_sound.speed = 4.0;
entity.close_sound.speed = 4.0;
entity.alarm_sound = nil;
entity.quick_alarm_sound = nil;

entity.icon = nil;
entity.icons = {{
  icon = "__base__/graphics/icons/rocket-silo.png",
  tint = tint,
}};

data:extend{ entity, }




local entity2 = table.deepcopy(data.raw["rocket-silo-rocket"]["rocket-silo-rocket"]);
entity2.name = "linox-entity_advanced-rocket-silo-rocket";

entity2.rising_speed = 4 / (7 * 60);
entity2.engine_starting_speed = 4 / (5.5 * 60);
entity2.flying_speed = 4 / (2000 * 60);
entity2.flying_acceleration = 0.04;

entity2.rocket_sprite.layers[1].tint = tint;
entity2.flying_sound.speed = 4.0;

data:extend{ entity2, }