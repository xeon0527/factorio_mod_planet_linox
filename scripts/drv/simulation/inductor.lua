local stor = require("scripts.drv.storage")

stor.ensure("game_data.inductor", {
  enable = false,
  voltage = 0.0,
  current = 0.0,
  resistance = 0.001,
  reluctance = 0.007,
});

local SIM_UPS = 60.0
local SIM_FREQ = 500.0
local SIM_FREQ_T = 1.0/SIM_FREQ
local SIM_FREQ_C =  math.floor(SIM_FREQ/SIM_UPS);

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
    local voltage = inductor_data.voltage
    local current = inductor_data.current
    local resistance = inductor_data.resistance
    local reluctance = inductor_data.reluctance

    for i = 0, SIM_FREQ_C do
      current = current + ((voltage / reluctance) - ((resistance / reluctance) * current)) * SIM_FREQ_T
    end

    inductor_data.current = current;
  else
    inductor_data.current = 0.0
  end

  storage.game_data.inductor = inductor_data
  __MODULE__.current = inductor_data.current;
end

__MODULE__.apply_voltage = function(volt)
  storage.game_data.inductor.voltage = volt
end

__MODULE__.enable = function(en)
  storage.game_data.inductor.enable = en
end

return __MODULE__