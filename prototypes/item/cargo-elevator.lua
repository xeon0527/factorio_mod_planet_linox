local item = table.deepcopy(data.raw["item"]["linked-belt"])
item.name = "linox-item_cargo-elevator"
item.subgroup = "belt"
item.color_hint = { text = "5" }
item.order = "b[underground-belt]-e[cargo-elevator]"
item.place_result = "linox-entity_cargo-elevator"
item.default_import_location = "linox-planet_linox"
item.weight = 10 * tons

data:extend { item, }