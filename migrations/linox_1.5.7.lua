---@diagnostic disable: cast-local-type
local linox_ground = require("scripts.svc.surface.linox-ground")

if linox_ground.get() then
  local surface = linox_ground.get()
  
  UTIL_ensure_entity(surface, {
    name = "linox-special_emergency-escape-shuttle",
    force = "neutral",
    position = { -11, -11 }
  })

  UTIL_ensure_entity(surface, {
    name = "linox-special_emergency-escape-shuttle",
    force = "neutral",
    position = { -8, -11 }
  })

  UTIL_ensure_entity(surface, {
    name = "linox-special_emergency-escape-shuttle",
    force = "neutral",
    position = { -10, -9 }
  })
end