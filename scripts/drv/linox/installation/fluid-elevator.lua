---@diagnostic disable: assign-type-mismatch

local drv_events = require("scripts.drv.events")

local __entity_name = "linox-building_fluid-elevator"
local __link_id = 0

local function __draw_error(surface, position)
  local mark_entity = surface.create_entity {
    name = "linox-hidden_fluid-elevator-point",
    position = position,
  }

  rendering.draw_circle{
    color = {0.5, 0.5, 0.5, 0.5},
    radius = 0.5 - 0.0625,
    width = 3,
    surface = surface,
    target = mark_entity,
  }.bring_to_front()

  rendering.draw_circle{
    color = {0.75, 0, 0, 0.5},
    radius = 0.5 - 0.0625,
    width = 3,
    surface = surface,
    target = mark_entity,
    blink_interval = 30,
  }.bring_to_front()

  rendering.draw_sprite{
    sprite = "linox-sprite_liquid-icon",
    x_scale = 0.4,
    y_scale = 0.4,
    tint = {0.5, 0.5, 0.5, 0.5},
    surface = surface,
    target = mark_entity,
  }.bring_to_front()

  rendering.draw_sprite{
    sprite = "linox-sprite_liquid-icon",
    x_scale = 0.4,
    y_scale = 0.4,
    tint = {0.75, 0, 0, 0.5},
    surface = surface,
    target = mark_entity,
    blink_interval = 30,
  }.bring_to_front()
end

local function __remove_error(surface, position)
  local entity = surface.find_entity("linox-hidden_fluid-elevator-point", position);
  if entity then
    entity.destroy()
  end
end

drv_events.create_build_entity_handler(function(event)
  if event.is_ghost or event.entity_name ~= __entity_name then return true end

  local entity = event.entity
  local surface_src = entity.surface
  local surface_dst = nil
  if surface_src.name ~= __LINOX_SURFACE__.ground and surface_src.name ~= __LINOX_SURFACE__.facility then return true end
  
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
    __draw_error(surface_src, entity.position)
    __draw_error(surface_dst, entity.position)
  else
    __remove_error(surface_src, entity.position)
    __remove_error(surface_dst, entity.position)
    entity.fluidbox.add_linked_connection(__link_id, entity_dst, __link_id);
  end
end)


drv_events.create_destroy_entity_handler(function(event)
  if event.entity.name ~= __entity_name then return end
  local entity = event.entity
  local surface_src = entity.surface
  local surface_dst = nil
  if surface_src.name ~= __LINOX_SURFACE__.ground and surface_src.name ~= __LINOX_SURFACE__.facility then return end

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
    entity.fluidbox.remove_linked_connection(__link_id)
    __draw_error(surface_src, entity.position)
    __draw_error(surface_dst, entity.position)
  else
    __remove_error(surface_src, entity.position)
    __remove_error(surface_dst, entity.position)
  end
end)