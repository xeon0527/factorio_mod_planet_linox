local __MODULE__ = {
  technology_icon_constant_planet_size = function(technology_icon, size)
    return {
      {
        icon = technology_icon,
        icon_size = size,
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-planet.png",
        icon_size = 128,
        scale = 0.5,
        shift = {50, 50},
        floating = true
      }
    }
  end,

  technology_icon_constant_damage_size = function(technology_icon, size)
    return {
      {
        icon = technology_icon,
        icon_size = size,
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
        icon_size = 128,
        scale = 0.5,
        shift = {50, 50},
        floating = true
      }
    }
  end,
}
return __MODULE__