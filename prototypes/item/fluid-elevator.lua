local tint = {1.0, 0.5, 1.0};

local item = table.deepcopy(data.raw.item["pump"]);
item.name = "linox-item_fluid-elevator";
item.subgroup = "energy-pipe-distribution"
item.order = "b[pipe]-e[fluid-elevator]"
item.place_result = "linox-entity_fluid-elevator";
item.stack_size = 10;
item.default_import_location = "linox-planet_linox";
item.weight = 10 * tons;
item.icon = nil;
item.icons = {{
  icon = "__base__/graphics/icons/pump.png",
  tint = tint,
}};

data:extend { item, }