data:extend {
  {
    type = "furnace",
    name = "linox-entity_npc-lorax",
    flags = {
      "not-rotatable",
      "placeable-neutral",
      "placeable-off-grid",
      "get-by-unit-number", 
      "not-deconstructable",
      "not-blueprintable", 
      "hide-alt-info",
      "no-automated-item-removal",
      "no-automated-item-insertion",
      "not-upgradable",
      "not-in-made-in",
    },

    icon = "__space-exploration-graphics__/graphics/icons/nexus.png",
    max_health = 1000,
    map_color = { 1.0, 1.0, 0.0 },
    collision_box = {{-4, -4}, {4, 4}},
    selection_box = {{-4, -4}, {4, 4}},
    hidden = true,
    hidden_in_factoriopedia = true,
    drawing_box_vertical_extension = 0.7,
    source_inventory_size = 1,
    result_inventory_size = 1,
    energy_usage = "1J",
    crafting_speed = 0.00000000000000000000000000000000001,
    energy_source = { type = "void" },
    crafting_categories = { "linox-recipe-category_enable-entity" },
    match_animation_speed_to_activity = false,
    draw_entity_info_icon_background = false,
    show_recipe_icon = false,
    show_recipe_icon_on_map = false,

    circuit_wire_max_distance = 10.0,
    circuit_connector = nil,

    graphics_set = {
      animation = {
        layers = {
          {
            filename = "__linox__/graphics/entity/lorax/item-extractor-hr-animation-1.png",
            width = 530,
            height = 530,
            scale = 0.5,
            --shift = util.by_pixel(0, -40),
          },
          {
            filename = "__linox__/graphics/entity/lorax/item-extractor-hr-shadow.png",
            width = 1000,
            height = 666,
            scale = 0.5,
            --shift = util.by_pixel(0, -40),
            draw_as_shadow = true,
          },
        }
      },
      working_visualisations = {
        {
          animation = {
            layers = {
              {
                filename = "__linox__/graphics/entity/lorax/item-extractor-hr-emission-1.png",
                width = 530,
                height = 530,
                scale = 0.5,
                --shift = util.by_pixel(0, -40),
                draw_as_glow = true,
                blend_mode = "additive",
                tint = { 0.0, 1.0, 0.0 },
              },
            }
          }
        }
      }
    },
  }
}