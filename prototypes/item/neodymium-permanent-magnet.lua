--local tint = {255, 255, 255}

data:extend {
  {
    type = "item",
    name = "neodymium-permanent-magnet",
    icons = {
      {
        icon = "__linox__/graphics/icons/white-cube.png",
        icon_size = 64,
        --tint = tint
      },
    },
    subgroup = "vulcanus-processes",
    order = "c[tungsten]-ac",
    stack_size = 50,
    weight = 10 * kg,
    default_import_location = "linox-planet_linox",
  },


  
  {
    type = "recipe",
    name = "neodymium-permanent-magnet",
    category = "linox-recipe-category_sintering",
    energy_required = 5,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "neodymium-powder", amount = 2},
      {type = "item", name = "dysprosium-powder", amount = 1},
      {type = "item", name = "iron-plate", amount = 14},
    },
    results = {
      {type = "item", name = "neodymium-permanent-magnet", amount = 1},
    },
    allow_productivity = true,
  }
}