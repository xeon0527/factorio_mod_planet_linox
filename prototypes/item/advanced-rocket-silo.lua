local tint = { 1.0, 0.66, 0.66 };

local item = table.deepcopy(data.raw["item"]["rocket-silo"]);
item.name = "linox-item_advanced-rocket-silo";
item.icon = nil;
item.icons = {{
  icon = "__base__/graphics/icons/rocket-silo.png",
  tint = tint,
}};
item.place_result = "linox-entity_advanced-rocket-silo";
item.weight = 1 * tons;

data:extend { item, }