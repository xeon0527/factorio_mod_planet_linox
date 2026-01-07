local stor = require("scripts.drv.storage")

stor.ensure("game_data.inductor", {
  enable = false,
  current = 0.0,

  V_div_L = 0,
});

local SIM_UPS = 60.0
local SIM_FREQ = 500.0
local SIM_FREQ_T = 1.0/SIM_FREQ
local SIM_FREQ_C =  math.floor(SIM_FREQ/SIM_UPS);
local SIM_R = 0.001
local SIM_L = 0.007
local SIM_R_DIV_L = (SIM_R / SIM_L) * SIM_FREQ_T

--__DRV_SIMULATION_INDUCTOR_DATA__ = {
--  enable = false,
--  voltage = 0.0,
--  current = 0.0,
--  resistance = 0.001,
--  reluctance = 0.007,
--}

local __MODULE__ = {}

__MODULE__.tick = function()
  local inductor_data = storage.game_data.inductor

  if inductor_data.enable then
    local current = inductor_data.current

    for i = 0, SIM_FREQ_C do
      --current = current + ((inductor_data.V_div_L) - (SIM_R_DIV_L * current)) * SIM_FREQ_T
      current = current + ((inductor_data.V_div_L) - (SIM_R_DIV_L * current))
    end

    inductor_data.current = current;
  else
    inductor_data.current = 0.0
  end

  storage.game_data.inductor = inductor_data
  __MODULE__.current = inductor_data.current;
end

__MODULE__.apply_voltage = function(volt)
  storage.game_data.inductor.V_div_L = (volt / SIM_L) * SIM_FREQ_T
end

__MODULE__.enable = function(en)
  storage.game_data.inductor.enable = en
end

return __MODULE__