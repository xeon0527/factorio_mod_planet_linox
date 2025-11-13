local original_graphic_size = 8
local structure_size = 4
local shift_y = 0.75

data:extend {
  {
    type = "simple-entity-with-force",
    name = "linox-entity_npc-lorax",
    flags = {
      "not-rotatable",
      "placeable-neutral",
      "placeable-off-grid",
      "get-by-unit-number", 
      "not-deconstructable",
      "not-blueprintable", 
    },

    icon = "__space-exploration-graphics__/graphics/icons/nexus.png",
    icon_size = 64,
    max_health = 1000,
    collision_box = {{structure_size/-2+0.3, structure_size/-2+0.3}, {structure_size/2-0.3, structure_size/2-0.3}},
    selection_box = {{-structure_size/2, -structure_size/2}, {structure_size/2, structure_size/2}},
    display_box = {{-structure_size/2, -structure_size/2-2}, {structure_size/2, structure_size/2}},

    animations ={
      layers = {
        {
          filename = "__space-exploration-graphics-3__/graphics/entity/nexus/nexus-inactive.png",
          frame_count = 1,
          height = 541,
          width = 467,
          repeat_count = 64,
          shift = { 0/32, -12/32+shift_y},
          scale = 0.5 * structure_size/original_graphic_size,
        },
        {
          draw_as_shadow = true,
          filename = "__space-exploration-graphics-3__/graphics/entity/nexus/nexus-shadow.png",
          frame_count = 1,
          width = 599,
          height = 345,
          repeat_count = 64,
          shift = { 1.40625, 0.34375 +shift_y},
          scale = 0.5 * structure_size/original_graphic_size,
        }
      }
    },
  }
}