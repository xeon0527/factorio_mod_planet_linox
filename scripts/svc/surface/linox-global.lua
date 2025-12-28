local events = require("scripts.drv.events")
local build_filter = require("scripts.drv.build-filter")
local util_surface = require("scripts.util.surface")

local __MODULE__ = {};


local filter_entity_types = {
  "inserter", "loader-1x1", "loader", "splitter", "lane-splitter",
  "transport-belt", "underground-belt", "lamp", "constant-combinator", "arithmetic-combinator", "decider-combinator", "power-switch",
  "programmable-speaker", "selector-combinator", "display-panel", "pipe", "pipe-to-ground", "pump", "offshore-pump", "electric-pole",
  "construction-robot", "logistic-robot", "combat-robot", "solar-panel", "linked-belt",
}

build_filter.add_entity_type("linox-tile_linox-terminal-platform",        filter_entity_types)
build_filter.add_entity_type("linox-tile_linox-hazard-terminal-platform", filter_entity_types)
build_filter.add_entity_type("linox-tile_linox-corridor",                 filter_entity_types)
build_filter.add_entity_type("linox-tile_linox-datacenter",               filter_entity_types)

build_filter.add_entity_name("linox-tile_linox-terminal-platform",        "linox-building_outlet")
build_filter.add_entity_name("linox-tile_linox-hazard-terminal-platform", "linox-building_outlet")
build_filter.add_entity_name("linox-tile_linox-terminal-platform",        "linox-special_emergency-escape-shuttle")
build_filter.add_entity_name("linox-tile_linox-hazard-terminal-platform", "linox-special_emergency-escape-shuttle")

table.insert(filter_entity_types, "container")
table.insert(filter_entity_types, "logistic-container")
table.insert(filter_entity_types, "storage-tank")
table.insert(filter_entity_types, "radar")
--table.insert(filter_entity_types, "proxy-container")

build_filter.add_entity_type("linox-tile_linox-facility-platform",        filter_entity_types)
build_filter.add_entity_type("linox-tile_linox-hazard-facility-platform", filter_entity_types)

build_filter.add_entity_name("linox-tile_linox-facility-platform",        "linox-building_core-roboport")
build_filter.add_entity_name("linox-tile_linox-hazard-facility-platform", "linox-building_core-roboport")

if script.active_mods["Planet-Hopper"] and settings.startup["linox-settings_allow-hopper-launcher"].value then
  build_filter.add_entity_name("linox-tile_linox-terminal-platform",        "planet-hopper-launcher")
  build_filter.add_entity_name("linox-tile_linox-hazard-terminal-platform", "planet-hopper-launcher")
end

if script.active_mods["compaktcircuit"] then
  build_filter.add_entity_name("linox-tile_linox-facility-platform",        "compaktcircuit-processor")
  build_filter.add_entity_name("linox-tile_linox-facility-platform",        "compaktcircuit-processor_1x1")
  build_filter.add_entity_name("linox-tile_linox-hazard-facility-platform", "compaktcircuit-processor")
  build_filter.add_entity_name("linox-tile_linox-hazard-facility-platform", "compaktcircuit-processor_1x1")
end


-- Linox 건설 제한
events.create_build_entity_handler(function(event)
  local surface_name = event.entity.surface.name
  if surface_name == __LINOX_SURFACE__.ground or surface_name == __LINOX_SURFACE__.facility then
    local player = event.player
    local e_type = event.entity_type
    local e_name = event.entity_name
    local tiles = UTIL_get_entity_tiles(event.entity)

    if e_type == "rocket-silo" and e_name ~= "linox-building_advanced-rocket-silo" then
      if script.active_mods["Planet-Hopper"] and settings.startup["linox-settings_allow-hopper-launcher"].value and e_name == "planet-hopper-launcher" then
        return true
      end

      if player then
        --player.print("리녹스에서는 고급 로켓 사일로만 사용할 수 있습니다.");
        player.print{"", "[img=virtual-signal.signal-alert] ", {"system.rocket-silo-limit"}}
      end
      return false
    elseif e_name == "linox-building_cargo-elevator" or e_name == "linox-building_fluid-elevator" then
      for _, tile in pairs(tiles) do
        if tile.name ~= "linox-tile_linox-terminal-platform" and tile.name ~= "linox-tile_linox-hazard-terminal-platform" then
          --player.print("이 건물은 리녹스 시설 출입구에만 설치할 수 있습니다.");
          player.print{"", "[img=virtual-signal.signal-alert] ", {"system.entrance-limit"}}
          return false
        end
      end
    end
  end
  return true
end)

