local circuit = require("scripts.util.circuit")

local function area_check_limits(a)
  local limit = 8388600 -- ~2^23
  if a[1][1] > limit  then a[1][1] = limit  end
  if a[1][1] < -limit then a[1][1] = -limit end
  if a[1][2] > limit  then a[1][2] = limit  end
  if a[1][2] < -limit then a[1][2] = -limit end
  if a[2][1] > limit  then a[2][1] = limit  end
  if a[2][1] < -limit then a[2][1] = -limit end
  if a[2][2] > limit  then a[2][2] = limit  end
  if a[2][2] < -limit then a[2][2] = -limit end
  return a
end

local function area_normalize(a)
  if a[1][1] > a[2][1] then a[1][1], a[2][1] = a[2][1], a[1][1] end
  if a[1][2] > a[2][2] then a[1][2], a[2][2] = a[2][2], a[1][2] end
  return a
end

local function area_get_from_offsets(e_pos, x, y, w, h, i_center, i_abs)
  local area
  if i_abs <= 0 then
    x = x + math.floor(e_pos.x)
    y = y + math.floor(e_pos.y)
  end
  if i_center<0 or (i_center==0 and (settings.global["recursive-blueprints-area"].value == "corner")) then
    area = {
      {x, y},
      {x + w, y + h}
    }
  else
    -- Align to grid
    if w % 2 ~= 0 then x = x + 0.5 end
    if h % 2 ~= 0 then y = y + 0.5 end
    area = {
      {x - w/2, y - h/2},
      {x + w/2, y + h/2}
    }
  end
  area_normalize(area)
  area_check_limits(area)
  return area
end

local function area_shrink_1_pixel(a)
  local pixel = 0.00390625 -- 1/256
  a[1][1] = a[1][1] + pixel
  a[1][2] = a[1][2] + pixel
  a[2][1] = a[2][1] - pixel
  a[2][2] = a[2][2] - pixel
  return a
end

local function get_area(e)
  local area = area_get_from_offsets(
    e.position,
    circuit.get_entity_signal(e, circuit.cable.all, {type = "virtual", name = "signal-X"}),
    circuit.get_entity_signal(e, circuit.cable.all, {type = "virtual", name = "signal-Y"}),
    circuit.get_entity_signal(e, circuit.cable.all, {type = "virtual", name = "signal-W"}),
    circuit.get_entity_signal(e, circuit.cable.all, {type = "virtual", name = "signal-H"}),
    circuit.get_entity_signal(e, circuit.cable.all, {type = "virtual", name = "rbp-center"}),
    circuit.get_entity_signal(e, circuit.cable.all, {type = "virtual", name = "rbp-absolute"})
  )
  if area[1][1] == area[2][1] then area[2][1] = area[2][1] + 1 end
  if area[1][2] == area[2][2] then area[2][2] = area[2][2] + 1 end
  return area_shrink_1_pixel(area)
end

UTIL_create_event_handler(defines.events.on_player_selected_area, function(event)
  if event.item == "linox-tool_badchest-area-viewer" then
    local player = game.get_player(event.player_index)
    if player and player.valid then 
      for _, e in pairs(event.entities) do
        local area = get_area(e)

        player.print("X1 : "..area[1][1])
        player.print("Y1 : "..area[1][2])
        player.print("X2 : "..area[2][1])
        player.print("Y2 : "..area[2][2])

        rendering.draw_rectangle {
          surface = e.surface,
          color = { 128, 128, 255, 64},
          left_top = {area[1][1], area[1][2]},
          right_bottom = {area[2][1], area[2][2]},
          time_to_live = 300,
          players = {event.player_index},
          filled = true,
        }

        local center_x = area[1][1] + ((area[2][1] - area[1][1]) * 0.5)
        local center_y = area[1][2] + ((area[2][2] - area[1][2]) * 0.5)
        player.print("Center : [gps="..center_x..","..center_y..","..e.surface.name.."]")
      end
    end
  end
end)