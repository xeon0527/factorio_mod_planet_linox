local __entity_name = "linox-entity_fluid-elevator"
local __link_id = 25702570

local function __fluid_elevator_construct_event_proc(event)
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

  local entity_bak = {
    position = entity.position,
    direction = entity.direction,
    force = entity.force,
    last_user = entity.last_user,
  }
  entity.destroy();

  entity = surface_src.create_entity{
    name = __entity_name.."-input",
    position = entity_bak.position,
    direction = entity_bak.direction,
    force = entity_bak.force,
    player = entity_bak.last_user,
  };


  local entity_dst = surface_dst.find_entity(__entity_name.."-output", entity.position);
  if entity_dst == nil then
    entity_dst = surface_dst.create_entity{
      name = __entity_name.."-output",
      position = entity.position,
      direction = entity.direction,
      force = entity.force,
      player = entity.last_user,
    };
  end

  if entity_dst then
    entity.fluidbox.add_linked_connection(__link_id, entity_dst, __link_id);
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
  if (not entity.valid) or ((entity.name ~= __entity_name.."-input") and
      (entity.name ~= __entity_name.."-output")) then return end;

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

  local entity_dst_name = __entity_name.."-output";
  if entity.name == __entity_name.."-output" then
    entity_dst_name = __entity_name.."-input";
  end

  local entity_dst = surface_dst.find_entity(entity_dst_name, entity.position);
  if entity_dst then
    entity_dst.destroy();
  end
end

UTIL_create_event_handler(defines.events.on_player_mined_entity,  __fluid_elevator_deconstruct_event_proc);
UTIL_create_event_handler(defines.events.on_robot_mined_entity,   __fluid_elevator_deconstruct_event_proc);
UTIL_create_event_handler(defines.events.on_entity_died ,         __fluid_elevator_deconstruct_event_proc);