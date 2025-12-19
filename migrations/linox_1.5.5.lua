---@diagnostic disable: cast-local-type
local linox_ground = require("scripts.svc.surface.linox-ground")
local linox_facility = require("scripts.svc.surface.linox-facility")

if linox_ground.get() then
  local surface = linox_ground.get()

  local entity = surface.find_entities_filtered{name = "linox-special_circuit-pole"};
  if entity and #entity > 0 then
    entity[1].teleport({0,2});
  end
end

if linox_facility.get() then
  local surface = linox_facility.get()

  local entity = surface.find_entities_filtered{name = "linox-special_circuit-pole"};
  if entity and #entity > 0 then
    entity[1].teleport({0,2});
  end


  entity = surface.find_entity("linox-building_cargo-landing-pad", {0, 0})
  if entity then
    entity.destroy()
  end

  UTIL_ensure_entity(surface, {
    name = "linox-special_facility-elevator",
    position = {0,0},
    force = "neutral",
    create_build_effect_smoke = false,
  });
end