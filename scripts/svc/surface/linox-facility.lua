local linox_map_gen   = require("prototypes.planet.map-gen")
local sample_bp       = require("scripts.svc.surface.sample.bp")
local sample_bp_book  = require("scripts.svc.surface.sample.book")
local linox_global    = require("scripts.svc.surface.linox-global")
local factory_builder = require("scripts.svc.surface.builder.factory-builder")
local util_surface    = require("scripts.util.surface")

local __MODULE__ = {};

local __base_foundation_tile  = "linox-tile_linox-terminal-platform"
local __base_border_tile      = "linox-tile_linox-hazard-terminal-platform"


UTIL_create_event_handler(defines.events.on_surface_created, function(event)
  local surface = game.get_surface(event.surface_index);
  if surface and surface.name == __LINOX_SURFACE__.facility then

    local settings = linox_map_gen.facility();
    settings.seed = 0;
    settings.width = 256;
    settings.height = 256;
    surface.map_gen_settings = settings;

    surface.localised_name = { "space-location-name."..__LINOX_SURFACE__.facility }
    surface.set_property("gravity", __LINOX_PLANET__.gravity);
    surface.set_property("magnetic-field", __LINOX_PLANET__.magnetic_field);
    surface.set_property("solar-power", 0);
    surface.set_property("pressure", __LINOX_PLANET__.pressure);
    surface.create_global_electric_network();

    __MODULE__.set_lighting(false)

    -- 중심부 공간을 만들어줌.
    surface.request_to_generate_chunks({0, 0}, 5)
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

    util_surface.fill_tile {
      surface = surface,
      tile_name = "linox-tile_linox-datacenter",
      x1 = -21,
      y1 = -21,
      x2 = -14,
      y2 = -11,
    }

    util_surface.fill_tile {
      surface = surface,
      tile_name = "linox-tile_linox-datacenter",
      x1 = 13,
      y1 = -17,
      x2 = 16,
      y2 = -11,
    }


    -- cargo landing pad 생성
    local cargo_pad = UTIL_ensure_entity(surface, {
      name = "linox-building_cargo-landing-pad",
      position = {0,0},
      force = "neutral",
      create_build_effect_smoke = false,
    });
    cargo_pad.destructible = false;
    cargo_pad.minable = false;
    cargo_pad.operable = false;


    -- pumpjack 생성
    local pumpjack = UTIL_ensure_entity(surface, {
      name = "linox-building_deep-oil-pumpjack",
      position = { -10.5, 10.5 },
      force = "enemy",
      create_build_effect_smoke = false,
      direction = defines.direction.south,
    });
    pumpjack.destructible = false;
    pumpjack.minable = false;
    pumpjack.rotatable = false;

    pumpjack = UTIL_ensure_entity(surface, {
      name = "linox-building_sulfuric-acid-pumpjack",
      position = { 10.5, 10.5 },
      force = "enemy",
      create_build_effect_smoke = false,
      direction = defines.direction.south,
    });
    pumpjack.destructible = false;
    pumpjack.minable = false;
    pumpjack.rotatable = false;

    local force = game.forces["player"]
    local tech = force.technologies
    if tech["linox-technology_exploring-linox-landing-site"].researched then
      linox_global.connect_surfaces();
    end

    script.raise_event("linox-custom-event_on-surface-complete", {surface = surface,});
  end
end)

__MODULE__.get = function()
  return game.get_surface(__LINOX_SURFACE__.facility)
end

__MODULE__.create = function()
  return UTIL_ensure_surface(__LINOX_SURFACE__.facility)
end

__MODULE__.obtain_pumpjacks = function()
  local surface = __MODULE__.get()

  local pumpjack = surface.find_entity("linox-building_deep-oil-pumpjack", { -10.5, 10.5 })
  if pumpjack then pumpjack.force = "player" end

  pumpjack = surface.find_entity("linox-building_sulfuric-acid-pumpjack", { 10.5, 10.5 })
  if pumpjack then pumpjack.force = "player" end
end

__MODULE__.create_radar = function()
  local surface = __MODULE__.get()

  local radar = UTIL_ensure_entity(surface, {
    name = "linox-hidden_radar",
    position = {0,0},
    force = "player",
    create_build_effect_smoke = false,
  })
  radar.destructible = false;
  radar.minable = false;
  radar.operable = false;
end

__MODULE__.set_lighting = function(light)
  local surface = __MODULE__.get()

  if light then
    surface.daytime = 0;
  else
    surface.daytime = 0.5;
  end
  surface.freeze_daytime = true;
end

__MODULE__.expand_facility = function(level)
  local size = 8;
  local surface = game.get_surface(__LINOX_SURFACE__.facility);
  if not surface then return end

  surface.request_to_generate_chunks({0, 0}, 5)
  surface.force_generate_chunk_requests()

  if level == 1 then
    if surface.get_tile(0, -64).name ~= "linox-tile_out-of-map" then
      return
    end

    factory_builder.create_corridor(surface, {x = 0, y = -13}, "up", 48);
    factory_builder.create(surface, {x = 0, y = -64}, size);

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
        ghost.revive{raise_revive = (ghost.ghost_name == "blueprint-deployer2")};
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
      box3.insert{name = "linox-building_core-roboport", count = 10};
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
      box6.insert{name = "linox-building_fluid-elevator", count = 2};
      box6.insert{name = "linox-building_cargo-elevator", count = 2};
      box6.insert{name = "bulk-inserter", count = 50};
    end

  elseif level == 2 then
    factory_builder.create_corridor(surface, {x = 13, y = 0}, "right", 48);
    factory_builder.create(surface, {x = 64, y = 0}, size);
  elseif level == 3 then
    factory_builder.create_corridor(surface, {x = 0, y = 13}, "down", 48);
    factory_builder.create(surface, {x = 0, y = 64}, size);
  elseif level == 4 then
    factory_builder.create_corridor(surface, {x = -13, y = 0}, "left", 48);
    factory_builder.create(surface, {x = -64, y = 0}, size);

  elseif level == 5 then
    factory_builder.create_corridor(surface, {x = 56, y = -64}, "left", 48);
    factory_builder.create_corridor(surface, {x = 64, y = -56}, "down", 48);
    factory_builder.create(surface, {x = 64, y = -64}, size);
  elseif level == 6 then
    factory_builder.create_corridor(surface, {x = 56, y = 64}, "left", 48);
    factory_builder.create_corridor(surface, {x = 64, y = 56}, "up", 48);
    factory_builder.create(surface, {x = 64, y = 64}, 8);
  elseif level == 7 then
    factory_builder.create_corridor(surface, {x = -56, y = 64}, "right", 48);
    factory_builder.create_corridor(surface, {x = -64, y = 56}, "up", 48);
    factory_builder.create(surface, {x = -64, y = 64}, 8);
  elseif level == 8 then
    factory_builder.create_corridor(surface, {x = -56, y = -64}, "right", 48);
    factory_builder.create_corridor(surface, {x = -64, y = -56}, "down", 48);
    factory_builder.create(surface, {x = -64, y = -64}, 8);
  end
end;

return __MODULE__;