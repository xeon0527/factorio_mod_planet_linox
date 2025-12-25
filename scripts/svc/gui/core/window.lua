
local db = require("scripts.svc.database")

local __PREFIX = "linox-gui-window"


local function __get_prefix(gui_id, name)
  local _name = name or "frame"
  return __PREFIX.."_"..gui_id.."_".._name
end

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
    name = __get_prefix(gui_name, "close"),
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

__MODULE__.open = function(gui_id, player, caption, user_data, event_handler)
  if __MODULE__.is_opened(gui_id, player) then return nil end

  local frame = player.gui.screen.add {
    type = "frame",
    name = __get_prefix(gui_id),
    direction = "vertical",
  }
  frame.style.width = 800;
  frame.style.height = 600;
  frame.style.horizontal_align = "center";
  frame.force_auto_center();
  player.opened = frame;

  local title_bar = __create_title_bar(gui_id, frame, caption)

  local session = {
    gui_id = gui_id,
    player = player,
    frame = frame,
    title_bar = title_bar,
    user_data = user_data,
    event_handler = event_handler,
  }

  db.set_player(player, __get_prefix(gui_id, "session"), session)
  return session
end

__MODULE__.is_opened = function(gui_id, player)
  for _, gui in pairs(player.gui.screen.children) do
    if gui.valid and gui.name == __get_prefix(gui_id) then
      return true
    end
  end
  return false
end

__MODULE__.destroy = function(gui_id, player)
  if player ~= nil then
    local gui_id = __get_prefix(gui_id)
    if player.gui.screen[gui_id] then
      player.gui.screen[gui_id].destroy();
    end

    db.set_player(player, __get_prefix(gui_id, "session"), nil)
  end
end

__MODULE__.get_session = function(gui_id, player)
  return db.get_player(player, __get_prefix(gui_id, "session"));
end

__MODULE__.get_user_data = function(gui_id, player)
  local session = __MODULE__.get_session(gui_id, player)
  if session then
    return session.user_data
  end
  return nil
end

__MODULE__.set_user_data = function(gui_id, player, user_data)
  local session = __MODULE__.get_session(gui_id, player)
  if session then
    session.user_data = user_data
    db.set_player(player, __get_prefix(gui_id, "session"), session)
  end
end

UTIL_create_event_handler(defines.events.on_gui_click, function(event)
  if event.player_index and event.element and event.element.valid and util.string_starts_with(event.element.name, __PREFIX) then
    local str = UTIL_string_split(event.element.name, "_");
    if #str >= 3 and str[#str] == "close" then
      __MODULE__.destory(str[2], game.get_player(event.player_index))
    end
  end
end)

UTIL_create_event_handler(defines.events.on_gui_closed, function(event)
  if event.player_index and event.element and event.element.valid and util.string_starts_with(event.element.name, __PREFIX) then
    local str = UTIL_string_split(event.element.name, "_");
    if #str >= 3 and str[#str] == "frame" then
      __MODULE__.destory(str[2], game.get_player(event.player_index))
    end
  end
end)

return __MODULE__