local linox_map_gen = require("prototypes.planet.map-gen")
local vector = require("scripts.util.vector")
local sample_bp = require("scripts.svc.surface.sample.bp")
local sample_bp_book = require("scripts.svc.surface.sample.book")

local __MODULE__ = {};

local function create_circuit_space(center_position, center_size)
  local thickness = 3
  local offset = center_size + 1.5 + thickness

  -- 좌상단 모서리
  local x1 = center_position.x - offset-- - (thickness - 1)
  local y1 = center_position.y - offset-- - (thickness - 1)
  
  -- 우하단 모서리
  local x2 = x1 + offset - 3
  local y2 = y1 + (thickness - 1)

  -- 좌하단 모서리
  local x3 = x1 + (thickness - 1)
  local y3 = y1 + offset - 3

  local tiles = {};

  local surface = UTIL_ensure_surface("linox-surface_linox-installation")

  for x = x1, x2 do
    for y = y1, y2 do
      table.insert(tiles, {
        position = { x = x, y = y },
        name = "linox-tile_linox-installation-foundation",
      });
    end
  end

  for x = x1, x3 do
    for y = y1, y3 do
      table.insert(tiles, {
        position = { x = x, y = y },
        name = "linox-tile_linox-installation-foundation",
      });
    end
  end

  local degree = 0
  repeat
    for _, t in pairs(tiles) do
      local v = vector.rotate(center_position, t.position, 90)

      t.position.x = v.x;
      t.position.y = v.y;
    end
    surface.set_tiles(tiles);
    degree = degree + 90
  until degree >= 360
end

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
  UTIL_ensure_surface("linox-surface_linox-installation").set_tiles(tiles);

  create_circuit_space(pos, size);
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
    surface.set_property("gravity", __LINOX_PLANET__.gravity);
    surface.set_property("magnetic-field", __LINOX_PLANET__.magnetic_field);
    surface.set_property("solar-power", 0);
    surface.set_property("pressure", __LINOX_PLANET__.pressure);
    surface.daytime = 0.5;
    surface.freeze_daytime = true;
    surface.create_global_electric_network();

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

    -- 지상과 지하 전력망 연결
    local lppn1 = UTIL_ensure_entity(surface, { name = "linox-entity_hidden-electric-pole"})

    local surface2 = UTIL_ensure_surface("linox-planet_linox")
    local lppn2 = UTIL_ensure_entity(surface2, { name = "linox-entity_hidden-electric-pole"})

    if lppn1 and lppn2 then
      local lppn1_connector = lppn1.get_wire_connector(defines.wire_connector_id.pole_copper, true);
      local lppn2_connector = lppn2.get_wire_connector(defines.wire_connector_id.pole_copper, true);
      lppn1_connector.connect_to(lppn2_connector, false);
    end

    local pumpjack = surface.create_entity {
      name = "linox-entity_deep-oil-pumpjack",
      position = { -10.5, 10.5 },
      force = "enemy",
      create_build_effect_smoke = false,
      direction = defines.direction.south,
    }
    pumpjack.destructible = false;
    pumpjack.minable = false;
    pumpjack.rotatable = false;

    pumpjack = surface.create_entity {
      name = "linox-entity_sulfuric-acid-pumpjack",
      position = { 10.5, 10.5 },
      force = "enemy",
      create_build_effect_smoke = false,
      direction = defines.direction.south,
    }
    pumpjack.destructible = false;
    pumpjack.minable = false;
    pumpjack.rotatable = false;

    script.raise_event("linox-custom-event_on-surface-complete", {surface = surface,});
  end
end)



__MODULE__.running_lorax = function()
  local surface = game.get_surface("linox-planet_linox");
  return surface and #surface.find_entities_filtered{name="solar-panel"} >= 3
end



