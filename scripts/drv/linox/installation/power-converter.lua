local bootstrap = require("scripts.drv.bootstrap")
local circuit = require("scripts.util.circuit")
local surface_facility = require("scripts.svc.surface.linox-facility")
local vec = require("scripts.util.vector")

__DRV_LINOX_POWER_CONVERTER_ENTITY__ = nil;
__DRV_LINOX_POWER_CONVERTER_INPUT_ENTITY__ = nil;
__DRV_LINOX_POWER_CONVERTER_OUTPUT_ENTITY__ = nil;

local __MODULE__ = {}

bootstrap.create_tick_handler(function()
  local surface = surface_facility.get()
  if surface == nil then return end

  if __DRV_LINOX_POWER_CONVERTER_ENTITY__ == nil or __DRV_LINOX_POWER_CONVERTER_ENTITY__.valid == false then
    __DRV_LINOX_POWER_CONVERTER_ENTITY__ = nil;
    local find_entities = surface.find_entities_filtered {
      name = "linox-npc_power-converter",
      area = {{-30, -30}, {30, 30}},
      limit = 1,
    }
    
    if find_entities[1] then
      __DRV_LINOX_POWER_CONVERTER_ENTITY__ = find_entities[1]
    else return end
  end


  if __DRV_LINOX_POWER_CONVERTER_INPUT_ENTITY__ == nil or __DRV_LINOX_POWER_CONVERTER_INPUT_ENTITY__.valid == false then
    local entity_pos = vec.add(__DRV_LINOX_POWER_CONVERTER_ENTITY__.position, {x = -0.5, y = 0.5})
    __DRV_LINOX_POWER_CONVERTER_INPUT_ENTITY__ = surface.find_entity("linox-npc_power-converter-circuit-input", entity_pos);
    if not __DRV_LINOX_POWER_CONVERTER_INPUT_ENTITY__ then
      __DRV_LINOX_POWER_CONVERTER_INPUT_ENTITY__ = surface.create_entity{
        name = "linox-npc_power-converter-circuit-input",
        position = entity_pos,
        force = __DRV_LINOX_POWER_CONVERTER_ENTITY__.force,
        create_build_effect_smoke = false,
      }
      __DRV_LINOX_POWER_CONVERTER_INPUT_ENTITY__.destructible = false;
      __DRV_LINOX_POWER_CONVERTER_INPUT_ENTITY__.minable = false;
      __DRV_LINOX_POWER_CONVERTER_INPUT_ENTITY__.rotatable = false;
      __DRV_LINOX_POWER_CONVERTER_INPUT_ENTITY__.operable = false;
    end
  end


  if __DRV_LINOX_POWER_CONVERTER_OUTPUT_ENTITY__ == nil or __DRV_LINOX_POWER_CONVERTER_OUTPUT_ENTITY__.valid == false then
    local entity_pos = vec.add(__DRV_LINOX_POWER_CONVERTER_ENTITY__.position, {x = 0.5, y = 0.5})
    __DRV_LINOX_POWER_CONVERTER_OUTPUT_ENTITY__ = surface.find_entity("linox-npc_power-converter-circuit-output", entity_pos);
    if not __DRV_LINOX_POWER_CONVERTER_OUTPUT_ENTITY__ then
      __DRV_LINOX_POWER_CONVERTER_OUTPUT_ENTITY__ = surface.create_entity{
        name = "linox-npc_power-converter-circuit-output",
        position = entity_pos,
        force = __DRV_LINOX_POWER_CONVERTER_ENTITY__.force,
        create_build_effect_smoke = false,
      }
      __DRV_LINOX_POWER_CONVERTER_OUTPUT_ENTITY__.destructible = false;
      __DRV_LINOX_POWER_CONVERTER_OUTPUT_ENTITY__.minable = false;
      __DRV_LINOX_POWER_CONVERTER_OUTPUT_ENTITY__.rotatable = false;
      __DRV_LINOX_POWER_CONVERTER_OUTPUT_ENTITY__.operable = false;
    end
  end
end);



__MODULE__.input_type = {
  enable_control  = { quality = "normal", type = "virtual", name = "signal-E" },
  turn_on         = { quality = "normal", type = "virtual", name = "signal-I" },
}

__MODULE__.output_type = {
  current_power   = { quality = "normal", type = "virtual", name = "signal-P" },
  output_power    = { quality = "normal", type = "virtual", name = "signal-O" },

  --resistance = { quality = "normal", type = "virtual", name = "signal-R" },
  --reluctance = { quality = "normal", type = "virtual", name = "signal-L" },
}

__MODULE__.get_power_converter = function()
  return __DRV_LINOX_POWER_CONVERTER_ENTITY__
end

__MODULE__.get_signal = function(input_type)
  if __DRV_LINOX_POWER_CONVERTER_INPUT_ENTITY__ then
    return circuit.get_entity_signal(__DRV_LINOX_POWER_CONVERTER_INPUT_ENTITY__, circuit.cable.all, input_type);
  end
  return 0;
end

__MODULE__.set_signal = function(output_type, slot, value)
  if __DRV_LINOX_POWER_CONVERTER_OUTPUT_ENTITY__ then
    circuit.set_entity_signal(__DRV_LINOX_POWER_CONVERTER_OUTPUT_ENTITY__, slot, output_type, value);
  end
end


return __MODULE__