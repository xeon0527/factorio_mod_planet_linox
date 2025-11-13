local __MODULE__ = {}

__MODULE__.cable = {
  red   = 0x1,
  green = 0x2,
  all   = 0x3,
}

__MODULE__.set_entity_signal = function (entity, slot, signal, value)
  local beh = entity.get_or_create_control_behavior()
  local section = beh.get_section(1)
  if not section then
    section = beh.add_section()
  end
  section.set_slot(slot, {value = signal, min = math.floor(value) });
end

__MODULE__.get_entity_signal = function (entity, cable, signal)
  local value = 0;
  if cable == __MODULE__.cable.red or cable == __MODULE__.cable.all then
    local circuit = entity.get_circuit_network(defines.wire_connector_id.circuit_red);
    if circuit then
      value = value + circuit.get_signal(signal);
    end
  end

  if cable == __MODULE__.cable.green or cable == __MODULE__.cable.all then
    local circuit = entity.get_circuit_network(defines.wire_connector_id.circuit_green);
    if circuit then
      value = value + circuit.get_signal(signal);
    end
  end
  
  return value;
end

return __MODULE__