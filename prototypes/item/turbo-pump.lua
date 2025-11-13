local tint = {1.0, 0.66, 0.66};

local item = table.deepcopy(data.raw.item["pump"]);
item.name = "linox-item_turbo-pump";
item.place_result = "linox-entity_turbo-pump";
item.stack_size = 50;
item.default_import_location = "linox-planet_linox";
item.weight = 20 * kg;
item.icon = nil;
item.icons = {{
  icon = "__base__/graphics/icons/pump.png",
  tint = tint,
}};

data:extend { item, }