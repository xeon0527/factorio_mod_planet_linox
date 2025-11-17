local function __check_linox_orbit()
  for _, surface in pairs(game.surfaces) do
    if surface.platform and surface.platform.hub and surface.platform.state ~= defines.space_platform_state.on_the_path then
      local platform = surface.platform
---@diagnostic disable-next-line: need-check-nil
      if platform.space_location and platform.space_location.name == "linox-planet_linox" then
        return true;
      end
    end
  end
  return false;
end

local function __check_research()
  local force = game.forces["player"]
  if force.current_research and force.current_research.name == "linox-technology_exploring-linox-landing-site" and not __check_linox_orbit() then
    game.print("SYSTEM :: 리녹스 착륙 지점 탐색 연구는 리녹스 행성 궤도에 우주선이 있어야 합니다. 연구가 취소 되었습니다.");
    force.cancel_current_research()
  end
end


UTIL_create_event_handler(defines.events.on_space_platform_changed_state, function(event)
  __check_research()
end)

UTIL_create_event_handler(defines.events.on_research_started, function(event)
  __check_research()
end)