local linox_ground = require("scripts.svc.surface.linox-ground")
local techs = game.forces["player"].technologies

if linox_ground.get() and techs["linox-technology_rocket-silo-foundation"].researched then
  linox_ground.create_rocketsilo_foundation()
end