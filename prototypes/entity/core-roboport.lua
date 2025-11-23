local blank_image = {
    filename = "__space-exploration-graphics__/graphics/blank.png",
    width = 1,
    height = 1,
    frame_count = 1,
    line_length = 1,
    shift = { 0, 0 },
}
local charging_offsets = {}
local radius = 2
for i = 1, 20 do
  local a = i/20
  table.insert(charging_offsets, {math.sin(a * 2 * math.pi) * radius, -0.5 + (math.cos(a * 2 * math.pi) * radius * 0.5)})
end

data:extend({
  {
    type = "roboport",
    name = "linox-building_core-roboport",
    logistics_radius = 16,
    logistics_connection_distance = 16,
    robot_slots_count = 4,
    material_slots_count = 4,
    construction_radius = 16,
    minable = {
      mining_time = 0.1,
      result = "linox-building_core-roboport",
    },
    icon = "__space-exploration-graphics__/graphics/icons/supercharger.png",
    icon_size = 64,
    base = {
      layers = {
        {
          direction_count = 1,
          filename = "__space-exploration-graphics-3__/graphics/entity/supercharger/supercharger.png",
          width = 256,
          height = 320,
          frame_count = 1,
          shift = { 0, -0.5 },
          scale = 0.25,
        },
        {
          draw_as_shadow = true,
          direction_count = 1,
          filename = "__space-exploration-graphics-3__/graphics/entity/supercharger/supercharger-shadow.png",
          width = 298,
          height = 165,
          frame_count = 1,
          shift = { 0.6, 0.0 },
          scale = 0.25,
        },
      }
    },
    base_animation = blank_image,
    base_patch = blank_image,
    charge_approach_distance = 4,
    charging_energy = "5MW",
    charging_offsets = charging_offsets,
    collision_box = { { -0.8, -0.8 }, { 0.8, 0.8 } },
    selection_box = {{-1, -1}, {1, 1}},
    drawing_box_vertical_extension = 1.15,
    corpse = "roboport-remnants",
    damaged_trigger_effect = {
      entity_name = "spark-explosion",
      offset_deviation = {{-0.5,-0.5},{0.5,0.5}},
      offsets = {{0,1}},
      type = "create-entity"
    },
    door_animation_down = blank_image,
    door_animation_up = blank_image,
    draw_construction_radius_visualization = true,
    draw_logistic_radius_visualization = true,
    dying_explosion = "roboport-explosion",
    energy_source = {
      buffer_capacity = "100MJ",
      input_flow_limit = "100MW",
      type = "electric",
      usage_priority = "secondary-input"
    },
    energy_usage = "1MW",
    flags = {
      "placeable-player",
      "player-creation"
    },
    max_health = 500,
    open_sound = data.raw["roboport"]["roboport"].open_sound,
    close_sound = data.raw["roboport"]["roboport"].close_sound,
    recharge_minimum = "40MJ",
    recharging_animation = {
      animation_speed = 0.5,
      filename = "__base__/graphics/entity/roboport/roboport-recharging.png",
      frame_count = 16,
      height = 35,
      priority = "high",
      scale = 1.5,
      width = 37
    },
    recharging_light = {
      color = {
        b = 1,
        g = 1,
        r = 1
      },
      intensity = 0.4,
      size = 5
    },
    request_to_open_door_timeout = 15,
    resistances = {
      { type = "fire", percent = 100 },
      { type = "electric", percent = 100 }
    },
    spawn_and_station_height = -0.1,
    stationing_offset = {0,0},
    impact_category = "metal",
    water_reflection = {
      orientation_to_variation = false,
      pictures = {
        filename = "__base__/graphics/entity/roboport/roboport-reflection.png",
        height = 28,
        priority = "extra-high",
        scale = 5,
        shift = {
          0,
          2.34375
        },
        variation_count = 1,
        width = 28
      },
      rotate = false
    },
    working_sound = {
      audible_distance_modifier = 0.5,
      max_sounds_per_type = 3,
      probability = 0.0033333333,
      sound = {
        filename = "__base__/sound/roboport-working.ogg",
        volume = 0.6
      }
    },

    circuit_connector = circuit_connector_definitions.create_single
    (
      universal_connector_template,
      { variation = 26, main_offset = util.by_pixel(0.5, 0), shadow_offset = util.by_pixel(2.5, 15.5), show_shadow = false }
    ),
    
    circuit_wire_max_distance = default_circuit_wire_max_distance,

    default_available_logistic_output_signal = {type = "virtual", name = "signal-X"},
    default_total_logistic_output_signal = {type = "virtual", name = "signal-Y"},
    default_available_construction_output_signal = {type = "virtual", name = "signal-Z"},
    default_total_construction_output_signal = {type = "virtual", name = "signal-T"},
    default_roboport_count_output_signal = {type = "virtual", name = "signal-R"},
  },
})



local item = {
  type = "item",
  name = "linox-building_core-roboport",
  subgroup = "logistic-network",
  order = "c[signal]-b[core-roboport]",
  icon = "__space-exploration-graphics__/graphics/icons/supercharger.png",
  icon_size = 64,
  stack_size = 20,
  weight = 50 * kg,
  place_result = "linox-building_core-roboport",
  default_import_location = "linox-planet_linox",
};

data:extend { item, }



local recipe = {
  type = "recipe",
  name = "linox-building_core-roboport",
  energy_required = 10,
  enabled = false,
  ingredients =
  {
    {type = "item", name = "steel-plate", amount = 25},
    {type = "item", name = "linox-item_tungsten-gear-wheel", amount = 25},
    {type = "item", name = "advanced-circuit", amount = 25},
    {type = "item", name = "processing-unit", amount = 10},
    {type = "item", name = "tungsten-carbide", amount = 10},
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
  results = {{type="item", name="linox-building_core-roboport", amount=1}},
  icon = "__space-exploration-graphics__/graphics/icons/supercharger.png",
  icon_size = 64,
}

data:extend { recipe, }