local linox_ground = require("scripts.svc.surface.linox-ground")
local linox_facility = require("scripts.svc.surface.linox-facility")
local linox_global = require("scripts.svc.surface.linox-global")

if linox_ground.get() then
  local surface = linox_ground.get()

  local entity = surface.find_entity("linox-hidden_electric-pole", {0,0});
  if entity then
    entity.destroy()
  end

  entity = UTIL_ensure_entity(surface, { name = "linox-special_circuit-pole", position = {-2,2}})
  entity.destructible = false
  entity.minable = false
  entity.rotatable = false
end

if linox_facility.get() then
  local surface = linox_facility.get()

  local entity = surface.find_entity("linox-hidden_electric-pole", {0,0});
  if entity then
    entity.destroy()
  end

  entity = UTIL_ensure_entity(surface, { name = "linox-special_circuit-pole", position = {-2,2}})
  entity.destructible = false
  entity.minable = false
  entity.rotatable = false
end

linox_global.connect_surfaces()