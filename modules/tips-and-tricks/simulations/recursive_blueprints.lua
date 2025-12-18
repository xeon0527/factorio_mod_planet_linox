---@diagnostic disable: need-check-nil
require("__core__/lualib/story")
require("__linox__.global._global")
local util_surface = require("__linox__.scripts.util.surface")
local factory_builder = require("__linox__.scripts.svc.surface.builder.factory-builder")
local rbp_example = require("__linox__/modules/rbp-example/_rbp-example")

local surface = game.surfaces[1]
surface.set_property("gravity", __LINOX_PLANET__.gravity);
surface.set_property("magnetic-field", __LINOX_PLANET__.magnetic_field);
surface.set_property("solar-power", 0);
surface.set_property("pressure", __LINOX_PLANET__.pressure);

surface.create_global_electric_network()
game.forces.player.worker_robots_speed_modifier = 5

local techs = {
  "landfill",
  "foundry",
  "linox-technology_planetary-mining-technology",
  "inserter-capacity-bonus-1",
  "inserter-capacity-bonus-2",
  "inserter-capacity-bonus-3",
  "inserter-capacity-bonus-4",
  "inserter-capacity-bonus-5",
  "inserter-capacity-bonus-6",
  "inserter-capacity-bonus-7",
}
for _, tech in pairs(techs) do
  game.forces.player.technologies[tech].researched = true
end


util_surface.fill_tile {
  surface = surface,
  tile_name = "linox-tile_out-of-map",
  x1 = -30, y1 = -30, x2 = 30, y2 = 30,
}

factory_builder.create(surface, {x = 0, y = 0}, 8);
factory_builder.create_corridor(surface, {x = 0, y = 14}, "down", 25);
factory_builder.create_corridor(surface, {x = -14, y = 0}, "left", 30);
factory_builder.create_corridor(surface, {x = 14, y = 0}, "right", 25);

game.simulation.camera_position = {0, 0}
game.simulation.camera_zoom = 0.7
game.simulation.camera_alt_info = true
game.speed = 2


surface.create_entity{name = "electric-energy-interface", force = "player", position = {-40,-40}}

surface.create_entity{name = "fast-inserter", force = "player", position = {-12,-1}, direction = defines.direction.east}
surface.create_entity{name = "fast-inserter", force = "player", position = {-12, 0}, direction = defines.direction.east}
for x = -13, -35, -1 do
  surface.create_entity{name = "transport-belt", force = "player", position = {x,-1}, direction = defines.direction.west}
  surface.create_entity{name = "transport-belt", force = "player", position = {x, 0}, direction = defines.direction.west}
end
surface.create_entity{name = "fast-inserter", force = "player", position = {-36,-1}, direction = defines.direction.east}
surface.create_entity{name = "fast-inserter", force = "player", position = {-36, 0}, direction = defines.direction.east}
surface.create_entity{name = "bottomless-chest", force = "player", position = {-37,-1}}
surface.create_entity{name = "bottomless-chest", force = "player", position = {-37, 0}}

for y = 13, 15, 1 do
  surface.create_entity{name = "turbo-transport-belt", force = "player", position = {-1, y}, direction = defines.direction.south}
  surface.create_entity{name = "pipe", force = "player", position = { 0, y}, direction = defines.direction.south}
end
surface.create_entity{name = "pipe-to-ground", force = "player", position = {0, 12}, direction = defines.direction.south}

surface.create_entity{name = "fast-inserter", force = "player", position = {-1,16}, direction = defines.direction.north}
surface.create_entity{name = "bottomless-chest", force = "player", position = {-1,17}}

local ipipe = surface.create_entity{name = "infinity-pipe", force = "player", position = {0, 16}, direction = defines.direction.south}
ipipe.set_infinity_pipe_filter {
  name = "lava",
  percentage = 1.0
}


rbp_example.build_TAT(surface, {0,0})

local stor = surface.find_entities_filtered{name = "storage-chest", position = { 0, 0 }, radius = 25}
if stor then
  stor[1].insert{ name = "chemical-plant", count = 10 }
  stor[1].insert{ name = "pipe", count = 100 }
  stor[1].insert{ name = "speed-module-3", count = 50 }
  stor[1].insert{ name = "bulk-inserter", count = 50 }
  stor[1].insert{ name = "requester-chest", count = 50 }
  stor[1].insert{ name = "linox-building_neodymium-bulk-inserter", count = 50 }
  stor[1].insert{ name = "active-provider-chest", count = 50 }
  stor[1].insert{ name = "beacon", count = 40 }
  stor[1].insert{ name = "pipe-to-ground", count = 50 }
  stor[1].insert{ name = "turbo-transport-belt", count = 100 }
  stor[1].insert{ name = "turbo-underground-belt", count = 50 }
  stor[1].insert{ name = "assembling-machine-3", count = 50 }
  stor[1].insert{ name = "productivity-module-3", count = 50 }
  stor[1].insert{ name = "foundry", count = 20 }

  stor[2].insert{ name = "stone", count = 1000 }
  stor[2].insert{ name = "calcite", count = 200 }
  stor[3].insert{ name = "concrete", count = 500 }
end

local rbpt = surface.find_entities_filtered{name = "linox-building_core-roboport", position = { 0, 0 }, radius = 25}
rbpt[1].insert{ name = "linox_samarium-logistic-robot", count = 100 }
rbpt[2].insert{ name = "linox_samarium-construction-robot", count = 100 }