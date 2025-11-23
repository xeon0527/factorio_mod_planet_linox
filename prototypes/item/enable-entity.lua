local item = {
  type = "item",
  name = "linox-item_enable-entity",
  icon = "__linox__/graphics/icons/blank.png",
  icon_size = 64,
  stack_size = 1000,
  flags = {
    "hide-from-bonus-gui",
    "hide-from-fuel-tooltip",
  },
  hidden = true,
  hidden_in_factoriopedia = true,
};

data:extend { item, }



data:extend {
  {
    type = "recipe",
    name = "linox-recipe_enable-entity",
    category = "linox-recipe-category_enable-entity",
    energy_required = 100000000000000000000000,
    enabled = true,
    ingredients = {{type = "item", name = "linox-item_enable-entity", amount = 1}},
    icon = "__linox__/graphics/icons/blank.png",
    icon_size = 64,
    
    show_amount_in_title = false,
    always_show_products = false,
    hide_from_stats = true,
    hide_from_player_crafting = true,
    hide_from_bonus_gui = true,
    hide_from_signal_gui = true,
    hidden = true,
    hidden_in_factoriopedia = true,
  },
}