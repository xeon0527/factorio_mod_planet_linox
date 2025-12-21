
local __PREFIX = "linox-gui-window_"

local function __create_title_bar(gui_name, parent, caption)
  local title_flow = parent.add{
    type = "flow",
    direction = "horizontal",
    style = "horizontal_flow",
  }
  title_flow.style.vertical_align = "center";

  title_flow.add {
    type = "label",
    caption = caption,
    style = "frame_title",
  }

  local title_drag = title_flow.add {
    type = "empty-widget",
    style = "draggable_space",
  }
  title_drag.style.horizontally_stretchable = true;
  title_drag.style.height = 24;
  title_drag.drag_target = parent;
  title_drag.style.left_margin = 10;
  title_drag.style.right_margin = 10;
  title_drag.style.vertical_align = "center";

  local title_close = title_flow.add {
    type = "button",
    name = __PREFIX..gui_name.."_close",
    caption = "[virtual-signal=shape-diagonal-cross]",
    style = "red_button",
    mouse_button_filter = {"left"},
  }
  title_close.style.size = { 48, 24 }
  title_close.style.padding = 0;
  title_close.style.margin = 0;

  return {
    flow = title_flow,
    drag = title_drag,
    close = title_close,
  }
end

local __MODULE__ = {}

__MODULE__.create = function(gui_name, player, caption)
  local frame = player.gui.screen.add {
    type = "frame",
    name = __PREFIX..gui_name.."_frame",
    direction = "vertical",
  }
  frame.style.width = 800;
  frame.style.height = 600;
  frame.style.horizontal_align = "center";
  frame.force_auto_center();
  player.opened = frame;

  local title_bar = __create_title_bar(gui_name, frame, caption)

  return {
    gui_name = gui_name,
    player = player,
    
    frame = frame,
    title_bar = title_bar,
  }
end

__MODULE__.is_opened = function(gui_name, player)
  for _, gui in pairs(player.gui.screen.children) do
    if gui.valid and gui.name == (gui_name.."_frame") then
      return true
    end
  end
  return false
end

__MODULE__.destroy = function(gui_name, player)
  if player ~= nil then
    local gui_id = __PREFIX..gui_name.."_frame"
    if player.gui.screen[gui_id] then
      player.gui.screen[gui_id].destroy();
    end
  end
end

UTIL_create_event_handler(defines.events.on_gui_closed, function(event)
  if event.player_index and event.element and event.element.valid and event.element.name == __PREFIX.."-frame" then
    __MODULE__.close(game.get_player(event.player_index));
  end
end)

return __MODULE__