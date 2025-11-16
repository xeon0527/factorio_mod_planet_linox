-- local SIM_UPS = 60.0
-- local SIM_FREQ = 500.0
-- local SIM_FREQ_T = 1.0/SIM_FREQ
-- local SIM_FREQ_C =  math.floor(SIM_FREQ/SIM_UPS);

-- __DRV_SIMULATION_INDUCTOR_DATA__ = {
--   enable = false,
--   voltage = 0.0,
--   current = 0.0,
--   resistance = 0.001,
--   reluctance = 0.007,
-- }

-- local __MODULE__ = {}

-- __MODULE__.tick = function()
--   if __DRV_SIMULATION_INDUCTOR_DATA__.enable then
--     local voltage = __DRV_SIMULATION_INDUCTOR_DATA__.voltage
--     local current = __DRV_SIMULATION_INDUCTOR_DATA__.current
--     local resistance = __DRV_SIMULATION_INDUCTOR_DATA__.resistance
--     local reluctance = __DRV_SIMULATION_INDUCTOR_DATA__.reluctance

--     for i = 0, SIM_FREQ_C do
--       current = current + ((voltage / reluctance) - ((resistance / reluctance) * current)) * SIM_FREQ_T
--     end

--     __DRV_SIMULATION_INDUCTOR_DATA__.current = current;
--   else
--     __DRV_SIMULATION_INDUCTOR_DATA__.current = 0.0
--   end

--   __MODULE__.current = __DRV_SIMULATION_INDUCTOR_DATA__.current;
-- end

-- __MODULE__.apply_voltage = function(volt)
--   __DRV_SIMULATION_INDUCTOR_DATA__.voltage = volt
-- end

-- __MODULE__.enable = function(en)
--   __DRV_SIMULATION_INDUCTOR_DATA__.enable = en
-- end

-- return __MODULE__