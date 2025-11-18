local __shortcut_name = "linox-shortcut_enter-elevator"

UTIL_create_event_handler(defines.events.on_lua_shortcut, function(event)
  if event.player_index ~= nil and event.prototype_name == __shortcut_name then
    script.raise_event("linox-custom-event_on-enter-elevator", {
      player = game.players[event.player_index],
    })
  end
end)

UTIL_create_event_handler("linox-custom-input_enter-elevator", function(event)
  if event.player_index ~= nil then
    script.raise_event("linox-custom-event_on-enter-elevator", {
      player = game.players[event.player_index],
    })
  end
end)