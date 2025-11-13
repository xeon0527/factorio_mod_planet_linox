---@diagnostic disable: assign-type-mismatch
local tint = {1.0, 0.5, 1.0};

local entity_fluid_elevator = table.deepcopy(data.raw["pump"]["pump"]);
entity_fluid_elevator.name = "linox-entity_fluid-elevator";
entity_fluid_elevator.minable.result = "linox-item_fluid-elevator";
entity_fluid_elevator.fluid_box.volume = 6000 / 60;
entity_fluid_elevator.energy_source =
{
  type = "electric",
  usage_priority = "secondary-input",
  drain = "500kW"
};
entity_fluid_elevator.energy_usage = "4.5MW";
entity_fluid_elevator.pumping_speed = 6000 / 60;
entity_fluid_elevator.animations.north.tint = tint;
entity_fluid_elevator.animations.east.tint = tint;
entity_fluid_elevator.animations.south.tint = tint;
entity_fluid_elevator.animations.west.tint = tint;
entity_fluid_elevator.fluid_wagon_connector_speed = nil;
entity_fluid_elevator.fluid_wagon_connector_frame_count = nil;
entity_fluid_elevator.fluid_wagon_connector_alignment_tolerance = nil;
entity_fluid_elevator.fluid_wagon_connector_graphics = nil;
entity_fluid_elevator.icon = nil;
entity_fluid_elevator.icons = {{
  icon = "__base__/graphics/icons/pump.png",
  tint = tint,
}};

local entity_fluid_elevator_input = table.deepcopy(entity_fluid_elevator);
entity_fluid_elevator_input.name = "linox-entity_fluid-elevator-input";
entity_fluid_elevator_input.hidden = true;
entity_fluid_elevator_input.fluid_box.pipe_connections = {
  {position = {0, -0.5}, direction = defines.direction.north, flow_direction = "output",  connection_type = "linked", linked_connection_id = 25702570},
  {position = {0, 0.5}, direction = defines.direction.south, flow_direction = "input", connection_type = "normal"},
};

local entity_fluid_elevator_output = table.deepcopy(entity_fluid_elevator);
entity_fluid_elevator_output.name = "linox-entity_fluid-elevator-output";
entity_fluid_elevator_output.hidden = true;
entity_fluid_elevator_output.fluid_box.pipe_connections = {
  {position = {0, -0.5}, direction = defines.direction.north, flow_direction = "output", connection_type = "normal"},
  {position = {0, 0.5}, direction = defines.direction.south, flow_direction = "input",  connection_type = "linked", linked_connection_id = 25702570},
};

data:extend(
{
  entity_fluid_elevator,
  entity_fluid_elevator_input,
  entity_fluid_elevator_output,
})