local __MODULE__ = {}

__MODULE__.data_update = function()
  if mods["Krastorio2-spaced-out"] and not mods["boblogistics"] then
    data.raw["construction-robot"]["linox_samarium-construction-robot"].speed = 0.09257 * 3
    data.raw["construction-robot"]["linox_samarium-construction-robot"].max_energy = "3MJ"
    data.raw["construction-robot"]["linox_samarium-construction-robot"].max_payload_size = 2

    data.raw["logistic-robot"]["linox_samarium-logistic-robot"].speed = 0.0694 * 3
    data.raw["logistic-robot"]["linox_samarium-logistic-robot"].max_energy = "3MJ"
    data.raw["logistic-robot"]["linox_samarium-logistic-robot"].max_payload_size = 7
  end
end

return __MODULE__