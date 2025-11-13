local tint = {1.0, 0.5, 1.0};

local recipe = {
  type = "recipe",
  name = "linox-recipe_fluid-elevator",
  energy_required = 10,
  enabled = false,
  ingredients =
  {
    {type = "item", name = "linox-item_tungsten-gear-wheel", amount = 50},
    {type = "item", name = "tungsten-plate", amount = 10},
    {type = "item", name = "electric-engine-unit", amount = 5},
    {type = "item", name = "processing-unit", amount = 5},
  },
  surface_conditions =
    {
      {
        property = "magnetic-field",
        min = 1600,
        max = 1600,
      },
      {
        property = "gravity",
        min = 2,
        max = 2
      }
    },
  results = {{type="item", name="linox-item_fluid-elevator", amount=1}},
  --icon = nil,
  --icons = {{
  --  icon = "__base__/graphics/icons/pump.png",
  --  tint = tint,
  --}},
}

data:extend { recipe, }