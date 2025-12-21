local db = require("scripts.svc.database")

local __PREFIX = "linox-gui-session_"

local __MODULE__ = {}

__MODULE__.get = function(gui_name, player)
  return db.get_player(player, __PREFIX..gui_name.."_session", {});
end

__MODULE__.set = function(gui_name, player, data)
  return db.set_player(player, __PREFIX..gui_name.."_session", data);
end

__MODULE__.clear = function(gui_name, player)
  return __MODULE__.set(gui_name, player, nil)
end

return __MODULE__