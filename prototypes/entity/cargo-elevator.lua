
local ref_belt = data.raw["underground-belt"]["turbo-underground-belt"];

local entity = table.deepcopy(data.raw["linked-belt"]["linked-belt"]);
entity.name = "linox-entity_cargo-elevator";
entity.hidden = false;
entity.minable.result = "linox-item_cargo-elevator";
entity.fast_replaceable_group = "transport-belt";
entity.next_upgrade = nil;
entity.belt_animation_set = ref_belt.belt_animation_set;
entity.speed = ref_belt.speed;

data:extend{ entity, }