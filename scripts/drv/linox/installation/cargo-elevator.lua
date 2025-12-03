---@diagnostic disable: assign-type-mismatch

local drv_events = require("scripts.drv.events")

local __entity_name = "linox-building_cargo-elevator"

local function __draw_error(surface, position, up)
  local mark_entity = surface.create_entity {
    name = "linox-hidden_cargo-elevator-point",
    position = position,
  }

  local sprite_name =  "linox-sprite_cargo-down-icon"
  if up then
    sprite_name =  "linox-sprite_cargo-up-icon"
  end

  --rendering.draw_rectangle{
  --  color = {1, 1, 1},
  --  left_top = { 
  --    -(0.5 - 0.0625) + position.x,
  --    -(0.5 - 0.0625) + position.y,
  --  },
  --  right_bottom = {
  --    (0.5 - 0.0625) + position.x,
  --    (0.5 - 0.0625) + position.y,
  --  },
  --  width = 3,
  --  surface = surface,
  --  target = mark_entity,
  --}.bring_to_front()
--
  --rendering.draw_rectangle{
  --  color = {1, 0, 0},
  --  left_top = { 
  --    -(0.5 - 0.0625) + position.x,
  --    -(0.5 - 0.0625) + position.y,
  --  },
  --  right_bottom = {
  --    (0.5 - 0.0625) + position.x,
  --    (0.5 - 0.0625) + position.y,
  --  },
  --  width = 3,
  --  surface = surface,
  --  target = mark_entity,
  --  blink_interval = 30,
  --}.bring_to_front()

  rendering.draw_sprite{
    sprite = "linox-sprite_cargo-frame-icon",
    x_scale = 0.5,
    y_scale = 0.5,
    tint = {0.5, 0.5, 0.5, 0.5},
    surface = surface,
    target = mark_entity,
  }.bring_to_front()

  rendering.draw_sprite{
    sprite = "linox-sprite_cargo-frame-icon",
    x_scale = 0.5,
    y_scale = 0.5,
    tint = {0.75, 0, 0, 0.5},
    surface = surface,
    target = mark_entity,
    blink_interval = 30,
  }.bring_to_front()

  rendering.draw_sprite{
    sprite = sprite_name,
    x_scale = 0.4,
    y_scale = 0.4,
    tint = {0.5, 0.5, 0.5, 0.5},
    surface = surface,
    target = mark_entity,
  }.bring_to_front()

  rendering.draw_sprite{
    sprite = sprite_name,
    x_scale = 0.4,
    y_scale = 0.4,
    tint = {0.75, 0, 0, 0.5},
    surface = surface,
    target = mark_entity,
    blink_interval = 30,
  }.bring_to_front()
end

local function __remove_error(surface, position)
  local entity = surface.find_entity("linox-hidden_cargo-elevator-point", position);
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

  local up = (surface_src.name == __LINOX_SURFACE__.ground) == (entity.linked_belt_type == "output")

  local entity_dst = surface_dst.find_entity(__entity_name, entity.position);
  if entity_dst == nil then
    __draw_error(surface_src, entity.position, up)
    __draw_error(surface_dst, entity.position, up)
  else
    __remove_error(surface_src, entity.position)
    __remove_error(surface_dst, entity.position)

    if entity_dst.linked_belt_type == "input" then
      entity.linked_belt_type = "output";
    else
      entity.linked_belt_type = "input";
    end
    entity.connect_linked_belts(entity_dst);
    entity_dst.connect_linked_belts(entity);
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

  --entity.disconnect_linked_belts();

  local entity_dst = surface_dst.find_entity(__entity_name, entity.position);
  if entity_dst then
    local up = (surface_dst.name == __LINOX_SURFACE__.ground) == (entity_dst.linked_belt_type == "output")
    entity_dst.disconnect_linked_belts();
    __draw_error(surface_src, entity.position, up)
    __draw_error(surface_dst, entity.position, up)
  else
    __remove_error(surface_src, entity.position)
    __remove_error(surface_dst, entity.position)
  end
end)