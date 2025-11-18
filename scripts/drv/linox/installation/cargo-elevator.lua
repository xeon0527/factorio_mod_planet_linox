local __entity_name = "linox-entity_cargo-elevator"

local function __cargo_elevator_construct_event_proc(event)
  local entity = event.entity or event.destination
  if (not (entity and entity.valid)) or (entity.type == "entity-ghost") or
      (entity.name ~= __entity_name) then return end

  local surface_src = entity.surface
  local surface_dst = nil
  if surface_src.name == __LINOX_SURFACE__.ground then
    surface_dst = game.get_surface(__LINOX_SURFACE__.facility)
  elseif surface_src.name == __LINOX_SURFACE__.facility then
    surface_dst = game.get_surface(__LINOX_SURFACE__.ground)
  else
    return
  end

  if not surface_dst then return end

  local entity_dst = surface_dst.find_entity(__entity_name, entity.position);
  if entity_dst == nil then
    entity_dst = surface_dst.create_entity{
      name = __entity_name,
      position = entity.position,
      direction = UTIL_get_reverse_direction(entity.direction),
      force = entity.force,
      player = entity.last_user,
    };
  else
    entity_dst.disconnect_linked_belts();
  end

  if entity_dst then
    if entity.linked_belt_type == "input" then
      entity_dst.linked_belt_type = "output";
    else
      entity_dst.linked_belt_type = "input";
    end
    entity.connect_linked_belts(entity_dst);
    entity_dst.connect_linked_belts(entity);
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
  if (not entity.valid) or (entity.name ~= __entity_name) then return end;

  local surface_src = entity.surface
  local surface_dst = nil
  if surface_src.name == __LINOX_SURFACE__.ground then
    surface_dst = game.get_surface(__LINOX_SURFACE__.facility)
  elseif surface_src.name == __LINOX_SURFACE__.facility then
    surface_dst = game.get_surface(__LINOX_SURFACE__.ground)
  else
    return
  end

  if not surface_dst then return end

  local entity_dst = surface_dst.find_entity(__entity_name, entity.position);
  if entity_dst then
    entity_dst.destroy();
  end
end

UTIL_create_event_handler(defines.events.on_player_mined_entity,  __cargo_elevator_deconstruct_event_proc);
UTIL_create_event_handler(defines.events.on_robot_mined_entity,   __cargo_elevator_deconstruct_event_proc);
UTIL_create_event_handler(defines.events.on_entity_died ,         __cargo_elevator_deconstruct_event_proc);