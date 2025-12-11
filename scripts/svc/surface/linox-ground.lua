local stor = require("scripts.drv.storage")
local u_surface = require("scripts.util.surface")
local db = require("scripts.svc.database");
local linox_global = require("scripts.svc.surface.linox-global")

stor.ensure("story.flag.visited_linox", false)
stor.ensure("story.flag.cargo_approval", false)

local __MODULE__ = {};

local __rocketsilo_foundation_tile = "linox-tile_linox-foundation"
local __base_foundation_tile = "linox-tile_linox-terminal-platform"
local __base_border_tile = "linox-tile_linox-hazard-terminal-platform"

__MODULE__.get = function()
  return game.get_surface(__LINOX_SURFACE__.ground)
end

__MODULE__.create = function()
  return UTIL_ensure_surface(__LINOX_SURFACE__.ground)
end

__MODULE__.has_building = function()
  local surface = __MODULE__.get()
  return (surface.find_entity("linox-building_cargo-landing-pad", {0,0}) ~= nil)
end

__MODULE__.obtain_cargo_landing_pad = function()
  local surface = __MODULE__.get()
  local pad = surface.find_entity("linox-building_cargo-landing-pad", {0,0});
  pad.operable = true;
end

__MODULE__.create_rocketsilo_foundation = function()
  local surface = game.get_surface(__LINOX_SURFACE__.ground);
  if not surface then return end
  
  u_surface.fill_tile{ surface = surface, tile_name = __rocketsilo_foundation_tile,
    x = -17.5, y = -8.5, radius = 9 }

  u_surface.fill_tile{ surface = surface, tile_name = __rocketsilo_foundation_tile,
    x = -17.5, y = 8.5, radius = 9 }

  u_surface.fill_tile{ surface = surface, tile_name = __rocketsilo_foundation_tile,
    x = 17.5, y = -8.5, radius = 9 }

  u_surface.fill_tile{ surface = surface, tile_name = __rocketsilo_foundation_tile,
    x = 17.5, y = 8.5, radius = 9 }
end

__MODULE__.create_ground_platform_expansion = function()
  local surface = game.get_surface(__LINOX_SURFACE__.ground);
  if not surface then return end

  if surface.get_tile(-17, -17).name ~= "linox-tile_linox-foundation" then
    u_surface.fill_tile { surface = surface, tile_name = __rocketsilo_foundation_tile,
      x1 = -17, y1 = -17, x2 = 16, y2 = -14 }

    u_surface.fill_tile { surface = surface, tile_name = __rocketsilo_foundation_tile,
      x1 = -17, y1 = -13, x2 = -14, y2 = 12 }

      u_surface.fill_tile { surface = surface, tile_name = __rocketsilo_foundation_tile,
      x1 = 13, y1 = -12, x2 = 16, y2 = 12 }

    u_surface.fill_tile { surface = surface, tile_name = __rocketsilo_foundation_tile,
      x1 = -17, y1 = 13, x2 = 16, y2 = 16 }
  end
end

__MODULE__.create_building = function()
  local surface = game.get_surface(__LINOX_SURFACE__.ground);
  if not surface then return end

  -- 청크 먼저 생성해주고 타일을 깔아야됨. 안깔면 청크가 생성되면서 타일이 다 덮어씌워짐
  surface.request_to_generate_chunks({0, 0}, 2)
  surface.force_generate_chunk_requests()

  -- 표면 중심부에 center_size 만큼의 발판을 만든다.
  local center_size = 13
  
  local modify_tiles = {};
  for xx = -center_size, center_size - 1 do
    for yy = -center_size, center_size - 1 do

      if xx == -center_size or xx == center_size - 1 or
          yy == -center_size or yy == center_size - 1 then
        table.insert(modify_tiles, {
          position = { x = xx, y = yy },
          name = __base_border_tile
        });
      else
        table.insert(modify_tiles, {
          position = { x = xx, y = yy },
          name = __base_foundation_tile
        });
      end
    end
  end
  surface.set_tiles(modify_tiles);


  local cargo_pad = UTIL_ensure_entity(surface, {
    name = "linox-building_cargo-landing-pad",
    position = {0,0},
    force = "player",
    create_build_effect_smoke = false,
  });
  cargo_pad.destructible = false;
  cargo_pad.minable = false;
  cargo_pad.operable = false;

  local pole = UTIL_ensure_entity(surface, { name = "linox-special_circuit-pole", position = {-2,2}})
  pole.destructible = false
  pole.minable = false
  pole.rotatable = false

  UTIL_ensure_entity(surface, {
    name = "crash-site-spaceship-wreck-medium-1",
    force = "neutral",
    position = { -4, -7 }
  }).insert{name = "iron-plate", count = 100};

  UTIL_ensure_entity(surface, {
    name = "crash-site-spaceship-wreck-medium-2",
    force = "neutral",
    position = { -8, -4 }
  }).insert{name = "copper-plate", count = 100};

  UTIL_ensure_entity(surface, {
    name = "crash-site-spaceship-wreck-medium-1",
    force = "neutral",
    position = { -5, 9 }
  }).insert{name = "iron-plate", count = 100};

  UTIL_ensure_entity(surface, {
    name = "crash-site-spaceship-wreck-medium-2",
    force = "neutral",
    position = { 9, 3 }
  }).insert{name = "copper-plate", count = 100};

  UTIL_ensure_entity(surface, {
    name = "crash-site-spaceship-wreck-medium-1",
    force = "neutral",
    position = { 4, 9 }
  }).insert{name = "solar-panel", count = 6};
