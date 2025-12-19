local linox_ground = require("scripts.svc.surface.linox-ground")
local linox_facility = require("scripts.svc.surface.linox-facility")
local linox_global = require("scripts.svc.surface.linox-global")


local function __update_technology(event)
  local force = game.forces["player"]
  local tech = force.technologies

  if not tech["linox-technology_planet-discovery-linox"].researched then return end
  linox_ground.create()

  if not tech["linox-technology_exploring-linox-landing-site"].researched then return end
  linox_facility.create()
  if not linox_ground.has_building() then
    linox_ground.create_building();
    linox_global.connect_surfaces();
  end

  local expand_facility_level = 0
  if tech["linox-technology_facility-factoryizing"].researched then
    expand_facility_level = 1

    if tech["linox-technology_expanding-factory-1"].researched then
      expand_facility_level = expand_facility_level + 1
    end

    if tech["linox-technology_expanding-factory-2"].researched then
      expand_facility_level = expand_facility_level + 1
    end

    if tech["linox-technology_expanding-factory-3"].researched then
      expand_facility_level = expand_facility_level + 1
    end

    if tech["linox-technology_expanding-factory-4"].researched then
      expand_facility_level = expand_facility_level + 1
    end

    if tech["linox-technology_expanding-factory-5"].researched then
      expand_facility_level = expand_facility_level + 1
    end

    if tech["linox-technology_expanding-factory-6"].researched then
      expand_facility_level = expand_facility_level + 1
    end

    if tech["linox-technology_expanding-factory-7"].researched then
      expand_facility_level = expand_facility_level + 1
    end
  end

  for level = 0, expand_facility_level do
    linox_facility.expand_facility(level)
  end

  if tech["linox-technology_rocket-silo-foundation"].researched then
    linox_ground.create_rocketsilo_foundation();
  end

  if tech["linox-technology_ground-platform-expansion"].researched then
    linox_ground.create_ground_platform_expansion();
  end

  if tech["linox-technology_ultra-deep-drilling"].researched then
    linox_facility.obtain_pumpjacks();
  end

  if tech["linox-technology_power-converter"].researched then
    UTIL_ensure_entity(linox_facility.get(), { name = "linox-hidden_reactive-power"}).energy = 1 * 1000 * 1000 * 1000;
  end

  if tech["linox-technology_outer-corridor-open"].researched then
    linox_facility.create_outer_corridor();
  end
end

UTIL_create_event_handler(defines.events.on_research_finished, __update_technology)
UTIL_create_event_handler(defines.events.on_research_reversed, __update_technology)




  -- elseif research.name == "linox-technology_planetary-power-network" then
  --   local surface = UTIL_ensure_surface("linox-planet_linox")
  --   surface.create_global_electric_network();
  --   local lppn1 = UTIL_ensure_entity(surface, { name = "linox-entity_hidden-electric-pole"})

  --   surface = UTIL_ensure_surface("linox-surface_linox-installation");
  --   surface.create_global_electric_network();
  --   local lppn2 = UTIL_ensure_entity(surface, { name = "linox-entity_hidden-electric-pole"})
  --   UTIL_ensure_entity(surface, { name = "linox-entity_reactive-power"}).energy = 1 * 1000 * 1000 * 1000;

  --   if lppn1 and lppn2 then
  --     local lppn1_connector = lppn1.get_wire_connector(defines.wire_connector_id.pole_copper, true);
  --     local lppn2_connector = lppn2.get_wire_connector(defines.wire_connector_id.pole_copper, true);
  --     lppn1_connector.connect_to(lppn2_connector, false);
  --   end

  --   lppn1 = surface.find_entities_filtered{
  --     name = "linox-entity_npc-power-converter",
  --     area = {{-15, -15}, {15, 15}},
  --     limit = 1,
  --   }

  --   if lppn1[1] then
  --     lppn1 = lppn1[1]
  --     lppn1.force = "player";
  --   end

  --   lppn1 = surface.find_entities_filtered{
  --     name = "linox-entity_npc-power-converter-output",
  --     area = {{-15, -15}, {15, 15}},
  --     limit = 1,
  --   }

  --   if lppn1[1] then
  --     lppn1 = lppn1[1]
  --     lppn1.force = "player";
  --   end



  -- elseif research.name == "linox-technology_planetary-power-network-capacity" then
  --   local surface = UTIL_ensure_surface("linox-surface_linox-installation");
  --   local tgt_battery_count = research.level - 1;
  --   local cur_battery_count = #surface.find_entities_filtered{position = {0, 0}, name = "linox-entity_planetary-power-network"}

  --   while tgt_battery_count > cur_battery_count do
  --     surface.create_entity{
  --       name = "linox-entity_planetary-power-network",
  --       position = {0,0},
  --       force = "player",
  --     }
  --     cur_battery_count = cur_battery_count + 1;
  --   end

  --   while cur_battery_count > tgt_battery_count do
  --     local bty = surface.find_entity("linox-entity_planetary-power-network", {0, 0});
  --     if bty then 
  --       bty.destroy();
  --     end
  --     cur_battery_count = cur_battery_count - 1;
  --   end