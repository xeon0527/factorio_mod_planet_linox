local function __fluid_elevator_construct_event_proc(event)
  local entity = event.entity or event.destination
  if (not (entity and entity.valid)) or (entity.type == "entity-ghost") or
      (entity.name ~= "linox-entity_fluid-elevator") then return end

  local surface = entity.surface;
  local dst_surface = nil;
  if surface.name == "linox-planet_linox" then
    dst_surface = UTIL_ensure_surface("linox-surface_linox-installation");
  elseif surface.name == "linox-surface_linox-installation" then
    dst_surface = UTIL_ensure_surface("linox-planet_linox");
  else
    return;
  end

  local entity_bak = {
    position = entity.position,
    direction = entity.direction,
    force = entity.force,
    last_user = entity.last_user,
  }
  entity.destroy();

  entity = surface.create_entity{
    name = "linox-entity_fluid-elevator-input",
    position = entity_bak.position,
    direction = entity_bak.direction,
    force = entity_bak.force,
    player = entity_bak.last_user,
  };


  local dst_entity = dst_surface.find_entity("linox-entity_fluid-elevator-output", entity.position);
  if dst_entity == nil then
    dst_entity = dst_surface.create_entity{
      name = "linox-entity_fluid-elevator-output",
      position = entity.position,
      direction = entity.direction,
      force = entity.force,
      player = entity.last_user,
    };
  end

  if dst_entity then
    entity.fluidbox.add_linked_connection(25702570, dst_entity, 25702570);
  end
end

UTIL_create_event_handler(defines.events.on_built_entity,                __fluid_elevator_construct_event_proc);
UTIL_create_event_handler(defines.events.on_robot_built_entity,          __fluid_elevator_construct_event_proc);
UTIL_create_event_handler(defines.events.script_raised_built,            __fluid_elevator_construct_event_proc);
UTIL_create_event_handler(defines.events.script_raised_revive,           __fluid_elevator_construct_event_proc);
UTIL_create_event_handler(defines.events.on_space_platform_built_entity, __fluid_elevator_construct_event_proc);
UTIL_create_event_handler(defines.events.on_entity_cloned,               __fluid_elevator_construct_event_proc);

local function __fluid_elevator_deconstruct_event_proc(event)
  local entity = event.entity;
  if (not entity.valid) or ((entity.name ~= "linox-entity_fluid-elevator-input") and
      (entity.name ~= "linox-entity_fluid-elevator-output")) then return end;

  local surface = entity.surface;
  local dst_surface = nil;
  if surface.name == "linox-planet_linox" then
    dst_surface = UTIL_ensure_surface("linox-surface_linox-installation");
  elseif surface.name == "linox-surface_linox-installation" then
    dst_surface = UTIL_ensure_surface("linox-planet_linox");
  else
    return;
  end

  local dst_entity_name = "linox-entity_fluid-elevator-output";
  if entity.name == "linox-entity_fluid-elevator-output" then
    dst_entity_name = "linox-entity_fluid-elevator-input";
  end

  local dst_entity = dst_surface.find_entity(dst_entity_name, entity.position);
  if dst_entity then
    dst_entity.destroy();
  end
end

UTIL_create_event_handler(defines.events.on_player_mined_entity,  __fluid_elevator_deconstruct_event_proc);
UTIL_create_event_handler(defines.events.on_robot_mined_entity,   __fluid_elevator_deconstruct_event_proc);
UTIL_create_event_handler(defines.events.on_entity_died ,         __fluid_elevator_deconstruct_event_proc);