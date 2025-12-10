require("global._global");

require("prototypes.entity._entity")
require("prototypes.item._item")
require("prototypes.recipe._recipe")
require("prototypes.technology._technology")

require("prototypes.planet.map-gen")
require("prototypes.planet.planet")

require("prototypes.tool._tool")
require("prototypes.fluid._fluid")
require("prototypes.custom-event")
require("prototypes.custom-input")
require("prototypes.equipment")
require("prototypes.recipe-category")
require("prototypes.shortcuts")
require("prototypes.sprits")
require("prototypes.tile")
require("prototypes.tips-and-tricks")
require("prototypes.collision-layer")
require("prototypes.corpse")

--local constants = data.raw["utility-constants"].default
--constants.max_fluid_flow=200

if mods["any-planet-start"] then
---@diagnostic disable-next-line: undefined-global
  APS.add_planet {
    name = "linox-planet_linox",
    filename = "__linox__/scripts/aps.lua",
    technology = "linox-technology_planet-discovery-linox",
  }
end