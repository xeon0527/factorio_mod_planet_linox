local linox_facility = require("scripts.svc.surface.linox-facility")
local npc = require("scripts.svc.npc")
local util_surface = require("scripts.util.surface")

if linox_facility.get() then
  util_surface.fill_tile {
    surface = linox_facility.get(),
    tile_name = "linox-tile_linox-datacenter",
    x1 = -21,
    y1 = -21,
    x2 = -14,
    y2 = -11,
  }

  util_surface.fill_tile {
    surface = linox_facility.get(),
    tile_name = "linox-tile_linox-datacenter",
    x1 = 13,
    y1 = -17,
    x2 = 16,
    y2 = -11,
  }

  local network_terminal = npc.get(npc.type.network_terminal, linox_facility.get())
  if network_terminal then
    network_terminal.destroy()
    npc.create(npc.type.network_terminal, linox_facility.get(), {x = 15, y = -15}).insert { name = "linox-item_enable-entity", count = 1000 }
  end

  local lorax = npc.get(npc.type.lorax, linox_facility.get())
  if lorax then
    lorax.destroy()
    npc.create(npc.type.lorax, linox_facility.get(), {x = -17, y = -17}).insert { name = "linox-item_enable-entity", count = 1000 }
  end
end