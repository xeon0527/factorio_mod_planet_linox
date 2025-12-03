local vector = require("scripts.util.vector")

local __foundation_tile = "linox-tile_linox-foundation"
local __corridor_tile = "linox-tile_linox-corridor"

local __MODULE__ = {}

local function __create_sub_space(surface, center_position, center_size)
  local thickness = 4
  local offset = center_size + 1.5 + thickness

  -- 좌상단 모서리
  local x1 = center_position.x - offset + 0.1-- - (thickness - 1)
  local y1 = center_position.y - offset + 0.1-- - (thickness - 1)
  
  -- 우하단 모서리
  local x2 = x1 + offset
  local y2 = y1 + (thickness - 1)

  -- 좌하단 모서리
  local x3 = x1 + (thickness - 1)
  local y3 = y1 + offset

  local tiles = {};

  for x = x1, x2 do
    for y = y1, y2 do
      table.insert(tiles, {
        position = { x = x, y = y },
        name = "linox-tile_linox-facility-platform",
      });
    end
  end

  for x = x1, x3 do
    for y = y1, y3 do
      table.insert(tiles, {
        position = { x = x, y = y },
        name = "linox-tile_linox-facility-platform",
      });
    end
  end

  for x = x2 - thickness, x2 + thickness - 1 do
    for y = y2 + 1, y2 + 2 do
      table.insert(tiles, {
        position = { x = x, y = y },
        name = "linox-tile_linox-hazard-facility-platform",
      });
    end
  end

  --center_position.x = center_position.x - 0.5
  --center_position.y = center_position.y - 0.5

  local degree = 0
  repeat
    for _, t in pairs(tiles) do
      local v = vector.rotate(center_position, t.position, 90)

      t.position.x = v.x;
      t.position.y = v.y;
    end
    surface.set_tiles(tiles, true, false);
    degree = degree + 90
  until degree >= 360
end



__MODULE__.create = function(surface, pos, size)
  local t = pos.y - size;
  local b = pos.y + size - 1;
  local l = pos.x - size;
  local r = pos.x + size - 1;
  
  local tiles = {};
  for x = l, r do
    for y = t, b do
      table.insert(tiles, {
        position = { x = x, y = y },
        name = __foundation_tile,
      });
    end
  end
  
  surface.set_tiles(tiles, true, false);
  
  __create_sub_space(surface, pos, size);
end



__MODULE__.create_corridor = function(surface, start_pos, direction, length)
  local t = start_pos.y;
  local b = start_pos.y;
  local l = start_pos.x;
  local r = start_pos.x;

  if direction == "up" then
    t = start_pos.y - length;
    b = start_pos.y - 1;
    l = start_pos.x - 3;
    r = start_pos.x + 2;
  elseif direction == "down" then
    b = start_pos.y + length - 1;
    l = start_pos.x - 3;
    r = start_pos.x + 2;
  elseif direction == "left" then
    t = start_pos.y - 3
    b = start_pos.y + 2
    l = start_pos.x - length;
    r = start_pos.x - 1;
  elseif direction == "right" then
    t = start_pos.y - 3
    b = start_pos.y + 2
    r = start_pos.x + length - 1;
  end
  
  local tiles = {};
  for x = l, r do
    for y = t, b do
      table.insert(tiles, {
        position = { x = x, y = y },
        name = __corridor_tile
      });
    end
  end

  if direction == "up" or direction == "down" then
    for y = t, b do
      table.insert(tiles, {
        position = { x = l, y = y },
        name = "linox-tile_linox-corridor-edge"
      });

      table.insert(tiles, {
        position = { x = r, y = y },
        name = "linox-tile_linox-corridor-edge"
      });
    end
  elseif  direction == "left" or direction == "right" then
    for x = l, r do
      table.insert(tiles, {
        position = { x = x, y = t },
        name = "linox-tile_linox-corridor-edge"
      });

      table.insert(tiles, {
        position = { x = x, y = b },
        name = "linox-tile_linox-corridor-edge"
      });
    end
  end

  surface.set_tiles(tiles, true, false);
end


return __MODULE__