data:extend {
  {
    type = "item",
    name = "samarium",
    icons = {
      {
        icon = "__linox__/graphics/icons/white-cube.png",
        icon_size = 64,
        tint = { 222, 232, 107 }
      },
    },
    subgroup = "vulcanus-processes",
    order = "c[tungsten]-ad",
    stack_size = 50,
    weight = 2 * kg,
    default_import_location = "linox-planet_linox",
  },



  {
    type = "recipe",
    name = "samarium",
    category = "linox-recipe-category_sintering",
    energy_required = 1,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "samarium-powder", amount = 2},
    },
    results = {{type="item", name="samarium", amount=1}},
    allow_productivity = true,
    auto_recycle = false,
    maximum_productivity = 5.0,

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