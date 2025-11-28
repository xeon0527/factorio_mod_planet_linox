---@diagnostic disable: assign-type-mismatch
local tint = {1.0, 0.5, 1.0};

local entity = table.deepcopy(data.raw["pump"]["pump"]);
entity.name = "linox-building_fluid-elevator";
entity.minable.result = "linox-building_fluid-elevator";
entity.fluid_box.volume = 6000 / 60;
entity.energy_source =
{
  type = "electric",
  usage_priority = "secondary-input",
  drain = "100kW"
};
entity.energy_usage = "900kW";
entity.pumping_speed = 6000 / 60;
entity.animations.north.tint = tint;
entity.animations.east.tint = tint;
entity.animations.south.tint = tint;
entity.animations.west.tint = tint;
entity.fluid_wagon_connector_speed = nil;
entity.fluid_wagon_connector_frame_count = nil;
entity.fluid_wagon_connector_alignment_tolerance = nil;
entity.fluid_wagon_connector_graphics = nil;
entity.icon = nil;
entity.icons = {{
  icon = "__base__/graphics/icons/pump.png",
  tint = tint,
}};
entity.tile_buildability_rules = {
  {
    area = {{-0.29, -0.9}, {0.29, 0.9}},
    required_tiles = {
      layers = {
        ["linox-collision-layer_terminal"] = true},
      }
  }
}



local entity_input = table.deepcopy(entity);
entity_input.name = "linox-building_fluid-elevator-input";
entity_input.hidden = true;
entity_input.fluid_box.pipe_connections = {
  {position = {0, -0.5}, direction = defines.direction.north, flow_direction = "output",  connection_type = "linked", linked_connection_id = 25702570},
  {position = {0, 0.5}, direction = defines.direction.south, flow_direction = "input", connection_type = "normal"},
};

local entity_output = table.deepcopy(entity);
entity_output.name = "linox-building_fluid-elevator-output";
entity_output.hidden = true;
entity_output.fluid_box.pipe_connections = {
  {position = {0, -0.5}, direction = defines.direction.north, flow_direction = "output", connection_type = "normal"},
  {position = {0, 0.5}, direction = defines.direction.south, flow_direction = "input",  connection_type = "linked", linked_connection_id = 25702570},
};

data:extend(
{
  entity,
  entity_input,
  entity_output,
})



local item = table.deepcopy(data.raw.item["pump"]);
item.name = "linox-building_fluid-elevator";
item.subgroup = "energy-pipe-distribution"
item.order = "b[pipe]-e[fluid-elevator]"
item.place_result = "linox-building_fluid-elevator";
item.stack_size = 10;
item.default_import_location = "linox-planet_linox";
item.weight = 10 * tons;
item.icon = nil;
item.icons = {{
  icon = "__base__/graphics/icons/pump.png",
  tint = tint,
}};

data:extend { item, }



local recipe = {
  type = "recipe",
  name = "linox-building_fluid-elevator",
  energy_required = 10,
  enabled = false,
  ingredients =
  {
    {type = "item", name = "tungsten-gear-wheel", amount = 25},
    {type = "item", name = "electronic-circuit", amount = 10},
    {type = "item", name = "iron-plate", amount = 10},
    {type = "item", name = "copper-plate", amount = 10},
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
  results = {{type="item", name="linox-building_fluid-elevator", amount=1}},
}

data:extend { recipe, }