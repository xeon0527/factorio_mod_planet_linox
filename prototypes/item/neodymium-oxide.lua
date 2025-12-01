local tint = {175, 175, 175}

data:extend {
  {
    type = "item",
    name = "neodymium-oxide",
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
    name = "neodymium-oxide",
    category = "linox-recipe-category_chemical-filter",
    energy_required = 2,
    enabled = false,
    ingredients =
    {
      {type = "fluid", name = "neodymium-solution", amount = 50},
      {type = "fluid", name = "water", amount = 250},
    },
    results = {
      {type = "item", name = "neodymium-oxide", amount = 1},
      {type = "fluid", name = "waste-water", amount = 299},
    },
    main_product = "neodymium-oxide",
    allow_productivity = true,
  }
}