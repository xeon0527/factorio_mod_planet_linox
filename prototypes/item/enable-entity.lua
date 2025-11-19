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