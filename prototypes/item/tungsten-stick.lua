local tint = {1.0, 0.66, 1.0};

local item = table.deepcopy(data.raw.item["iron-stick"]);
item.name = "linox-item_tungsten-stick";
item.subgroup = "intermediate-product";
item.default_import_location = "linox-planet_linox";
item.icon = nil;
item.icons = {{
  icon = "__base__/graphics/icons/iron-stick.png",
  tint = tint,
}};

data:extend { item, }