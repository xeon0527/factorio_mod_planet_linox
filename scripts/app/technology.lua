local linox = require("scripts.svc.surface.linox")
local linox_ist = require("scripts.svc.surface.linox-installation")

UTIL_create_event_handler(defines.events.on_research_finished, function(event)
  local research = event.research
  if research.name == "linox-technology_exploring-linox-landing-site" then
    local surface = UTIL_ensure_surface("linox-planet_linox")
    event.research.force.chart(surface, {{x = -64, y = -64}, {x = 63, y = 63}})
    linox.create_building();
  


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

  elseif research.name == "linox-technology_facility-factoryizing" then
    linox_ist.expand_facility(1);

  elseif research.name == "linox-technology_expanding-factory" then
    if research.researched then
      linox_ist.expand_facility(8);
    else
      linox_ist.expand_facility(research.level);
    end
  


  elseif research.name == "linox-technology_rocket-silo-foundation" then
    linox.create_rocketsilo_foundation();



  elseif research.name == "linox-technology_ultra-deep-drilling" then
    local surface = UTIL_ensure_surface("linox-surface_linox-installation");

    if surface then
      local pumpjack = surface.find_entity("linox-entity_deep-oil-pumpjack", { -10.5, 10.5 })
      if pumpjack then pumpjack.force = "player" end

      pumpjack = surface.find_entity("linox-entity_sulfuric-acid-pumpjack", { 10.5, 10.5 })
      if pumpjack then pumpjack.force = "player" end
    end
  end
end)