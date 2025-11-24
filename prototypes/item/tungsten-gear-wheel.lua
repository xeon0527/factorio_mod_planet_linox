local tint = {1.0, 0.66, 1.0};

local item = table.deepcopy(data.raw.item["iron-gear-wheel"]);
item.name = "tungsten-gear-wheel";
item.subgroup = "intermediate-product"
item.order = "a[basic-intermediates]-ab[tungsten-gear-wheel]"
item.default_import_location = "linox-planet_linox";
item.icon = nil;
item.icons = {{
  icon = "__base__/graphics/icons/iron-gear-wheel.png",
  tint = tint,
}};

data:extend { item, }



data:extend {
  {
    type = "recipe",
    name = "tungsten-gear-wheel",
    ingredients = {{type = "item", name = "tungsten-plate", amount = 1}},
    results = {{type="item", name="tungsten-gear-wheel", amount = 1}},
    allow_productivity = true,
    enabled = false,
  },
}