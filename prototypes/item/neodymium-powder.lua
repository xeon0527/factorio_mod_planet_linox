local tint = {225, 225, 225}

data:extend {
  {
    type = "item",
    name = "neodymium-powder",
    icons = {
      {
        icon = "__linox__/graphics/icons/white-powder.png",
        icon_size = 64,
        tint = tint
      },
    },
    subgroup = "vulcanus-processes",
    order = "c[tungsten]-ac",
    stack_size = 200,
    weight = 1 * kg,
    default_import_location = "linox-planet_linox",
  },


  
  {
    type = "recipe",
    name = "neodymium-powder",
    category = "smelting",
    energy_required = 3,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "neodymium-oxide", amount = 2},
    },
    results = {
      {type = "item", name = "neodymium-powder", amount = 1},
    },
    allow_productivity = true,

    surface_conditions =
    {
      {
        property = "magnetic-field",
        min = 1600,
        max = 1600,
      },
      {
        property = "gravity",
        min = 2,
        max = 2
      }
    },
  }
}