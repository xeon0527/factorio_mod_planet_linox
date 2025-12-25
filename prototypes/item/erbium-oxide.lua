local tint = {255, 100, 200}

data:extend {
  {
    type = "item",
    name = "erbium-oxide",
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
    name = "erbium-oxide",
    category = "linox-recipe-category_chemical-filter",
    energy_required = 2,
    enabled = false,
    ingredients =
    {
      {type = "fluid", name = "erbium-solution", amount = 50},
      {type = "fluid", name = "water", amount = 250},
    },
    results = {
      {type = "item", name = "erbium-oxide", amount = 1},
      {type = "fluid", name = "waste-water", amount = 299, ignored_by_productivity = 299},
    },
    main_product = "erbium-oxide",
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