local util = require("util")
local db = require("scripts.svc.database")

local prefix_name = "linox-gui-techshop"
local __MODULE__ = {}

local function __get_session(player)
  return db.get_player(player, prefix_name.."-session", {});
end

local function __remove_session(player)
  db.set_player(player, prefix_name.."-session", nil);
end

local function __is_gui_opened(player)
  for _, gui in pairs(player.gui.screen.children) do
    if gui.valid and gui.name == (prefix_name.."-frame") then
      return true
    end
  end
  return false
end

UTIL_create_event_handler(defines.events.on_gui_click, function(event)
  local element = event.element;
  local player = game.players[event.player_index];

  -- 좌클릭만 인식, name이 linox-ui-techshop로 시작되는 엘리먼트만 인식
  if element.valid and event.button == defines.mouse_button_type.left and util.string_starts_with(element.name, prefix_name) then
    if element.name == prefix_name.."-close" then
      __MODULE__.close(player);
      else
      local strStart = string.find(element.name, prefix_name.."-purchase", 1, true)
      if strStart == 1 then
        local datas = UTIL_string_split(element.name, "::::");
        local _tech_name_ = datas[2]
        local tech = game.forces["player"].technologies[_tech_name_]
        if not tech.researched then
          local inv = player.get_inventory(defines.inventory.character_main)
          if not inv then return end

          local session = __get_session(player)
          local costs = session.tech_costs[_tech_name_]

          for item_name, cost in pairs(costs) do
            if inv.get_item_count(item_name) < cost then
              player.print({"system.lorax-tech-shop-item-shortage"})
              return
            end
          end

          for item_name, cost in pairs(costs) do
            inv.remove{name=item_name, count = cost}
          end
          player.force.script_trigger_research(tech.name);
          player.force.script_trigger_research(tech.name);
          __MODULE__.refresh(player)
        end
      end
    end
  end
end)

--name = prefix_name.."-purchase::::"..tech_name,

UTIL_create_event_handler(defines.events.on_gui_closed, function(event)
  if event.player_index and event.element and event.element.valid and event.element.name == prefix_name.."-frame" then
    __MODULE__.close(game.get_player(event.player_index));
  end
end)

local function __create_frame(player)
  __MODULE__.close(player);

  local frame = player.gui.screen.add {
    type = "frame",
    name = prefix_name.."-frame",
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
    name = prefix_name.."-close",
    caption = "[virtual-signal=shape-diagonal-cross]",
    style = "red_button",
    mouse_button_filter = {"left"},
  }
  title_close.style.size = { 48, 24 }
  title_close.style.padding = 0;
  title_close.style.margin = 0;
end

local function __create_tech_list(frame)
  local list_scroll = frame.add{
    type = "scroll-pane",
    horizontal_scroll_policy = "never",
    vertical_scroll_policy = "always"
  }
  list_scroll.style.horizontally_stretchable = true;
  list_scroll.style.vertically_stretchable = true;

  local tech_list = list_scroll.add {
    type = "table",
    column_count = 1,
    vertical_centering = false,
  }
  tech_list.style.horizontally_stretchable = true;
  return {
    scroll = list_scroll,
    list = tech_list,
  }
end

__MODULE__.create = function(player, caption)
  if __is_gui_opened(player) then return false end

  local frame = __create_frame(player)
  __create_title_bar(frame, caption);
  local tech_list = __create_tech_list(frame)

  db.set_player(player, prefix_name.."-session", {
    frame = frame,
    scroll = tech_list.scroll,
    list = tech_list.list,
    tech_btns = {},
    temp_data = nil,
  });
  return true
end

