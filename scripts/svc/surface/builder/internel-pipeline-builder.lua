local surface_facility = require("scripts.svc.surface.linox-facility")

local __MODULE__ = {}

__MODULE__.create = function(position_limit)
  if surface_facility.get() then
    local surface = surface_facility.get()

    local place_area = {
      {x1 = -5, y1 = -49, x2 = -5, y2 = -23, corridor_dir = "right"},
      {x1 = 4, y1 = -49, x2 = 4, y2 = -15, corridor_dir = "left"},

      {x1 = -5, y1 = 14, x2 = -5, y2 = 48, corridor_dir = "right"},
      {x1 = 4, y1 = 14, x2 = 4, y2 = 48, corridor_dir = "left"},

      {x1 = -49, y1 = -5, x2 = -23, y2 = -5, corridor_dir = "bottom"},
      {x1 = -49, y1 = 4, x2 = -15, y2 = 4, corridor_dir = "top"},

      {x1 = 14, y1 = -5, x2 = 48, y2 = -5, corridor_dir = "bottom"},
      {x1 = 14, y1 = 4, x2 = 48, y2 = 4, corridor_dir = "top"},
    }

    while true do
      local rnd = math.random(#place_area)
      if position_limit then
        rnd = math.random(2)
      end

      local area = place_area[rnd]
      local x = math.random(area.x1, area.x2)
      local y = math.random(area.y1, area.y2)

      for _x = x - 1, x + 1 do
        for _y = y - 1, y + 1 do
          if surface.get_tile(_x, _y).name ~= "linox-tile_out-of-map" then
            area = nil
          end
        end
      end

      if area then
        local tiles = {}
        for _x = x - 1, x + 1 do
          for _y = y - 1, y + 1 do
            table.insert(tiles, {
              position = { x = _x, y = _y },
              name = "linox-tile_linox-hazard-facility-platform",
            })
          end
        end

        if area.corridor_dir == "left" then
          table.insert(tiles, { position = { x = x - 2, y = y - 1 }, name = "linox-tile_linox-corridor"})
          table.insert(tiles, { position = { x = x - 2, y = y     }, name = "linox-tile_linox-corridor"})
          table.insert(tiles, { position = { x = x - 2, y = y + 1 }, name = "linox-tile_linox-corridor"})
        elseif area.corridor_dir == "right" then
          table.insert(tiles, { position = { x = x + 2, y = y - 1 }, name = "linox-tile_linox-corridor"})
          table.insert(tiles, { position = { x = x + 2, y = y     }, name = "linox-tile_linox-corridor"})
          table.insert(tiles, { position = { x = x + 2, y = y + 1 }, name = "linox-tile_linox-corridor"})
        elseif area.corridor_dir == "top" then
          table.insert(tiles, { position = { x = x - 1, y = y - 2 }, name = "linox-tile_linox-corridor"})
          table.insert(tiles, { position = { x = x,     y = y - 2 }, name = "linox-tile_linox-corridor"})
          table.insert(tiles, { position = { x = x + 1, y = y - 2 }, name = "linox-tile_linox-corridor"})
        elseif area.corridor_dir == "bottom" then
          table.insert(tiles, { position = { x = x - 1, y = y + 2 }, name = "linox-tile_linox-corridor"})
          table.insert(tiles, { position = { x = x,     y = y + 2 }, name = "linox-tile_linox-corridor"})
          table.insert(tiles, { position = { x = x + 1, y = y + 2 }, name = "linox-tile_linox-corridor"})
        end

        surface.set_tiles(tiles);

        local entity = UTIL_ensure_entity(surface, {
          name = "linox-special_internel-pipeline",
          position = {x, y},
          force = "player",
          create_build_effect_smoke = false,
        });
        entity.destructible = false;
        entity.minable = false;
        return
      end
    end
  end
end

return __MODULE__