-- 지정된 타일 위에 특정 entity나 type의 배치만을 허용하는 필터

local events = require("scripts.drv.events")

__TILE_PLACEMENT_FILTER__ = {}

local __MODULE__ = {}

-- Linox 건설 제한
events.create_build_entity_handler(function(event)
  local surface_name = event.entity.surface.name
  if surface_name == __LINOX_SURFACE__.ground or surface_name == __LINOX_SURFACE__.facility then
    local e_type = event.entity_type
    local e_name = event.entity_name
    local tiles = UTIL_get_entity_tiles(event.entity)

    for _, tile in pairs(tiles) do
      local filter = __TILE_PLACEMENT_FILTER__[tile.name]
      if filter then
        for _, ent in pairs(filter) do
          local data = ent.data
          if ent.is_type then
            if data == e_type then
              return true
            end
          elseif data == e_name then
            return true
          end
        end

        -- 적절한 필터가 존재하지만 여기에 포착되지 않았으면 이벤트 취소
        --player.print("이 건물은 리녹스 시설 출입구에 설치하기에는 너무 무겁습니다.");
        event.set_cancel_message = {"", "[img=virtual-signal.signal-alert] ", {"system.heavy-limit"}}
        return false
      end
    end
  end
  return true
end)

__MODULE__.add_entity_type = function(tile_name, entity_type)
  __TILE_PLACEMENT_FILTER__[tile_name] = __TILE_PLACEMENT_FILTER__[tile_name] or {}
  if type(entity_type) == "string" then
    table.insert(__TILE_PLACEMENT_FILTER__[tile_name], {
      data = entity_type,
      is_type = true,
    })
  elseif type(entity_type) == "table" then
    for _, e in pairs(entity_type) do
      table.insert(__TILE_PLACEMENT_FILTER__[tile_name], {
        data = e,
        is_type = true,
      })
    end
  end
end

__MODULE__.add_entity_name = function(tile_name, entity_name)
  __TILE_PLACEMENT_FILTER__[tile_name] = __TILE_PLACEMENT_FILTER__[tile_name] or {}
  if type(entity_name) == "string" then
    table.insert(__TILE_PLACEMENT_FILTER__[tile_name], {
      data = entity_name,
      is_type = false,
    })
  elseif type(entity_name) == "table" then
    for _, e in pairs(entity_name) do
      table.insert(__TILE_PLACEMENT_FILTER__[tile_name], {
        data = e,
        is_type = false,
      })
    end
  end
end

return __MODULE__