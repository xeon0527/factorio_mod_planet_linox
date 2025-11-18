-- local bootstrap = require("scripts.drv.bootstrap")
-- local circuit = require("scripts.util.circuit")

-- __DRV_LINOX_POWER_CONVERTER_ENTITY__ = nil;
-- __DRV_LINOX_POWER_CONVERTER_OUTPUT_ENTITY__ = nil;

-- local __MODULE__ = {}

-- bootstrap.create_tick_handler(function()
--   local surface = game.get_surface("linox-surface_linox-installation")
--   if surface == nil then return end

--   if __DRV_LINOX_POWER_CONVERTER_ENTITY__ == nil or __DRV_LINOX_POWER_CONVERTER_ENTITY__.valid == false then
--     __DRV_LINOX_POWER_CONVERTER_ENTITY__ = nil;
--     local find_entities = surface.find_entities_filtered {
--       name = "linox-entity_npc-power-converter",
--       area = {{-15, -15}, {15, 15}},
--       limit = 1,
--     }

--     if find_entities[1] then
--       __DRV_LINOX_POWER_CONVERTER_ENTITY__ = find_entities[1]
--     else return end
--   end

--   if __DRV_LINOX_POWER_CONVERTER_OUTPUT_ENTITY__ == nil or __DRV_LINOX_POWER_CONVERTER_OUTPUT_ENTITY__.valid == false then
--     local output_pos = UTIL_add_vector(__DRV_LINOX_POWER_CONVERTER_ENTITY__.position, {x = 0.5, y = 0})
    
--     __DRV_LINOX_POWER_CONVERTER_OUTPUT_ENTITY__ = surface.find_entity("linox-entity_npc-power-converter-output", output_pos);
--     if not __DRV_LINOX_POWER_CONVERTER_OUTPUT_ENTITY__ then
--       __DRV_LINOX_POWER_CONVERTER_OUTPUT_ENTITY__ = surface.create_entity{
--           name = "linox-entity_npc-power-converter-output",
--           position = output_pos,
--           force = __DRV_LINOX_POWER_CONVERTER_ENTITY__.force,
--           create_build_effect_smoke = false,
--         }
--     end

--     if __DRV_LINOX_POWER_CONVERTER_OUTPUT_ENTITY__ == nil then return end
--   end

-- end);



-- __MODULE__.input_type = {
--   enable_pwm    = { quality = "normal", type = "virtual", name = "signal-P" },
--   turn_on       = { quality = "normal", type = "virtual", name = "signal-O" },
-- }

-- __MODULE__.output_type = {
--   target_current = { quality = "normal", type = "virtual", name = "signal-T" },
--   current = { quality = "normal", type = "virtual", name = "signal-A" },

--   resistance = { quality = "normal", type = "virtual", name = "signal-R" },
--   reluctance = { quality = "normal", type = "virtual", name = "signal-L" },
-- }

-- __MODULE__.get_signal = function(input_type)
--   if __DRV_LINOX_POWER_CONVERTER_ENTITY__ then
--     return circuit.get_entity_signal(__DRV_LINOX_POWER_CONVERTER_ENTITY__, circuit.cable.all, input_type);
--   end
--   return 0;
-- end

-- __MODULE__.set_signal = function(output_type, slot, value)
--   if __DRV_LINOX_POWER_CONVERTER_OUTPUT_ENTITY__ then
--     circuit.set_entity_signal(__DRV_LINOX_POWER_CONVERTER_OUTPUT_ENTITY__, slot, output_type, value);
--   end
-- end


-- return __MODULE__