__MODULE__.expand_facility = function(level)
  local size = 8;

  if level == 1 then
    create_corridor({x = 0, y = -13}, "up", 48);
    create_factory({x = 0, y = -64}, size);

    local surface = game.get_surface("linox-surface_linox-installation");
    if surface then
      local bp_entity = surface.create_entity{name = 'item-on-ground', position= {0, -64}, stack = 'blueprint'}
      if bp_entity then 
        bp_entity.stack.import_stack(sample_bp);

        local bp_entities = bp_entity.stack.build_blueprint{
          surface = surface,
          force = "player",
          position= {-3, -64},
          build_mode=defines.build_mode.forced,
        };

        for _, ghost in pairs(bp_entities) do
          if ghost.ghost_name == "blueprint-deployer2" then
            ghost.revive{raise_revive = true};
          else
            ghost.revive();
          end
        end
        bp_entity.destroy();
      end

      local deployer = surface.find_entities_filtered{name = "blueprint-deployer2", position = { 0, -64 }, radius = 25, limit = 1}
      if deployer and #deployer > 0 then
        deployer = deployer[1]
        deployer.insert{ name = "blueprint" }
        local iv = deployer.get_inventory(defines.inventory.chest);
        if iv then iv[1].import_stack(sample_bp_book); end

        local stor = surface.find_entities_filtered{name = "storage-chest", position = { 0, -64 }, radius = 25}
        if stor then
          stor[1].insert{ name = "chemical-plant", count = 8 }
          stor[1].insert{ name = "pipe", count = 33 }
          stor[1].insert{ name = "speed-module-3", count = 26 }
          stor[1].insert{ name = "bulk-inserter", count = 16 }
          stor[1].insert{ name = "requester-chest", count = 4 }
          stor[1].insert{ name = "active-provider-chest", count = 5 }
          stor[1].insert{ name = "beacon", count = 10 }
          stor[1].insert{ name = "pipe-to-ground", count = 1 }
          stor[1].insert{ name = "turbo-transport-belt", count = 12 }
          stor[1].insert{ name = "turbo-underground-belt", count = 5 }
          stor[1].insert{ name = "assembling-machine-3", count = 2 }
          stor[1].insert{ name = "productivity-module-3", count = 8 }
          stor[1].insert{ name = "foundry", count = 2 }

          stor[2].insert{ name = "stone", count = 1000 }
        end
      end


      local box1 = surface.create_entity{name = "steel-chest", force = "player", position = { -8, -57 }}
      if box1 then
        box1.insert{name = "steel-plate", count = 1500};
        box1.insert{name = "electronic-circuit", count = 800};
        box1.insert{name = "advanced-circuit", count = 800};
        box1.insert{name = "processing-unit", count = 600};
        box1.insert{name = "iron-plate", count = 500};
        box1.insert{name = "copper-plate", count = 500};
      end

      local box2 = surface.create_entity{name = "steel-chest", force = "player", position = { -8, -58 }}
      if box2 then
        box2.insert{name = "tungsten-ore", count = 500};
        box2.insert{name = "tungsten-carbide", count = 500};
        box2.insert{name = "tungsten-plate", count = 500};
      end

      local box3 = surface.create_entity{name = "steel-chest", force = "player", position = { -8, -59 }}
      if box3 then
        box3.insert{name = "logistic-robot", count = 500};
        box3.insert{name = "construction-robot", count = 500};
        box3.insert{name = "linox-item_core-roboport", count = 10};
        box3.insert{name = "electric-engine-unit", count = 250};
      end

      local box4 = surface.create_entity{name = "steel-chest", force = "player", position = { -8, -60 }}
      if box4 then
        box4.insert{name = "rocket-silo", count = 1};
        box4.insert{name = "concrete", count = 1500};
        box4.insert{name = "refined-concrete", count = 1500};
        box4.insert{name = "electric-engine-unit", count = 250};
      end

      local box5 = surface.create_entity{name = "steel-chest", force = "player", position = { -8, -61 }}
      if box5 then
        box5.insert{name = "plastic-bar", count = 1000};
        box5.insert{name = "rocket-fuel", count = 120};
      end

      local box6 = surface.create_entity{name = "steel-chest", force = "player", position = { -7, -57 }}
      if box6 then
        box6.insert{name = "foundry", count = 10};
        box6.insert{name = "assembling-machine-3", count = 20};
        box6.insert{name = "chemical-plant", count = 20};
        box6.insert{name = "solar-panel", count = 10};
        box6.insert{name = "electric-furnace", count = 10};
        box6.insert{name = "offshore-pump", count = 4};
        box6.insert{name = "linox-item_fluid-elevator", count = 2};
        box6.insert{name = "linox-item_cargo-elevator", count = 2};
        box6.insert{name = "bulk-inserter", count = 50};
      end
    end
    
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