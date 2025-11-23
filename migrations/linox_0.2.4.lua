for _, obj in pairs(rendering.get_all_objects("linox")) do
  if obj.text and #obj.text == 1 then
    if obj.text[1] == "entity-name.linox-entity_npc-network-terminal" then
      obj.text = {"entity-name.linox-npc_network-terminal"}
      obj.visible = true
    elseif obj.text[1] == "entity-name.linox-entity_npc-lorax" then
      obj.text = {"entity-name.linox-npc_lorax"}
    end
  end
end