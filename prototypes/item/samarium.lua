data:extend {
  {
    type = "item",
    name = "linox-item_samarium",
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
    weight = 20 * kg,
    default_import_location = "linox-planet_linox",
  },



  {
    type = "recipe",
    name = "linox-item_samarium",
    category = "linox-recipe-category_sintering-machine",
    energy_required = 1,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "linox-item_samarium-powder", amount = 2},
    },
    results = {{type="item", name="linox-item_samarium", amount=1}},
  }
}