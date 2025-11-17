__DRV_BOOTSTRAP_INIT_HANDLERS__ = {};
__DRV_BOOTSTRAP_CONFIGURATION_CHANGED_HANDLERS__ = {};
__DRV_BOOTSTRAP_LOAD_HANDLERS__ = {};
__DRV_BOOTSTRAP_TICK_HANDLERS__ = {};

script.on_init(function()
  storage.__RANDOM_GENERATOR__ = storage.__RANDOM_GENERATOR__ or game.create_random_generator()

  for _, hdrs in pairs(__DRV_BOOTSTRAP_INIT_HANDLERS__) do
    hdrs();
  end
end)

script.on_configuration_changed(function()
  for _, hdrs in pairs(__DRV_BOOTSTRAP_CONFIGURATION_CHANGED_HANDLERS__) do
    hdrs();
  end
end)

script.on_load(function()
  for _, hdrs in pairs(__DRV_BOOTSTRAP_LOAD_HANDLERS__) do
    hdrs();
  end
end)

script.on_nth_tick(1, function()
  for _, hdrs in pairs(__DRV_BOOTSTRAP_TICK_HANDLERS__) do
    hdrs();
  end
end)


local __MODULE__ = {};

__MODULE__.create_init_handler = function(handler)
  table.insert(__DRV_BOOTSTRAP_INIT_HANDLERS__, handler);
end

__MODULE__.create_configuration_changed_handler = function(handler)
  table.insert(__DRV_BOOTSTRAP_CONFIGURATION_CHANGED_HANDLERS__, handler);
end

__MODULE__.create_load_handler = function(handler)
  table.insert(__DRV_BOOTSTRAP_LOAD_HANDLERS__, handler);
end

__MODULE__.create_tick_handler = function(handler)
  table.insert(__DRV_BOOTSTRAP_TICK_HANDLERS__, handler);
end

return __MODULE__;