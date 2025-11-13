__DRV_EVENT_HANDLERS__ = {
  ["linox-custom-event_on-build-entity"] = {}
};

UTIL_create_event_handler("linox-custom-input_click", function(event)
  if event.selected_prototype and event.player_index then
    local p = game.players[event.player_index];
    local spt = event.selected_prototype;

    if p ~= nil and p.selected and spt.base_type == "entity" then
      script.raise_event("linox-custom-event_on-entity-click", {
        player = p,
        entity = p.selected,
      });
    end
  end
end)



local function __on_entity_build(event)
  local entity = event.entity or event.destination
  if not (entity and entity.valid) then return end
  local player_index = event.player_index

  if not player_index and event.robot and event.robot.valid then
      local cell = event.robot.logistic_cell
      local owner = cell and cell.owner
      if owner and owner.is_player() then player_index = owner.player.index end
  end
  
  local entity_type = entity.type;
  local entity_name = entity.name;
  if entity_type == "entity-ghost" then
    entity_type = entity.ghost_type;
    entity_name = entity.ghost_name;
  end

  local player = nil;
  if player_index then
    player = game.get_player(player_index)
  end

  local event_data = {
    player = player,
    entity = entity,
    entity_type = entity_type,
    entity_name = entity_name,
    tiles = UTIL_get_entity_tiles(entity),
    pass = true,
  }

  for _, proc in pairs(__DRV_EVENT_HANDLERS__["linox-custom-event_on-build-entity"]) do
    proc(event_data);
  end

  --script.raise_event("linox-custom-event_on-build-entity", event_data);

  -- 설치 금지 판정이 났으면 Player에게 아이템을 반환하거나 바닥에 떨어뜨림.
  if not event_data.pass and event.consumed_items then
    local items = event.consumed_items.get_contents();
    if player then
      --if player.admin then return end;

      UTIL_insert_item(player, items)
    else
      for _, item in ipairs(items) do
        entity.surface.spill_item_stack {
          position = entity.position,
          enable_looted = true,
          stack = {
            name = item.name;
            count = item.count,
            quality = (type(item.quality) == "table" and item.quality.name) or item.quality,
          }
        }
      end
    end

    entity.destroy{raise_destroy = false};
  end
end

UTIL_create_event_handler(defines.events.on_built_entity,                __on_entity_build);
UTIL_create_event_handler(defines.events.on_robot_built_entity,          __on_entity_build);
UTIL_create_event_handler(defines.events.script_raised_built,            __on_entity_build);
UTIL_create_event_handler(defines.events.script_raised_revive,           __on_entity_build);
UTIL_create_event_handler(defines.events.on_space_platform_built_entity, __on_entity_build);
UTIL_create_event_handler(defines.events.on_entity_cloned,               __on_entity_build);

local __MODULE__ = {}

__MODULE__.create_build_entity_handler = function(proc)
  table.insert(__DRV_EVENT_HANDLERS__["linox-custom-event_on-build-entity"], proc);
end

return __MODULE__