local npc = require("scripts.svc.npc")

UTIL_create_event_handler("linox-custom-event_on-surface-complete", function(event)
  local surface = event.surface;
  if surface.name == "linox-surface_linox-installation" then
    npc.create(npc.type.lorax, surface, {x = -10, y = -10});
    npc.create(npc.type.network_terminal, surface, {x = 10, y = -10});
    --npc.create(npc.type.power_converter, surface, {x = 10, y = 10});
  end
end)