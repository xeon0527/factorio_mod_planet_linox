local util = require("util")
local db = require("scripts.svc.database")

local __PREFIX = "linox-gui-entity-monitor"
local __MODULE__ = {}

local function __get_session(player)
  return db.get_player(player, __PREFIX.."-session", {});
end

local function __remove_session(player)
  db.set_player(player, __PREFIX.."-session", nil);
end

local function __is_gui_opened(player)
  for _, gui in pairs(player.gui.screen.children) do
    if gui.valid and gui.name == (__PREFIX.."-frame") then
      return true
    end
  end
  return false
end

UTIL_create_event_handler(defines.events.on_gui_click, function(event)
  local element = event.element;
  local player = game.players[event.player_index];
  
  if element.valid and event.button == defines.mouse_button_type.left and util.string_starts_with(element.name, __PREFIX) then
    local session = __get_session(player);

    if element.name == __PREFIX.."-close" or session == nil then
      __MODULE__.close(player);
    elseif element.name == __PREFIX.."-red-button" then
      __MODULE__.close(player);
      if session.entity.valid then
        local surface = game.get_surface("vulcanus")
        if surface then
          local force = player.force
          local pos = force.get_spawn_position(surface)
          player.get_main_inventory().clear()
          player.teleport(pos, surface)
          session.entity.destroy()
        else
          player.print{"system.ee-shuttle-error-2"}
        end
      else
        player.print{"system.ee-shuttle-error-1"}
      end
    end
  end
end)

UTIL_create_event_handler(defines.events.on_gui_closed, function(event)
  if event.player_index and event.element and event.element.valid and event.element.name == __PREFIX.."-frame" then
    __MODULE__.close(game.get_player(event.player_index));
  end
end)

local function __create_frame(player)
  __MODULE__.close(player);

  local frame = player.gui.screen.add {
    type = "frame",
    name = __PREFIX.."-frame",
    direction = "vertical",
  }
  frame.style.width = 800;
  frame.style.height = 600;
  frame.style.horizontal_align = "center";
  frame.force_auto_center();
  player.opened = frame;
  return frame
end

local function __create_title_bar(parent, caption)
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
    name = __PREFIX.."-close",
    caption = "[virtual-signal=shape-diagonal-cross]",
    style = "red_button",
    mouse_button_filter = {"left"},
  }
  title_close.style.size = { 48, 24 }
  title_close.style.padding = 0;
  title_close.style.margin = 0;
end

__MODULE__.create = function(player, caption, entity)
  if __is_gui_opened(player) then return false end

  local frame = __create_frame(player)
  __create_title_bar(frame, caption);

  local camera_frame = frame.add {
    type = "scroll-pane",
    style = "list_box_scroll_pane",
    horizontal_scroll_policy = "never",
    vertical_scroll_policy = "never"
  }
  camera_frame.style.horizontally_stretchable = true
--camera_frame.style.height = 300

    local entity_camera = camera_frame.add {
      type = "camera",
      position = {0,0},
    }
    entity_camera.entity = entity
    entity_camera.zoom = 1.5
    entity_camera.style.horizontally_stretchable = true
    entity_camera.style.vertically_stretchable = true


  local text_frame = frame.add {
    type = "scroll-pane",
    horizontal_scroll_policy = "never",
    vertical_scroll_policy = "always"
  }
  text_frame.style.horizontally_stretchable = true;
  text_frame.style.height = 200;

    local text_table = text_frame.add {
      type = "table",
      column_count = 1,
    }
    text_table.style.horizontally_stretchable = true

  local btn = frame.add {
    type = "button",
    name = __PREFIX.."-red-button",
    style = "red_button",
    caption = {"system.ee-shuttle-red-button"},
    tooltip = "",
    elem_tooltip = nil,
    mouse_button_filter = {"left"},
  }
  btn.style.height = 50;
  btn.style.margin = 2;
  btn.style.padding = 2;
  btn.style.horizontal_align = "center";
  btn.style.horizontally_stretchable = true;

  db.set_player(player, __PREFIX.."-session", {
    frame = frame,
    entity = entity,
    log_scroll = text_frame,
    log_list = text_table,
  });
  return true
end

__MODULE__.close = function(player)
  if player ~= nil then
    if player.gui.screen[__PREFIX.."-frame"] then
      player.gui.screen[__PREFIX.."-frame"].destroy();
    end
    __remove_session(player)
  end
end

__MODULE__.add_text = function(player, text, align)
  local session = __get_session(player);

  local log_list = session.log_list;
  local log_flow = log_list.add{
    type = "flow",
    direction = "vertical",
  };
  log_flow.style.natural_height = 24;
  log_flow.style.margin = 0;
  log_flow.style.padding = 3;
  log_flow.style.vertical_align = "center";
  log_flow.style.horizontally_stretchable = true;

  local log = log_flow.add{ type = "label", caption = text, };
  log.style.margin = 0;
  log.style.padding = 0;
  log.style.horizontally_stretchable = true;
  log.style.single_line = false;
  --log.style.vertically_stretchable = true;

  local _align = align or "left"
  log_flow.style.horizontal_align = _align;

  session.log_scroll.scroll_to_bottom();
end

return __MODULE__