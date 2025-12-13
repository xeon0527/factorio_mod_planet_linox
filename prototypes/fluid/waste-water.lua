--flow_color = {165, 74, 166},

local tint = {50, 100, 0}

data:extend {
  {
    type = "fluid",
    name = "waste-water",
    icons = {
      {
        icon = "__space-age__/graphics/icons/fluid/lithium-brine.png",
        icon_size = 64,
        tint = tint,
      }
    },
    subgroup = "fluid",
    order = "linox-wastewater",
    default_temperature = 15,

    base_color = tint,
    flow_color = tint,
  },
}