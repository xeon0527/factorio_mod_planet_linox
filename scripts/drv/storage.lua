local util = require("util");
local bootstrap = require("scripts.drv.bootstrap");

__DRV_STORAGE_GAME_START__ = false;
__DRV_STORAGE_PATH_RESERVED__ = {};

local function __generate_storage()
  if __DRV_STORAGE_PATH_RESERVED__ then 
    for _, v in pairs(__DRV_STORAGE_PATH_RESERVED__) do
      if v.value == nil then
        UTIL_ensure_object_path(storage, v.path);
      else
        local objs = util.split(v.path, ".");
        local val_name = objs[#objs];
        local path = string.sub(v.path, 1, -(string.len(val_name) + 2));

        local target = UTIL_ensure_object_path(storage, path);
        if not target[val_name] then
          target[val_name] = v.value;
        end
      end
    end
  end 
  __DRV_STORAGE_PATH_RESERVED__ = {};
  __DRV_STORAGE_GAME_START__ = true;
end

bootstrap.create_init_handler(__generate_storage);
bootstrap.create_configuration_changed_handler(__generate_storage);
bootstrap.create_load_handler(function()
  __DRV_STORAGE_GAME_START__ = true;
end);


local __MODULE__ = {};

__MODULE__.ensure = function(path, default_value)
  table.insert(__DRV_STORAGE_PATH_RESERVED__, { path = path, value = default_value });
  if __DRV_STORAGE_GAME_START__ then
    __generate_storage();
  end
end

return __MODULE__;