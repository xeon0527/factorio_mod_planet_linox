require("scripts.util.event-handler")

function UTIL_find_gui_element(parent, element_name)
  for _, child in pairs(parent.children) do
    if child.name == element_name then
      return child;
    else
      local child_child = UTIL_find_gui_element(child, element_name)
      if child_child ~= nil then
        return child_child;
      end
    end
  end

  return nil;
end

function UTIL_ensure_object_path(root, path)
  local current = root
  for part in path:gmatch("[^%.]+") do
    if type(current[part]) ~= 'table' then
      if not current[part] then
        current[part] = {}
      end
    end
    current = current[part]
  end
  return current
end

function UTIL_ensure_surface(name)
  local surface = game.get_surface(name)
  if surface == nil then
    if game.planets[name] then
      surface = game.planets[name].create_surface()
    else
      surface = game.create_surface(name);
    end
  end
  return surface;
end

function UTIL_ensure_entity(surface, create_entity_param)
  local entity = nil
  if surface and create_entity_param and create_entity_param.name then
    if not create_entity_param.position then
      create_entity_param.position = {0,0}
    end

    if not create_entity_param.force then
      create_entity_param.force = "player"
    end

    entity = surface.find_entity(create_entity_param.name, create_entity_param.position);
    if not entity then
      entity = surface.create_entity(create_entity_param)
    end
  end
  return entity
end

function UTIL_insert_item(entity, items)
  for _, item in pairs(items) do
    local num_item = entity.insert(item);
    if item.count > num_item then
      entity.surface.spill_item_stack {
        position = entity.position,
        enable_looted = true,
        stack = {
          name = item.name;
          count = item.count - num_item,
          quality = (type(item.quality) == "table" and item.quality.name) or item.quality,
        }
      }
    end
  end
end

function UTIL_get_reverse_direction(direction)
  if direction == defines.direction.east then
    return defines.direction.west;
  elseif direction == defines.direction.west then
    return defines.direction.east;
  elseif direction == defines.direction.north then
    return defines.direction.south;
  elseif direction == defines.direction.south then
      return defines.direction.north;
  end
end

function UTIL_add_vector(a, b)
  return {x = a.x + b.x, y = a.y + b.y}
end

-- Entity가 배치된 모든 타일을 가져옴.
function UTIL_get_entity_tiles(entity)
  local bounds = entity.bounding_box;
  local left = math.floor(bounds.left_top.x + 0.001)
	local top = math.floor(bounds.left_top.y + 0.001)
	local right = math.floor(bounds.right_bottom.x - 0.001)
	local bottom = math.floor(bounds.right_bottom.y - 0.001)

  local tiles = {};
  local surface = entity.surface;
  for tx = left, right do
    for ty = top, bottom do
      table.insert(tiles, surface.get_tile(tx, ty));
    end
  end
  return tiles;
end