---@diagnostic disable: assign-type-mismatch
local tint = {1.0, 0.66, 0.66};

local entity = table.deepcopy(data.raw["pump"]["pump"]);
entity.name = "linox-entity_turbo-pump";
entity.minable.result = "linox-item_turbo-pump";
entity.fluid_box.volume = 6000 / 60;
entity.energy_source =
{
  type = "electric",
  usage_priority = "secondary-input",
  drain = "10kW"
};
entity.energy_usage = "490kW";
entity.pumping_speed = 6000 / 60;
entity.animations.north.tint = tint;
entity.animations.east.tint = tint;
entity.animations.south.tint = tint;
entity.animations.west.tint = tint;
entity.icon = nil;
entity.icons = {{
  icon = "__base__/graphics/icons/pump.png",
  tint = tint,
}};

data:extend { entity };