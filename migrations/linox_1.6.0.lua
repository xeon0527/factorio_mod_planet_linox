---@diagnostic disable: cast-local-type, need-check-nil
local linox_facility = require("scripts.svc.surface.linox-facility")

if linox_facility.get() then
  local surface = linox_facility.get()
  local entity = UTIL_ensure_entity(surface, {name = "linox-special_facility-elevator", position = {0,0}})
  entity.health = entity.max_health 
  entity.destructible = false
  entity.minable = false
  entity.operable = false
end