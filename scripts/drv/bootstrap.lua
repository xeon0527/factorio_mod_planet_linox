__DRV_BOOTSTRAP_HANDLERS__ = {
  start_complete = false,
  on_init = {},
  on_configuration_changed = {},
  on_load = {},
  on_tick = {},
  game_start = {},
}

script.on_init(function()
  storage.__RANDOM_GENERATOR__ = storage.__RANDOM_GENERATOR__ or game.create_random_generator()

  for _, hdrs in pairs(__DRV_BOOTSTRAP_HANDLERS__.on_init) do
    hdrs();
  end
end)

script.on_configuration_changed(function()
  for _, hdrs in pairs(__DRV_BOOTSTRAP_HANDLERS__.on_configuration_changed) do
    hdrs();
  end
end)

script.on_load(function()
  for _, hdrs in pairs(__DRV_BOOTSTRAP_HANDLERS__.on_load) do
    hdrs();
  end
end)

script.on_nth_tick(1, function()
  for _, hdrs in pairs(__DRV_BOOTSTRAP_HANDLERS__.on_tick) do
    hdrs();
  end

  if not __DRV_BOOTSTRAP_HANDLERS__.start_complete then
    for _, hdrs in pairs(__DRV_BOOTSTRAP_HANDLERS__.game_start) do
      hdrs();
    end

    __DRV_BOOTSTRAP_HANDLERS__.start_complete = true
  end
end)


local __MODULE__ = {};

__MODULE__.create_init_handler = function(handler)
  table.insert(__DRV_BOOTSTRAP_HANDLERS__.on_init, handler);
end

__MODULE__.create_configuration_changed_handler = function(handler)
  table.insert(__DRV_BOOTSTRAP_HANDLERS__.on_configuration_changed, handler);
end

__MODULE__.create_load_handler = function(handler)
  table.insert(__DRV_BOOTSTRAP_HANDLERS__.on_load, handler);
end

__MODULE__.create_tick_handler = function(handler)
  table.insert(__DRV_BOOTSTRAP_HANDLERS__.on_tick, handler);
end

__MODULE__.create_game_start_handler = function(handler)
  table.insert(__DRV_BOOTSTRAP_HANDLERS__.game_start, handler);
end

return __MODULE__;