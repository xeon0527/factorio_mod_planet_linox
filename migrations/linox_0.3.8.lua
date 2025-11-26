local linox_facility = require("scripts.svc.surface.linox-facility")
local util_surface    = require("scripts.util.surface")
local npc = require("scripts.svc.npc")

local surface = linox_facility.get()
if surface then
  util_surface.fill_tile {
    surface = surface,
    tile_name = "linox-tile_linox-datacenter",
    x1 = -17,
    y1 = 9,
    x2 = -14,
    y2 = 16,
  }

  npc.create(npc.type.power_converter, surface, {x = -15, y = 15});
end