end


UTIL_create_event_handler(defines.events.on_cargo_pod_started_ascending, function(event)
  local platform = event.cargo_pod.surface.platform;
  if not platform or not platform.space_location then return end;

  local loc_name = platform.space_location.name; 
  if loc_name == __LINOX_SURFACE__.ground then
    local force = event.cargo_pod.force;
    local gps_tag = event.cargo_pod.gps_tag;

    if force.technologies["linox-technology_exploring-linox-landing-site"].researched then
      local cargo_allow = db.get_force(force, "story_lorax_cargo_approval");
      if event.player_index == nil and cargo_allow ~= true then
        event.cargo_pod.destroy()
        --force.print("[img=virtual-signal.signal-alert] "..gps_tag.." 화물 착륙 패드 제어 권한이 없습니다. 화물이 손실 되었습니다.");
        force.print{"", "[img=virtual-signal.signal-alert] "..gps_tag.." ", {"system.cargo-pod-lost"}};
      end
    else
      event.cargo_pod.destroy()
      if event.player_index then
        local player = game.players[event.player_index];
        player.enter_space_platform(platform);
      end

      --force.print("[img=virtual-signal.signal-alert] "..gps_tag.." 화물 포드가 착륙할 지면을 찾을 수 없습니다. 착륙 절차가 취소되었습니다.");
      force.print{"", "[img=virtual-signal.signal-alert] "..gps_tag.." ", {"system.cargo-pod-stop"}};
    end
  end
end)

UTIL_create_event_handler(defines.events.on_cargo_pod_finished_descending, function(event)
  if event.player_index ~= nil and event.cargo_pod.surface.name == __LINOX_SURFACE__.ground then
    local player = game.players[event.player_index];
    if not player.force.technologies["linox-technology_exploring-linox-landing-site"].researched and
        player.character then
      player.character.die();

      game.print{"", "[img=virtual-signal.signal-alert] ", {"system.lava-dive"}, player.name}

      local target = nil;
      local vanilla_surfaces = {"nauvis", "vulcanus", "gleba","fulgora", "aquilo"}
      for _, surface in pairs(vanilla_surfaces) do
        target = game.get_surface(surface)
        if target then break end
      end
      player.teleport({x = 0, y = 0}, target)
      
    end
  end
end)

UTIL_create_event_handler(defines.events.on_cargo_pod_delivered_cargo, function(event)
  if event.cargo_pod.surface.name == __LINOX_SURFACE__.ground then
    local force = game.forces["player"];
    if force.technologies["linox-technology_exploring-linox-landing-site"].researched then
      if not storage.story.flag.visited_linox then
        --game.print("착륙 패드를 수색해보니 내부 시설로 내려가는 수상한 엘리베이터를 발견할 수 있었다.");
        game.print({"system.elevator-found"});
        storage.story.flag.visited_linox = true;
      end
    end
  end
end)


UTIL_create_event_handler(defines.events.on_surface_created, function(event)
  local surface = game.get_surface(event.surface_index);
  if surface and surface.name == __LINOX_SURFACE__.ground then
    local force = game.forces["player"]
    local settings = surface.map_gen_settings;
    settings.seed = 0;
    settings.width = 128;
    settings.height = 128;
    surface.map_gen_settings = settings;
    
    surface.daytime = 0;
    surface.freeze_daytime = true;

    surface.request_to_generate_chunks({0, 0}, 2)
    surface.force_generate_chunk_requests()
    force.chart(surface, {{x = -64, y = -64}, {x = 63, y = 63}})
    surface.create_global_electric_network();

    local tech = force.technologies
    if tech["linox-technology_exploring-linox-landing-site"].researched then
      __MODULE__.create_building()
      linox_global.connect_surfaces();
    end
  end
end)

return __MODULE__;