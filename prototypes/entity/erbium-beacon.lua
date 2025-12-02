local entity = table.deepcopy(data.raw["beacon"]["beacon"]);

entity.name = "linox-building_earbium-beacon"
entity.icon = "__space-exploration-graphics__/graphics/icons/wide-beacon.png"
entity.icon_size = 64
entity.minable = {mining_time = 0.2, result = "beacon"}
entity.module_slots = 4
entity.graphics_set = nil
entity.animation = {
  layers = {
    {
      animation_speed = 0.5,
      filename = "__space-exploration-graphics-4__/graphics/entity/wide-beacon/wide-beacon.png",
      frame_count = 32,
      width = 256,
      height = 320,
      line_length = 8,
      shift = { 0, -0.25 },
      scale = 0.33,
    },
    {
      draw_as_shadow = true,
      animation_speed = 0.5,
      filename = "__space-exploration-graphics-4__/graphics/entity/wide-beacon/wide-beacon-shadow.png",
      frame_count = 32,
      width = 330,
      height = 174,
      line_length = 4,
      shift = { 0.5+4/32, 0.5+4/32 },
      scale = 0.33,
    },
  }
}
entity.water_reflection = nil

data:extend { entity, }