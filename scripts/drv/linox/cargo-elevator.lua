local function __cargo_elevator_construct_event_proc(event)
  local entity = event.entity or event.destination
  if (not (entity and entity.valid)) or (entity.type == "entity-ghost") or
      (entity.name ~= "linox-entity_cargo-elevator") then return end

  local surface = entity.surface;
  local dst_surface = nil;
  if surface.name == "linox-planet_linox" then
    dst_surface = UTIL_ensure_surface("linox-surface_linox-installation");
  elseif surface.name == "linox-surface_linox-installation" then
    dst_surface = UTIL_ensure_surface("linox-planet_linox");
  else
    return;
  end

  local dst_entity = dst_surface.find_entity("linox-entity_cargo-elevator", entity.position);
  if dst_entity == nil then
    dst_entity = dst_surface.create_entity{
      name = "linox-entity_cargo-elevator",
      position = entity.position,
      direction = UTIL_get_reverse_direction(entity.direction),
      force = entity.force,
      player = entity.last_user,
    };
  else
    dst_entity.disconnect_linked_belts();
  end

  if dst_entity then
    if entity.linked_belt_type == "input" then
      dst_entity.linked_belt_type = "output";
    else
      dst_entity.linked_belt_type = "input";
    end
    entity.connect_linked_belts(dst_entity);
    dst_entity.connect_linked_belts(entity);
  end
end

UTIL_create_event_handler(defines.events.on_built_entity,                __cargo_elevator_construct_event_proc);
UTIL_create_event_handler(defines.events.on_robot_built_entity,          __cargo_elevator_construct_event_proc);
UTIL_create_event_handler(defines.events.script_raised_built,            __cargo_elevator_construct_event_proc);
UTIL_create_event_handler(defines.events.script_raised_revive,           __cargo_elevator_construct_event_proc);
UTIL_create_event_handler(defines.events.on_space_platform_built_entity, __cargo_elevator_construct_event_proc);
UTIL_create_event_handler(defines.events.on_entity_cloned,               __cargo_elevator_construct_event_proc);

local function __cargo_elevator_deconstruct_event_proc(event)
  local entity = event.entity;
  if (not entity.valid) or (entity.name ~= "linox-entity_cargo-elevator") then return end;

  local surface = entity.surface;
  local dst_surface = nil;
  if surface.name == "linox-planet_linox" then
    dst_surface = UTIL_ensure_surface("linox-surface_linox-installation");
  elseif surface.name == "linox-surface_linox-installation" then
    dst_surface = UTIL_ensure_surface("linox-planet_linox");
  else
    return;
  end

  local dst_entity = dst_surface.find_entity("linox-entity_cargo-elevator", entity.position);
  if dst_entity then
    dst_entity.destroy();
  end
end

UTIL_create_event_handler(defines.events.on_player_mined_entity,  __cargo_elevator_deconstruct_event_proc);
UTIL_create_event_handler(defines.events.on_robot_mined_entity,   __cargo_elevator_deconstruct_event_proc);
UTIL_create_event_handler(defines.events.on_entity_died ,         __cargo_elevator_deconstruct_event_proc);