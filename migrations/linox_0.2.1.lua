local linox_ground = require("scripts.svc.surface.linox-ground")

if linox_ground.get() then
  local surface = linox_ground.get()
  surface.daytime = 0;
  surface.freeze_daytime = true;
end