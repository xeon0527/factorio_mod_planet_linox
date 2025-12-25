local npc = require("scripts.svc.npc")

UTIL_create_event_handler("linox-custom-event_on-surface-complete", function(event)
  local surface = event.surface;
  if surface.name == __LINOX_SURFACE__.facility then
    npc.create(npc.type.lorax, surface, {x = -17, y = -17});
    npc.create(npc.type.network_terminal, surface, {x = -8, y = -17});
    npc.create(npc.type.power_converter, surface, {x = -17, y = -6});
  end
end)