local item = {
  type = "item",
  name = "linox-item_core-roboport",
  icon = "__space-exploration-graphics__/graphics/icons/supercharger.png",
  icon_size = 64,
  subgroup = "logistic-network",
  stack_size = 20,
  weight = 50 * kg,
  place_result = "linox-entity_core-roboport",
  default_import_location = "linox-planet_linox",
};

data:extend { item, }