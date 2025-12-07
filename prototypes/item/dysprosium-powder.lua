data:extend {
  {
    type = "item",
    name = "dysprosium-powder",
    icons = {
      {
        icon = "__linox__/graphics/icons/white-powder.png",
        icon_size = 64,
        tint = { 75, 75, 0 }
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
    name = "dysprosium-powder",
    category = "linox-recipe-category_chemical-tank",
    energy_required = 5,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "hydrophilic-rare-earth-powder", amount = 1},
      {type = "item", name = "calcite", amount = 1},
      {type = "fluid", name = "water", amount = 100},
    },
    results = {
      {type = "item", name = "dysprosium-powder", probability = 0.5, amount = 1},
      {type = "item", name = "stone", probability = 0.5, amount = 1}
    },
    allow_productivity = true,
    --allow_quality = false,
    main_product = "dysprosium-powder",

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