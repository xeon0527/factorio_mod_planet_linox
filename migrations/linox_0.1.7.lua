local linox_facility = require("scripts.svc.surface.linox-facility")
local npc = require("scripts.svc.npc")

if linox_facility.get() then
  local network_terminal = npc.get(npc.type.network_terminal, linox_facility.get())
  if network_terminal then
    network_terminal.insert { name = "linox-item_enable-entity", count = 1000 }
  end
end