-- Linox 엘리베이터 탑승 처리
UTIL_create_event_handler("linox-custom-event_on-enter-elevator", function(event)
  local player = event.player;
  local pos = player.position;
  if player.controller_type == defines.controllers.character then
    if player.surface.name == __LINOX_SURFACE__.ground then
      if pos.x >= -5 and pos.x <= 5 and pos.y >= -5 and pos.y <= 5 then
        --player.print("엘리베이터를 타고 내부 시설로 들어갔다.");
        if settings.get_player_settings(player)["linox-settings_elevator-boarding-alert"].value then
          player.print({"system.elevator-down"});
        end
        util_surface.teleport(player, {{pos.x - 4, pos.y - 4}, {pos.x + 4, pos.y + 4}}, UTIL_ensure_surface(__LINOX_SURFACE__.facility))
      end
    elseif player.surface.name == __LINOX_SURFACE__.facility then
      if pos.x >= -5 and pos.x <= 5 and pos.y >= -5 and pos.y <= 5 then
        --player.print("엘리베이터를 타고 표면으로 올라갔다.");
        if settings.get_player_settings(player)["linox-settings_elevator-boarding-alert"].value then
          player.print({"system.elevator-up"});
        end
        util_surface.teleport(player, {{pos.x - 4, pos.y - 4}, {pos.x + 4, pos.y + 4}}, UTIL_ensure_surface(__LINOX_SURFACE__.ground))
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


UTIL_create_event_handler(defines.events.on_pre_surface_deleted, function(event)
  local surface = game.get_surface(event.surface_index)
  if not surface then return end

  if surface.name == __LINOX_SURFACE__.ground or surface.name == __LINOX_SURFACE__.facility then
    local f = game.forces["player"]
    for k, v in pairs(f.technologies) do
      if util.string_starts_with(v.name, "linox-technology_") then
        v.researched = false
      end
    end

    surface = game.get_surface(__LINOX_SURFACE__.ground)
    if surface and not surface.deletable then
      game.delete_surface(surface)
    end

    surface = game.get_surface(__LINOX_SURFACE__.facility)
    if surface and not surface.deletable then
      game.delete_surface(surface)
    end
  end
end)

__MODULE__.connect_surfaces = function()
  local linox_A = game.get_surface(__LINOX_SURFACE__.ground)
  local linox_B = game.get_surface(__LINOX_SURFACE__.facility)
  if linox_A and linox_B then
    local lppn1 = linox_A.find_entity("linox-special_circuit-pole", {0,2})
    local lppn2 = linox_B.find_entity("linox-special_circuit-pole", {0,2})
    if lppn1 and lppn2 then
      local lppn1_connector = lppn1.get_wire_connector(defines.wire_connector_id.pole_copper, true);
      local lppn2_connector = lppn2.get_wire_connector(defines.wire_connector_id.pole_copper, true);
      lppn1_connector.connect_to(lppn2_connector, false);

      lppn1_connector = lppn1.get_wire_connector(defines.wire_connector_id.circuit_red, true);
      lppn2_connector = lppn2.get_wire_connector(defines.wire_connector_id.circuit_red, true);
      lppn1_connector.connect_to(lppn2_connector, false);

      lppn1_connector = lppn1.get_wire_connector(defines.wire_connector_id.circuit_green, true);
      lppn2_connector = lppn2.get_wire_connector(defines.wire_connector_id.circuit_green, true);
      lppn1_connector.connect_to(lppn2_connector, false);
    end
  end
end

return __MODULE__