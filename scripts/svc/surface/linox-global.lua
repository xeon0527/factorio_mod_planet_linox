local events = require("scripts.drv.events")

local __MODULE__ = {};

local weak_tiles = {
  "linox-tile_linox-terminal-platform",
  "linox-tile_linox-hazard-terminal-platform",
  --"linox-tile_linox-corridor",
}

local light_entity_types = {
  "inserter", "loader-1x1", "loader", "splitter", "lane-splitter",
  "transport-belt", "underground-belt", "lamp", "constant-combinator", "arithmetic-combinator", "decider-combinator", "power-switch",
  "programmable-speaker", "selector-combinator", "display-panel", "pipe", "pipe-to-ground", "pump", "offshore-pump", "electric-pole",
  "construction-robot", "logistic-robot", "combat-robot", "solar-panel", 
}

-- Linox 건설 제한
events.create_build_entity_handler(function(event)
  local surface_name = event.entity.surface.name
  if surface_name == __LINOX_SURFACE__.ground or surface_name == __LINOX_SURFACE__.facility then
    local player = event.player
    local e_type = event.entity_type
    local e_name = event.entity_name
    local tiles = event.tiles

    if e_type == "rocket-silo" and e_name ~= "linox-entity_advanced-rocket-silo" then
      --player.print("리녹스에서는 고급 로켓 사일로만 사용할 수 있습니다.");
      if player then
        player.print{"", "[img=virtual-signal.signal-alert] ", {"system.rocket-silo-limit"}}
      end
      event.pass = false
    elseif e_name == "linox-entity_cargo-elevator" or e_name == "linox-entity_fluid-elevator" then
      for _, tile in pairs(tiles) do
        if tile.name ~= "linox-tile_linox-terminal-platform" and tile.name ~= "linox-tile_linox-hazard-terminal-platform" then
          --player.print("이 건물은 리녹스 시설 출입구에만 설치할 수 있습니다.");
          player.print{"", "[img=virtual-signal.signal-alert] ", {"system.entrance-limit"}}
          event.pass = false
          return
        end
      end
    else
      for _, tile in pairs(tiles) do
        for _, weak_tile in pairs(weak_tiles) do
          if tile.name == weak_tile then
            for _, let in pairs(light_entity_types) do
              if e_type == let then
                return
              end
            end
            
            --player.print("이 건물은 리녹스 시설 출입구에 설치하기에는 너무 무겁습니다.");
            if player then
              player.print{"", "[img=virtual-signal.signal-alert] ", {"system.heavy-limit"}}
            end
            event.pass = false
            return
          end
        end
      end
    end
  end
end)

-- Linox 엘리베이터 탑승 처리
UTIL_create_event_handler("linox-custom-event_on-enter-elevator", function(event)
  local player = event.player;
  local pos = player.position;
  if player.controller_type == defines.controllers.character then
    if player.surface.name == __LINOX_SURFACE__.ground then
      if pos.x >= -5 and pos.x <= 5 and pos.y >= -5 and pos.y <= 5 then
        --player.print("엘리베이터를 타고 내부 시설로 들어갔다.");
        player.print({"system.elevator-down"});
        player.teleport({x = 0, y = 5.5}, UTIL_ensure_surface(__LINOX_SURFACE__.facility));
      end
    elseif player.surface.name == __LINOX_SURFACE__.facility then
      if pos.x >= -5 and pos.x <= 5 and pos.y >= -5 and pos.y <= 5 then
        --player.print("엘리베이터를 타고 표면으로 올라갔다.");
        player.print({"system.elevator-up"});
        player.teleport({x = 0, y = 5.5}, UTIL_ensure_surface(__LINOX_SURFACE__.ground));
      end
    end
  end
end)

UTIL_create_event_handler(defines.events.on_cargo_pod_finished_ascending, function(event)
  local pod = event.cargo_pod;
  if event.player_index == nil and pod.cargo_pod_destination.type == defines.cargo_destination.station then
    local station = pod.cargo_pod_destination.station;
    if station.type == "cargo-landing-pad" and station.surface.name == __LINOX_SURFACE__.ground then
      local tech = game.forces["player"].technologies["linox-technology_safety-of-entering-orbit"];
      if not tech.researched then 
        local inv = pod.get_inventory(defines.inventory.cargo_unit)
        for i = 1, #inv do
          local slot = inv[i];
          if slot.valid_for_read and math.random() > (0.3 + ((tech.level - 1) * 0.05)) then
            slot.count = 0;
          end
        end
      end
    end
  end
end)


__MODULE__.connect_surfaces = function()
  local linox_A = game.get_surface(__LINOX_SURFACE__.ground)
  local linox_B = game.get_surface(__LINOX_SURFACE__.facility)
  if linox_A and linox_B then
    local lppn1 = UTIL_ensure_entity(linox_A, { name = "linox-entity_hidden-electric-pole"})
    local lppn2 = UTIL_ensure_entity(linox_B, { name = "linox-entity_hidden-electric-pole"})
    if lppn1 and lppn2 then
      local lppn1_connector = lppn1.get_wire_connector(defines.wire_connector_id.pole_copper, true);
      local lppn2_connector = lppn2.get_wire_connector(defines.wire_connector_id.pole_copper, true);
      lppn1_connector.connect_to(lppn2_connector, false);
    end
  end
end

return __MODULE__