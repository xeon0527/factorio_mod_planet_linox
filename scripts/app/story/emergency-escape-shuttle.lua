local entity_mon = require("scripts.svc.gui.entity-monitor")

UTIL_create_event_handler("linox-custom-event_on-entity-click", function(event)
  if event.entity.name == "linox-special_emergency-escape-shuttle" and event.player.character then
    local surface = event.player.character.surface
    if surface.name == __LINOX_SURFACE__.ground then
      if not entity_mon.create(event.player, "Emergency Escape Shuttle", event.entity) then return end

      entity_mon.add_text(event.player, {"system.ee-shuttle-1"})
      entity_mon.add_text(event.player, {"system.ee-shuttle-2"})
      entity_mon.add_text(event.player, "")
      entity_mon.add_text(event.player, {"system.ee-shuttle-3"}, "center")
      entity_mon.add_text(event.player, {"system.ee-shuttle-4"}, "center")
      entity_mon.add_text(event.player, {"system.ee-shuttle-5"}, "center")
    end
  end
end)