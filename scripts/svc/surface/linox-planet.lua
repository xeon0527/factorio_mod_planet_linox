local events = require("scripts.drv.events")

local weak_tiles = {
  "linox-tile_linox-installation-terminal-platform",
  "linox-tile_linox-installation-hazard-terminal-platform",
  "linox-tile_linox-installation-corridor",
}

local light_entity_types = {
  "inserter", "loader-1x1", "loader", "splitter", "lane-splitter",
  "transport-belt", "underground-belt", "lamp", "constant-combinator", "arithmetic-combinator", "decider-combinator", "power-switch",
  "programmable-speaker", "selector-combinator", "display-panel", "pipe", "pipe-to-ground", "pump", "offshore-pump", "electric-pole",
  "construction-robot", "logistic-robot", "combat-robot", 
}

events.create_build_entity_handler(function(event)
  local surface_name = event.entity.surface.name
  if surface_name == "linox-planet_linox" or surface_name == "linox-surface_linox-installation" then
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
        if tile.name ~= "linox-tile_linox-installation-terminal-platform" and tile.name ~= "linox-tile_linox-installation-hazard-terminal-platform" then
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

UTIL_create_event_handler("linox-custom-event_on-enter-elevator", function(event)
  local player = event.player;
  local pos = player.position;
  if player.controller_type == defines.controllers.character then
    if player.surface.name == "linox-planet_linox" then
      if pos.x >= -5 and pos.x <= 5 and pos.y >= -5 and pos.y <= 5 then
        --player.print("엘리베이터를 타고 내부 시설로 들어갔다.");
        player.print({"system.elevator-down"});
        player.teleport({x = 0, y = 5.5}, UTIL_ensure_surface("linox-surface_linox-installation"));
      end
    elseif player.surface.name == "linox-surface_linox-installation" then
      if pos.x >= -5 and pos.x <= 5 and pos.y >= -5 and pos.y <= 5 then
        --player.print("엘리베이터를 타고 표면으로 올라갔다.");
        player.print({"system.elevator-up"});
        player.teleport({x = 0, y = 5.5}, UTIL_ensure_surface("linox-planet_linox"));
      end
    end
  end
end)