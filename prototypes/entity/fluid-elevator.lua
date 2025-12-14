---@diagnostic disable: assign-type-mismatch
local sounds = require("__base__.prototypes.entity.sounds")
local hit_effects = require("__base__.prototypes.entity.hit-effects")

local tint = {1.0, 0.5, 1.0};

data:extend {
  {
    type = "pipe-to-ground",
    name = "linox-building_fluid-elevator",
    icons = {{
      icon = "__base__/graphics/icons/pipe-to-ground.png",
      tint = tint,
    }},
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "linox-building_fluid-elevator"},
    max_health = 150,
    corpse = "pipe-to-ground-remnants",
    dying_explosion = "pipe-to-ground-explosion",
    --factoriopedia_simulation = simulations.factoriopedia_pipe_to_ground,
    icon_draw_specification = {scale = 0.5},
    fast_replaceable_group = "pipe",
    collision_box = {{-0.29, -0.29}, {0.29, 0.2}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),

    tile_buildability_rules = {
      {
        area = {{-0.4, -0.4}, {0.4, 0.4}},
        required_tiles = {
          layers = {
            ["linox-collision-layer_terminal"] = true},
          }
      }
    },

    fluid_box =
    {
      volume = 100,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        { direction = defines.direction.north, position = {0, 0} },
        {
          connection_type = "linked",
          linked_connection_id = 0,
          direction = defines.direction.south,
          position = {0, 0},
        }
      },
      hide_connection_info = true
    },

    impact_category = "metal",
    working_sound = sounds.pipe,
    open_sound = sounds.metal_small_open,
    close_sound = sounds.metal_small_close,
    pictures =
    {
      north =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-up.png",
        priority = "extra-high",
        tint = tint,
        width = 128,
        height = 128,
        scale = 0.5
      },
      south =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-down.png",
        priority = "extra-high",
        tint = tint,
        width = 128,
        height = 128,
        scale = 0.5
      },
      west =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-left.png",
        priority = "extra-high",
        tint = tint,
        width = 128,
        height = 128,
        scale = 0.5
      },
      east =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-right.png",
        priority = "extra-high",
        tint = tint,
        width = 128,
        height = 128,
        scale = 0.5
      }
    },
    visualization =
    {
      north =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/visualization.png",
        priority = "extra-high",
        x = 64,
        size = 64,
        scale = 0.5,
        flags = {"icon"}
      },
      south =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/visualization.png",
        priority = "extra-high",
        x = 192,
        size = 64,
        scale = 0.5,
        flags = {"icon"}
      },
      west =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/visualization.png",
        priority = "extra-high",
        x = 256,
        size = 64,
        scale = 0.5,
        flags = {"icon"}
      },
      east =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/visualization.png",
        priority = "extra-high",
        x = 128,
        size = 64,
        scale = 0.5,
        flags = {"icon"}
      },
    },
    disabled_visualization =
    {
      north =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/disabled-visualization.png",
        priority = "extra-high",
        x = 64,
        size = 64,
        scale = 0.5,
        flags = {"icon"}
      },
      south =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/disabled-visualization.png",
        priority = "extra-high",
        x = 192,
        size = 64,
        scale = 0.5,
        flags = {"icon"}
      },
      west =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/disabled-visualization.png",
        priority = "extra-high",
        x = 256,
        size = 64,
        scale = 0.5,
        flags = {"icon"}
      },
      east =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/disabled-visualization.png",
        priority = "extra-high",
        x = 128,
        size = 64,
        scale = 0.5,
        flags = {"icon"}
      },
    },
  },
}


-- local entity = table.deepcopy(data.raw["pump"]["pump"]);
-- entity.name = "linox-building_fluid-elevator";
-- entity.minable.result = "linox-building_fluid-elevator";
-- entity.fluid_box.volume = 6000 / 60;
-- entity.energy_source =
-- {
--   type = "electric",
--   usage_priority = "secondary-input",
--   drain = "100kW"
-- };
-- entity.energy_usage = "900kW";
-- entity.pumping_speed = 6000 / 60;
-- entity.animations.north.tint = tint;
-- entity.animations.east.tint = tint;
-- entity.animations.south.tint = tint;
-- entity.animations.west.tint = tint;
-- entity.fluid_wagon_connector_speed = nil;
-- entity.fluid_wagon_connector_frame_count = nil;
-- entity.fluid_wagon_connector_alignment_tolerance = nil;
-- entity.fluid_wagon_connector_graphics = nil;
-- entity.icon = nil;
-- entity.icons = {{
--   icon = "__base__/graphics/icons/pump.png",
--   tint = tint,
-- }};
-- entity.surface_conditions = {
--   { property = "magnetic-field", min = 1600, max = 1600 },
--   { property = "gravity", min = 2, max = 2, }
-- }
-- entity.tile_buildability_rules = {
--   {
--     area = {{-0.29, -0.9}, {0.29, 0.9}},
--     required_tiles = {
--       layers = {
--         ["linox-collision-layer_terminal"] = true},
--       }
--   }
-- }



-- local entity_input = table.deepcopy(entity);
-- entity_input.name = "linox-building_fluid-elevator-input";
-- entity_input.hidden = true;
-- entity_input.fluid_box.pipe_connections = {
--   {position = {0, -0.5}, direction = defines.direction.north, flow_direction = "output",  connection_type = "linked", linked_connection_id = 25702570},
--   {position = {0, 0.5}, direction = defines.direction.south, flow_direction = "input", connection_type = "normal"},
-- };

-- local entity_output = table.deepcopy(entity);
-- entity_output.name = "linox-building_fluid-elevator-output";
-- entity_output.hidden = true;
-- entity_output.fluid_box.pipe_connections = {
--   {position = {0, -0.5}, direction = defines.direction.north, flow_direction = "output", connection_type = "normal"},
--   {position = {0, 0.5}, direction = defines.direction.south, flow_direction = "input",  connection_type = "linked", linked_connection_id = 25702570},
-- };

-- data:extend(
-- {
--   entity,
--   entity_input,
--   entity_output,
-- })



local item = table.deepcopy(data.raw.item["pipe-to-ground"]);
item.name = "linox-building_fluid-elevator";
item.place_result = "linox-building_fluid-elevator";
item.stack_size = 10;
item.default_import_location = "linox-planet_linox";
item.weight = 10 * tons;
item.icon = nil;
item.icons = {{
  icon = "__base__/graphics/icons/pipe-to-ground.png",
  tint = tint,
}};
data:extend { item, }



local recipe = {
  type = "recipe",
  name = "linox-building_fluid-elevator",
  energy_required = 3,
  enabled = false,
  ingredients =
  {
    {type = "item", name = "tungsten-gear-wheel", amount = 25},
    {type = "item", name = "electronic-circuit", amount = 10},
    {type = "item", name = "iron-plate", amount = 10},
    {type = "item", name = "copper-plate", amount = 10},
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
      },
    },
  results = {{type="item", name="linox-building_fluid-elevator", amount = 2}},
}
data:extend { recipe, }