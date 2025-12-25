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

  technology_icon_script_research = function(technology_icon, size)
    return {
      {
        icon = technology_icon,
        icon_size = size,
      },
      {
        icon = "__core__/graphics/icons/technology/effect-constant/effect-constant-upgrade-planner.png",
        icon_size = 64,
        scale = 1,
        shift = {30, 30},
        floating = true
      }
    }
  end,

  technology_icon_linox_mod = function(technology_icon, size, tint)
    return {
      {
        icon = technology_icon,
        icon_size = size,
        tint = tint,
      },
      {
        icon = "__linox__/graphics/icons/planet-linox-64.png",
        icon_size = 64,
        scale = 0.5,
        shift = {46, 46},
        floating = true
      }
    }
  end,

  recipe_icon_linox = function(recipe_icon, size)
    return {
      {
        icon = recipe_icon,
        icon_size = size,
      },
      {
        icon = "__linox__/graphics/icons/planet-linox-64.png",
        icon_size = 64,
        scale = 0.25,
        shift = {10, 10},
        floating = true
      }
    }
  end,

  recipe_icon_sintering = function(recipe_icon, size, tint)
    return {
      {
        icon = recipe_icon,
        icon_size = size,
        tint = tint,
      },
      {
        icon = "__linox__/graphics/icons/sintering-machine.png",
        icon_size = 64,
        scale = 0.25,
        shift = {10, 10},
        floating = true
      }
    }
  end,

  technology_icon_constant_equipment = function(technology_icon, size, tint)
    local icons =
    {
      {
        icon = technology_icon,
        icon_size = size,
        tint = tint,
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-equipment.png",
        icon_size = 128,
        scale = 0.5,
        shift = {50, 50},
        floating = true
      }
    }
    return icons
  end,

  technology_icon_constant_recipe_productivity = function(technology_icon, size, tint)
    local icons =
    {
      {
        icon = technology_icon,
        icon_size = size,
        tint = tint,
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-recipe-productivity.png",
        icon_size = 128,
        scale = 0.5,
        shift = {50, 50},
        floating = true
      }
    }
    return icons
  end,

  technology_icon_constant_battery = function(technology_icon, size, tint)
    local icons =
    {
      {
        icon = technology_icon,
        icon_size = size,
        tint = tint,
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-battery.png",
        icon_size = 128,
        scale = 0.5,
        shift = {50, 50},
        floating = true
      }
    }
    return icons
  end,

  technology_icon_constant_mining_productivity = function(icon, size)
    return {
      {
        icon = icon,
        icon_size = size,
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-mining-productivity.png",
        icon_size = 128,
        scale = 0.5,
        shift = {50, 50},
        floating = true
      }
    }
  end,

  icon_constant_mining_productivity = function(icon, size)
    return {
      {
        icon = icon,
        icon_size = size,
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-mining-productivity.png",
        icon_size = 128,
        scale = 0.25,
        shift = {10, 10},
        floating = true,
      }
    }
  end,

  icon_constant_recipe_productivity = function(icon, size)
    return {
      {
        icon = icon,
        icon_size = size,
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-recipe-productivity.png",
        icon_size = 128,
        scale = 0.25,
        shift = {10, 10},
        floating = true,
      }
    }
  end,
}
return __MODULE__