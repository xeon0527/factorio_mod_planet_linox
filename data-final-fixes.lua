for _, fluid in pairs(data.raw.fluid) do
  if string.sub(fluid.name, 1, 9) ~= "parameter" and fluid.name ~= "fluid-unknown" then
    data:extend {
      {
        type = "recipe",
        name = fluid.name.."-outlet",
        category = "linox-recipe-category_outlet",
        enabled = true,
        hidden_in_factoriopedia = true,
        hide_from_player_crafting = true,
        hide_from_signal_gui = true,
        energy_required = 1,
        ingredients = {
          { type = "fluid", name = fluid.name, amount = 100 },
        },
        icon = "__base__/graphics/icons/offshore-pump.png",
        icon_size = 64,
        results = {},
      }
    }
  end
end