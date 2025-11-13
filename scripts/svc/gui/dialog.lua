local util = require("util")

__UI_DIALOG_SESSION__ = __UI_DIALOG_SESSION__ or {};

local prefix_name = "linox-gui-dialog"
local __MODULE__ = {}

UTIL_create_event_handler(defines.events.on_player_joined_game, function(event)
  --local player = game.get_player(event.player_index)
  __MODULE__.close(game.get_player(event.player_index));
end)

-- dialog의 버튼을 누르면 linox-on-dialog-select 이벤트를 생성함.
UTIL_create_event_handler(defines.events.on_gui_click, function(event)
  local element = event.element;
  local player = game.players[event.player_index];

  -- 좌클릭만 인식, name이 linox-ui-dialog로 시작되는 엘리먼트만 인식
  if event.button == defines.mouse_button_type.left and util.string_starts_with(element.name, prefix_name) then
    local session = __UI_DIALOG_SESSION__[player.index];

    if element.name == prefix_name.."-close" or session == nil then
      __MODULE__.close(player);
    else
      local strStart, strEnd = string.find(element.name, prefix_name.."-talk-select-", 1, true)
      if strStart == 1 then
        local name_id = string.sub(element.name, strEnd + 1)
        strStart = string.find(name_id, "::::", 1, true)
        
        local _name_  = string.sub(name_id, 1, strStart - 1);
        local _id_    = string.sub(name_id, strStart + 4);
        if session.name == _name_ then 
          script.raise_event("linox-custom-event_gui-dialog-on-select", {
            player = player,
            name = session.name,
            select_id = _id_,
          })
        end
      end
    end
  end
end)

UTIL_create_event_handler(defines.events.on_gui_closed, function(event)
  if event.player_index and event.element and event.element.name == prefix_name.."-frame" then
    __MODULE__.close(game.get_player(event.player_index));
  end
end)



__MODULE__.talker = {
  player = 1,
  partner = 2,
  partner_anger = 3,
  partner_friendly = 4,
  narration = 5,
}


__MODULE__.create = function(player, caption, session_name, sprite)
  __MODULE__.close(player);

  local frame = player.gui.screen.add {
    type = "frame",
    name = prefix_name.."-frame",
    direction = "vertical",
  }
  frame.style.width = 800;
  frame.style.minimal_height = 600;
  frame.style.horizontal_align = "center";
  frame.force_auto_center();

  player.opened = frame;

    local title_flow = frame.add{
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
      title_drag.drag_target = frame;
      title_drag.style.left_margin = 10;
      title_drag.style.right_margin = 10;
      title_drag.style.vertical_align = "center";

      local title_close = title_flow.add {
        type = "button",
        name = prefix_name.."-close",
        caption = "[virtual-signal=shape-diagonal-cross]",
        style = "red_button"
      }
      title_close.style.size = { 48, 24 }
      title_close.style.padding = 0;
      title_close.style.margin = 0;
      

    local partner_image = frame.add {
      type = "sprite",
      sprite = sprite,
      resize_to_sprite = false,
    }
    partner_image.style.height = 300;
    partner_image.style.horizontally_stretchable = true;
    partner_image.style.horizontal_align = "center";
    partner_image.style.vertical_align = "center";

      local dialog_log_scroll = frame.add{
        type = "scroll-pane",
        horizontal_scroll_policy = "never",
        vertical_scroll_policy = "auto-and-reserve-space"
      }
      dialog_log_scroll.style.horizontally_stretchable = true;
      dialog_log_scroll.style.height = 250;

        local dialog_log_list = dialog_log_scroll.add{
          type = "table",
          column_count = 1,
        }
        dialog_log_list.style.horizontally_stretchable = true;
  
  __UI_DIALOG_SESSION__[player.index] = {
    name = session_name,
    frame = frame,
    partner_image = partner_image,
    log_scroll = dialog_log_scroll,
    log_list = dialog_log_list,
  }
end

__MODULE__.close = function(player)
  if player ~= nil then
    if player.gui.screen[prefix_name.."-frame"] then
      player.gui.screen[prefix_name.."-frame"].destroy();
    end
    __UI_DIALOG_SESSION__[player.index] = nil;
  end
end

__MODULE__.add_talk = function(player, talk, text)
  local session = __UI_DIALOG_SESSION__[player.index];

  local log_list = session.log_list;
  local log_flow = log_list.add{
    type = "flow",
    direction = "vertical",
  };
  log_flow.style.height = 24;
  log_flow.style.margin = 0;
  log_flow.style.padding = 4;
  log_flow.style.vertical_align = "center";
  log_flow.style.horizontally_stretchable = true;

  local log = log_flow.add{ type = "label", caption = text, };
  log.style.margin = 0;
  log.style.padding = 0;
  log.style.horizontally_stretchable = true;

  if talk == __MODULE__.talker.player then
    log.style.font_color = { 1, 1, 0, 1 };
    log_flow.style.horizontal_align = "right";
  elseif talk == __MODULE__.talker.partner then
    log.style.font_color = { 1, 1, 1, 1 };
    log_flow.style.horizontal_align = "left";
  elseif talk == __MODULE__.talker.partner_anger then
    log.style.font_color = { 1, 0, 0, 1 };
    log_flow.style.horizontal_align = "left";
  elseif talk == __MODULE__.talker.partner_friendly then
    log.style.font_color = { 0, 1, 0, 1 };
    log_flow.style.horizontal_align = "left";
  elseif talk == __MODULE__.talker.narration then
    log.style.font_color = { 0.5, 0.5, 0.5, 1 };
    log_flow.style.horizontal_align = "center";
  end

  session.log_scroll.scroll_to_bottom();
end

__MODULE__.add_select = function(player, id, text)
  local session = __UI_DIALOG_SESSION__[player.index];
  local frame = session.frame;

  local talk_button = frame.add{
    type = "button",
    name = prefix_name.."-talk-select-"..session.name.."::::"..id,
    caption = text,
    style = "green_button",
    tooltip = "",
    elem_tooltip = nil,
  };
  talk_button.style.height = 30;
  talk_button.style.margin = 4;
  talk_button.style.padding = 4;
  talk_button.style.horizontal_align = "center";
  talk_button.style.horizontally_stretchable = true;
end

__MODULE__.clear_select = function(player)
  local session = __UI_DIALOG_SESSION__[player.index];
  local frame = session.frame;

  for _, child in pairs(frame.children) do
    if util.string_starts_with(child.name, prefix_name.."-talk-select-") then
      child.destroy();
    end
  end
end

return __MODULE__;