local linox_map_gen = require("prototypes.planet.map-gen")

local __MODULE__ = {};

local function create_corridor(start_pos, direction, length)
  local t = start_pos.y;
  local b = start_pos.y;
  local l = start_pos.x;
  local r = start_pos.x;

  if direction == "up" then
    t = start_pos.y - length;
    b = start_pos.y - 1;
    l = start_pos.x - 1;
  elseif direction == "down" then
    b = start_pos.y + length - 1;
    l = start_pos.x - 1;
  elseif direction == "left" then
    t = start_pos.y - 1;
    l = start_pos.x - length;
    r = start_pos.x - 1;
  elseif direction == "right" then
    t = start_pos.y - 1;
    r = start_pos.x + length - 1;
  end
  
  local tiles = {};
  for x = l, r do
    for y = t, b do
      table.insert(tiles, {
        position = { x = x, y = y },
        name = "linox-tile_linox-installation-corridor"
      });
    end
  end

  UTIL_ensure_surface("linox-surface_linox-installation").set_tiles(tiles);
end

local function create_factory(pos, size)
  local t = pos.y - size;
  local b = pos.y + size - 1;
  local l = pos.x - size;
  local r = pos.x + size - 1;
  
  local tiles = {};
  for x = l, r do
    for y = t, b do
      table.insert(tiles, {
        position = { x = x, y = y },
        name = "linox-tile_linox-installation-foundation",
      });
    end
  end

  t = t-3;
  b = b+3;
  l = l-3;
  r = r+3;

  for x = l, r do
    if x <= l+7 or x >= r-7 then
      table.insert(tiles, {
        position = { x = x, y = t },
        name = "linox-tile_linox-installation-foundation",
      });
      table.insert(tiles, {
        position = { x = x, y = b },
        name = "linox-tile_linox-installation-foundation",
      });
    end
  end

  for y = t, b do
    if y <= t+7 or y >= b-7 then
      table.insert(tiles, {
        position = { x = l, y = y },
        name = "linox-tile_linox-installation-foundation",
      });
      table.insert(tiles, {
        position = { x = r, y = y },
        name = "linox-tile_linox-installation-foundation",
      });
    end
  end

  UTIL_ensure_surface("linox-surface_linox-installation").set_tiles(tiles);

end

UTIL_create_event_handler(defines.events.on_surface_created, function(event)
  local surface = game.surfaces[event.surface_index];
  if surface.name == "linox-surface_linox-installation" then
    local settings = linox_map_gen.linox_installation();
    settings.seed = 0;
    settings.width = 256;
    settings.height = 256;
    surface.map_gen_settings = settings;

    surface.localised_name = { "space-location-name.linox-surface_linox-installation" }
    surface.set_property("gravity", 500);
    surface.set_property("magnetic-field", 1600);
    surface.set_property("solar-power", 0);
    surface.set_property("pressure", 10);
    surface.daytime = 0.5;
    surface.freeze_daytime = true;

    -- 중심부 공간을 만들어줌.
    surface.request_to_generate_chunks({0, 0}, 2)
    surface.force_generate_chunk_requests()

    -- 표면 중심부에 center_size 만큼의 발판을 만든다.
    local center_size = 13;
    local modify_tiles = {};
    for xx = -center_size, center_size - 1 do
      for yy = -center_size, center_size - 1 do

        if xx == -center_size or xx == center_size - 1 or
            yy == -center_size or yy == center_size - 1 then
          table.insert(modify_tiles, {
            position = { x = xx, y = yy },
            name = "linox-tile_linox-installation-hazard-terminal-platform"
          });
        else
          table.insert(modify_tiles, {
            position = { x = xx, y = yy },
            name = "linox-tile_linox-installation-terminal-platform"
          });
        end
      end
    end
    surface.set_tiles(modify_tiles);

    local cargo_pad = surface.find_entity("linox-entity_cargo-landing-pad", {0,0})
    if cargo_pad == nil then
      cargo_pad = surface.create_entity{
        name = "linox-entity_cargo-landing-pad",
        position = {0,0},
        force = "neutral",
        create_build_effect_smoke = false,
      }

      if cargo_pad == nil then
        print("cargo pad error")
        return
      end
    end
    cargo_pad.destructible = false;
    cargo_pad.minable = false;
    cargo_pad.operable = false;

  end

  script.raise_event("linox-custom-event_on-surface-complete", {
    surface = surface,
  });
end)


__MODULE__.expand_facility = function(level)
  local size = 8;

  if level == 1 then
    create_corridor({x = 0, y = -13}, "up", 48);
    create_factory({x = 0, y = -64}, size);
  elseif level == 2 then
    create_corridor({x = 13, y = 0}, "right", 48);
    create_factory({x = 64, y = 0}, size);
  elseif level == 3 then
    create_corridor({x = 0, y = 13}, "down", 48);
    create_factory({x = 0, y = 64}, size);
  elseif level == 4 then
    create_corridor({x = -13, y = 0}, "left", 48);
    create_factory({x = -64, y = 0}, size);

  elseif level == 5 then
    create_corridor({x = 56, y = -64}, "left", 48);
    create_corridor({x = 64, y = -56}, "down", 48);
    create_factory({x = 64, y = -64}, size);
  elseif level == 6 then
    create_corridor({x = 56, y = 64}, "left", 48);
    create_corridor({x = 64, y = 56}, "up", 48);
    create_factory({x = 64, y = 64}, 8);
  elseif level == 7 then
    create_corridor({x = -56, y = 64}, "right", 48);
    create_corridor({x = -64, y = 56}, "up", 48);
    create_factory({x = -64, y = 64}, 8);
  elseif level == 8 then
    create_corridor({x = -56, y = -64}, "right", 48);
    create_corridor({x = -64, y = -56}, "down", 48);
    create_factory({x = -64, y = -64}, 8);
  end
end;

return __MODULE__;