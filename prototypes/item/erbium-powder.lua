local tint = {255, 175, 225}

data:extend {
  {
    type = "item",
    name = "erbium-powder",
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
    name = "erbium-powder",
    category = "smelting",
    energy_required = 3,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "erbium-oxide", amount = 2},
    },
    results = {
      {type = "item", name = "erbium-powder", amount = 1},
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