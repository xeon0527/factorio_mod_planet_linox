---@diagnostic disable: param-type-mismatch
local db = require("scripts.drv.storage")
local bootstrap = require("scripts.drv.bootstrap")
--require("scripts.util.event-handler")

if game and game.simulation then return end

db.ensure("rbp-text-loader.requests", {})
db.ensure("rbp-text-loader.locale", {})

local __string_key = {
  --{"rbp-example.language-code"}, 현지화 텍스트 유무 체크용
  {"rbp-example.panel_description_1"},
  {"rbp-example.panel_description_1_1"},
  {"rbp-example.panel_description_1_2"},
  {"rbp-example.panel_description_2"},
  {"rbp-example.panel_description_2_1"},
  {"rbp-example.panel_description_2_2"},
  {"rbp-example.panel_stage"},
  {"rbp-example.panel_request"},
  {"rbp-example.combinator_turn_on"},
  {"rbp-example.combinator_parameter"},
  {"rbp-example.combinator_deconstruction"},
  {"rbp-example.combinator_construction"},
  {"rbp-example.combinator_stepper"},
  {"rbp-example.combinator_signal_converter"},
  {"rbp-example.combinator_signal_retarder"},
  {"rbp-example.combinator_signal_sorter"},
  {"rbp-example.combinator_pause"},
  {"rbp-example.combinator_signal_filter_1"},
  {"rbp-example.combinator_signal_filter_2"},
  {"rbp-example.combinator_id_box_1"},
  {"rbp-example.combinator_id_box_2"},
  {"rbp-example.combinator_signal_gate_1"},
  {"rbp-example.combinator_signal_gate_2"},
  {"rbp-example.combinator_latch_negative"},
  {"rbp-example.combinator_latch_positive"},
  {"rbp-example.combinator_gate_negative_high"},
  {"rbp-example.combinator_gate_negative_low"},
  {"rbp-example.combinator_gate_positive_high"},
  {"rbp-example.combinator_gate_positive_low"},
  {"rbp-example.combinator_box_negative_high"},
  {"rbp-example.combinator_box_negative_low"},
  {"rbp-example.combinator_box_positive_high"},
  {"rbp-example.combinator_box_positive_low"},
}



local function __request_locale(player)
  -- 해당 플레이어의 locale에 해당하는 텍스트가 없는 경우, 현지화 텍스트 요청.
  local loc = storage["rbp-text-loader"].locale[player.locale]

  -- locale 테이블이 없거나, locale 테이블이 key의 수와 일치하지 않으면...
  if not loc or loc ~= "none" then --or table_size(loc) ~= #__string_key then
    -- 현지화 텍스트 요청 시 language code를 먼저 요청해봄. 이 텍스트가 만약 플레이어 현지화가 동일하게 오면 번역이 있는 것이고
    -- 다르게 오면 해당하는 번역이 없는 것임.
    local rid = player.request_translation({"rbp-example.language-code"})
    storage["rbp-text-loader"].requests[rid] = {
      locale = player.locale
    }
  end
end

UTIL_create_event_handler(defines.events.on_string_translated, function(event)
  local p = game.get_player(event.player_index)
  if not p or not event.translated or not storage["rbp-text-loader"].requests[event.id] == nil then return end

  local req = storage["rbp-text-loader"].requests[event.id]
  if req == nil then return end
  storage["rbp-text-loader"].requests[event.id] = nil

  if event.localised_string[1] == "rbp-example.language-code" then
    if p.locale == event.result then
      -- 만약 동일한 값이면 해당 locale 번역이 존재하는 것이므로 새로운 테이블을 만들고 전체 번역 요청.
      storage["rbp-text-loader"].locale[p.locale] = {}
      for _, v in pairs(p.request_translations(__string_key)) do
        storage["rbp-text-loader"].requests[v] = {
          locale = p.locale,
        }
      end

    -- 만약 틀린 값이면 해당 locale의 번역이 없는 것이다. 이 경우에 번역을 요청하면 무조건 영어로 옴.
    -- 만약 영어 테이블이 없는 경우, 영어 테이블을 새로 만든다.
    elseif not storage["rbp-text-loader"].locale["en"] then
      storage["rbp-text-loader"].locale[p.locale] = "none"
      storage["rbp-text-loader"].locale["en"] = {}
      for _, v in pairs(p.request_translations(__string_key)) do
        storage["rbp-text-loader"].requests[v] = {
          locale = "en"
        }
      end
    end
  else -- language 확인 code가 아닌 경우엔 실제 번역 요청임. 단, 요청 객체의 locale 값에 따라 어느 테이블로 넣을지만 결정.
    storage["rbp-text-loader"].locale[req.locale][event.localised_string[1]] = event.result
  end
end)

bootstrap.create_configuration_changed_handler(function()
  -- 모드 버전이 변경된 경우 locale 초기화
  if storage["rbp-text-loader"] then
    storage["rbp-text-loader"].requests = {}
    storage["rbp-text-loader"].locale = {}
  end
end)

bootstrap.create_game_start_handler(function()
  if not game.is_multiplayer() and not game.simulation then
    __request_locale(game.get_player(1))
  end
end)

UTIL_create_event_handler(defines.events.on_player_joined_game, function(event)
  local p = game.get_player(event.player_index)
  __request_locale(p)
end)

UTIL_create_event_handler(defines.events.on_player_locale_changed, function(event)
  local p = game.get_player(event.player_index)
  __request_locale(p)
end)


local __MODULE__ = {}

__MODULE__.get_first_locale = function()
  return storage["rbp-text-loader"].locale[1]
end

__MODULE__.get_all_text = function(locale)
  local _locale = locale or "en"
  local loc = storage["rbp-text-loader"].locale[_locale]
  if not loc or loc == "none" then
    loc = storage["rbp-text-loader"].locale["en"]
  end

  if loc == nil then
    loc = __MODULE__.get_first_locale()
  end

  return loc
end

return __MODULE__