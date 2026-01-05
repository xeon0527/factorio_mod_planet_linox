local __MODULE__ = {}

__MODULE__.data_update = function()
  if mods["even-pickier-dollies"] then
    local epd_mod_data = assert(data.raw['mod-data']['even-pickier-dollies']).data
    if epd_mod_data then
        epd_mod_data.blacklist_names["linox-special_circuit-pole"] = true
        epd_mod_data.blacklist_names["linox-npc_lorax"] = true
        epd_mod_data.blacklist_names["linox-npc_network-terminal"] = true
        epd_mod_data.blacklist_names["linox-npc_power-converter"] = true
        epd_mod_data.blacklist_names["linox-npc_power-converter-circuit-input"] = true
        epd_mod_data.blacklist_names["linox-npc_power-converter-circuit-output"] = true
        epd_mod_data.blacklist_names["linox-special_internel-pipeline"] = true
        epd_mod_data.blacklist_names["linox-building_fluid-elevator"] = true
    end
  end
end

return __MODULE__