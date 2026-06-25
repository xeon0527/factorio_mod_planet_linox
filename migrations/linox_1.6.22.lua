---@diagnostic disable: cast-local-type, need-check-nil
local linox_facility = require("scripts.svc.surface.linox-facility")

local surface = linox_facility.get()
if surface then
  surface.set_property("linox-no-nuke", 1)
end