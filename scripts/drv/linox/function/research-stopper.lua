local function __check_linox_orbit()
  for _, surface in pairs(game.surfaces) do
    if surface.platform and surface.platform.hub and surface.platform.state ~= defines.space_platform_state.on_the_path then
      local platform = surface.platform
---@diagnostic disable-next-line: need-check-nil
      if platform.space_location and platform.space_location.name == __LINOX_SURFACE__.planet then
        return true;
      end
    end
  end
  return false;
end

local function __check_research(event)
  local force = game.forces["player"]
  if force.current_research and force.current_research.name == "linox-technology_exploring-linox-landing-site" and not __check_linox_orbit() then
    game.print({"system.linox-orbit"});
    force.cancel_current_research()
  end
end


UTIL_create_event_handler(defines.events.on_space_platform_changed_state, __check_research)
UTIL_create_event_handler(defines.events.on_research_started, __check_research)