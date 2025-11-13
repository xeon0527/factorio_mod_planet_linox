local stor = require("scripts.drv.storage");

stor.ensure("player_data", {});
stor.ensure("force_data", {});

local __MODULE__ = {};

__MODULE__.create = function(path, default_value)
  stor.ensure(path, default_value);
end

__MODULE__.get = function(key)
  if storage[key] == nil then
    storage[key] = {};
  end
  return storage[key];
end

__MODULE__.set = function(key, data)
  storage[key] = data;
end


__MODULE__.get_player = function(player, key, default_value)
  local success, result = pcall(function()
    return storage.player_data[key][player.index];
  end)

  if not success then
    result = __MODULE__.set_player(player, key, default_value);
  end
  return result;
end

__MODULE__.set_player = function(player, key, data)
  local success = pcall(function()
    storage.player_data[key][player.index] = data;
  end)

  if not success then
    stor.ensure("player_data."..key, {});
    --table.insert(storage.player_data[key], player.index);
    storage.player_data[key][player.index] = data;
  end
  return data;
end


__MODULE__.get_force = function(force, key, default_value)
  local success, result = pcall(function()
    return storage.force_data[key][force.index];
  end)

  if not success then
    result = __MODULE__.set_force(force, key, default_value);
  end
  return result;
end

__MODULE__.set_force = function(force, key, data)
  local success = pcall(function()
    storage.force_data[key][force.index] = data;
  end)

  if not success then
    stor.ensure("force_data."..key, {});
    --table.insert(storage.force_data[key], force.index);
    storage.force_data[key][force.index] = data;
  end
  return data;
end

return __MODULE__;