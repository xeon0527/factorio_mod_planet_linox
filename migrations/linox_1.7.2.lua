local linox_A = game.get_surface(__LINOX_SURFACE__.ground)
local linox_B = game.get_surface(__LINOX_SURFACE__.facility)
if linox_A and linox_B then
  local lppn1 = linox_A.find_entity("linox-special_circuit-pole", {0,2})
  local lppn2 = linox_B.find_entity("linox-special_circuit-pole", {0,2})
  if lppn1 and lppn2 then
    local lppn1_connector = lppn1.get_wire_connector(defines.wire_connector_id.pole_copper, true);
    local lppn2_connector = lppn2.get_wire_connector(defines.wire_connector_id.pole_copper, true);
    lppn1_connector.connect_to(lppn2_connector, false, defines.wire_origin.script);

    lppn1_connector = lppn1.get_wire_connector(defines.wire_connector_id.circuit_red, true);
    lppn2_connector = lppn2.get_wire_connector(defines.wire_connector_id.circuit_red, true);
    lppn1_connector.connect_to(lppn2_connector, false, defines.wire_origin.script);
    
    lppn1_connector = lppn1.get_wire_connector(defines.wire_connector_id.circuit_green, true);
    lppn2_connector = lppn2.get_wire_connector(defines.wire_connector_id.circuit_green, true);
    lppn1_connector.connect_to(lppn2_connector, false, defines.wire_origin.script);
  end
end