__MODULE__.add_tech = function(player, sprite, tech_name, tech_costs)
  local session = __get_session(player);
  local force = game.forces["player"]
  local tech = force.technologies[tech_name]
  --local tech_proto = data.raw["technology"][tech_name]
  local list = session.list

  
  local tech_btn = list.add {
    type = "button",
    name = prefix_name.."-purchase::::"..tech_name,
  }
  tech_btn.style.horizontally_stretchable = true
  tech_btn.style.height = 128
  tech_btn.style.margin = 0
  tech_btn.style.padding = 0

  local h_flow = tech_btn.add {
    type = "flow",
    direction = "horizontal",
  }
  h_flow.style.horizontally_stretchable = true
  h_flow.style.vertically_stretchable = true
  h_flow.style.horizontal_align = "left"
  h_flow.style.vertical_align = "center"
  h_flow.style.margin = 0
  h_flow.style.padding = 0

  local icon = h_flow.add {
    type = "sprite",
    sprite = sprite,
    resize_to_sprite = false,
  }
  icon.style.padding = 0
  icon.style.margin = 0
  icon.style.size = 120

  local place_text_v_flow = h_flow.add {
    type = "flow",
    direction = "vertical",
  }
  place_text_v_flow.style.vertically_stretchable = true
  place_text_v_flow.style.vertical_align = "top"
  place_text_v_flow.style.padding = 0
  place_text_v_flow.style.margin = 0
  
  local tech_caption_flow = place_text_v_flow.add {
    type = "flow",
    direction = "vertical",
  }
  tech_caption_flow.style.natural_height = 24;
  tech_caption_flow.style.margin = 0;
  tech_caption_flow.style.padding = 3;
  tech_caption_flow.style.vertical_align = "center";
  
  local tech_caption = tech_caption_flow.add { type = "label", caption = tech.localised_name, style = "frame_title" };
  tech_caption.style.margin = 0;
  tech_caption.style.padding = 0;
  tech_caption.style.font_color = {0,0,0}


  local tech_description_flow = place_text_v_flow.add {
    type = "flow",
    direction = "horizontal",
  }
  tech_description_flow.style.natural_height = 24;
  tech_description_flow.style.margin = 0;
  tech_description_flow.style.padding = 3;
  tech_description_flow.style.vertical_align = "center";
  tech_description_flow.style.width = 605
  tech_description_flow.style.vertically_stretchable = true
  
  local tech_description = tech_description_flow.add { type = "label", caption = tech.localised_description, };
  tech_description.style.margin = 0;
  tech_description.style.padding = 0;
  tech_description.style.single_line = false;
  tech_description.style.vertically_stretchable = true
  tech_description.style.font_color = {0,0,0}


  local tech_cost_flow = place_text_v_flow.add {
    type = "flow",
    direction = "vertical",
  }
  tech_cost_flow.style.natural_height = 24;
  tech_cost_flow.style.margin = 0;
  tech_cost_flow.style.padding = 3;
  tech_cost_flow.style.vertical_align = "center";

  local tech_cost_text = ""

  for item_name, cost in pairs(tech_costs) do
    tech_cost_text = tech_cost_text.."[item="..item_name.."] "..tostring(cost).."    "
  end

  local tech_cost = tech_cost_flow.add { type = "label", caption = tech_cost_text };
  tech_cost.style.margin = 0;
  tech_cost.style.padding = 0;
  tech_cost.style.font_color = {0,0,0}

  session.tech_costs = session.tech_costs or {}
  session.tech_costs[tech_name] = tech_costs

  table.insert(session.tech_btns, {
    caption = tech_caption,
    description = tech_description,
    btn = tech_btn,
    tech = tech,
  })
end

__MODULE__.refresh = function(player)
  local session = __get_session(player);
  for _, techs in pairs(session.tech_btns) do
    local tech = techs.tech
    if tech.researched then
      techs.btn.enabled = false

      local caption = techs.caption.caption
      if #caption == 1 then
        techs.caption.caption = {
          "", caption, " [virtual-signal=signal-check]"
        }
      elseif #caption > 1 and caption[1] == "" then
        local check_string = caption[#caption]
        if check_string ~= " [virtual-signal=signal-check]" then
          table.insert(caption, " [virtual-signal=signal-check]")
          techs.caption.caption = caption
        end
      end
    else
      local force_tech = game.forces["player"].technologies
      local prerequisites = tech.prerequisites
      techs.btn.enabled = true
      for _, p in pairs(prerequisites) do
        if not force_tech[p.name].researched then
          techs.btn.enabled = false
          break
        end
      end
    end
  end
end

__MODULE__.close = function(player)
  if player ~= nil then
    if player.gui.screen[prefix_name.."-frame"] then
      player.gui.screen[prefix_name.."-frame"].destroy();
    end

    __remove_session(player)
  end
end

return __MODULE__