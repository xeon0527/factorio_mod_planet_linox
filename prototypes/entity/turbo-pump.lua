---@diagnostic disable: assign-type-mismatch
local tint = {1.0, 0.66, 0.66};

local entity = table.deepcopy(data.raw["pump"]["pump"]);
entity.name = "linox-building_turbo-pump";
entity.minable.result = "linox-building_turbo-pump";
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



local item = table.deepcopy(data.raw.item["pump"])
item.name = "linox-building_turbo-pump"
item.subgroup = "energy-pipe-distribution"
item.order = "b[pipe]-d[turbo-pump]"
item.place_result = "linox-building_turbo-pump"
item.stack_size = 50
item.default_import_location = "linox-planet_linox"
item.weight = 20 * kg
item.icon = nil
item.icons = {{
  icon = "__base__/graphics/icons/pump.png",
  tint = tint,
}};

data:extend { item, }



local recipe = {
  type = "recipe",
  name = "linox-building_turbo-pump",
  energy_required = 3,
  enabled = false,
  ingredients =
  {
    {type = "item", name = "pump", amount = 1},
    {type = "item", name = "pipe", amount = 5},
    {type = "item", name = "tungsten-carbide", amount = 2},
    {type = "item", name = "tungsten-gear-wheel", amount = 5},
    {type = "item", name = "samarium", amount = 1},
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
  results = {{type="item", name="linox-building_turbo-pump", amount=1}}
}

data:extend { recipe, }