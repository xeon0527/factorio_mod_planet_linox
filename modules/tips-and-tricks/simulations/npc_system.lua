---@diagnostic disable: undefined-global
require("__core__/lualib/story")
local util_surface = require("__linox__.scripts.util.surface")

local surface = game.surfaces[1]

util_surface.fill_tile {
  surface = surface,
  tile_name = "linox-tile_out-of-map",
  x1 = -30,
  y1 = -30,
  x2 = 10,
  y2 = 10,
}

local center_size = 13
local modify_tiles = {};
for xx = -center_size, center_size - 1 do
  for yy = -center_size, center_size - 1 do

    if xx == -center_size or xx == center_size - 1 or
        yy == -center_size or yy == center_size - 1 then
      table.insert(modify_tiles, {
        position = { x = xx, y = yy },
        name = "linox-tile_linox-hazard-terminal-platform"
      });
    else
      table.insert(modify_tiles, {
        position = { x = xx, y = yy },
        name = "linox-tile_linox-terminal-platform"
      });
    end
  end
end
surface.set_tiles(modify_tiles);

util_surface.fill_tile {
  surface = surface,
  tile_name = "linox-tile_linox-datacenter",
  x1 = -21,
  y1 = -21,
  x2 = -14,
  y2 = -11,
}

util_surface.fill_tile {
  surface = surface,
  tile_name = "linox-tile_linox-datacenter",
  x1 = 13,
  y1 = -17,
  x2 = 16,
  y2 = -11,
}

local entity_lorax = surface.create_entity{
  name = "linox-npc_lorax",
  position = {-17, -17},
  force = "neutral",
  create_build_effect_smoke = false,
};

rendering.draw_text{
  text = {"entity-name.linox-npc_lorax"},
  surface = surface,
  target = {
      entity = entity_lorax,
      offset = { 0, 4.5 },
  },
  color = { 1, 1, 0, 1},
  alignment = "center",
  vertical_alignment = "middle"
}

local player = game.simulation.create_test_player{name = "testman"}
player.teleport({-10, -10})
game.simulation.camera_player = player

game.simulation.camera_position = {-13, -13}
game.simulation.camera_zoom = 1

game.simulation.camera_player_cursor_position = {0, -17}

local story_table =
{
  {
    {
      name = "start",
      condition = story_elapsed_check(2),
    },
    { condition = function() return game.simulation.move_cursor({position = {-17, -17}, speed = 0.1}) end },
  }
}
tip_story_init(story_table)