---@diagnostic disable: cast-local-type
local linox_facility = require("scripts.svc.surface.linox-facility")
local util_surface    = require("scripts.util.surface")
local pipeline_builder = require("scripts.svc.surface.builder.internel-pipeline-builder")

if linox_facility.get() then
  local surface = linox_facility.get()

  util_surface.fill_tile {
    surface = surface,
    tile_name = "linox-tile_linox-datacenter",
    x1 = -21,
    y1 = -21,
    x2 = -4,
    y2 = -14,
  }

  util_surface.fill_tile {
    surface = surface,
    tile_name = "linox-tile_linox-datacenter",
    x1 = -21,
    y1 = -13,
    x2 = -14,
    y2 = -4,
  }

  local entity = surface.find_entity("linox-npc_network-terminal", {15, -15})
  if entity then
    entity.teleport({-8, -17});
  end

  entity = surface.find_entity("linox-npc_power-converter", {-15, 15})
  if entity then
    entity.teleport({-17, -6});
  end

  util_surface.fill_tile {
    surface = surface,
    tile_name = "linox-tile_out-of-map",
    x1 = 13,
    y1 = -17,
    x2 = 16,
    y2 = -11,
  }

  util_surface.fill_tile {
    surface = surface,
    tile_name = "linox-tile_out-of-map",
    x1 = -17,
    y1 = 9,
    x2 = -14,
    y2 = 16,
  }

  local force = game.forces["player"]
  local tech = force.technologies

  local pipeline_count = 0

  if tech["linox-technology_ultra-deep-drilling"].researched then
    pipeline_count = pipeline_count + 2
  end

  if tech["linox-technology_linox-petrochemicals"].researched then
    pipeline_count = pipeline_count + 0
  end

  if pipeline_count > 0 and linox_facility.get() then
    local current_pipeline_count = linox_facility.get().count_entities_filtered{name = "linox-special_internel-pipeline"}
    local pos_lim = 1 - current_pipeline_count

    for _i = current_pipeline_count, pipeline_count - 1 do
      if pos_lim > 0 then
        pipeline_builder.create(true)
        pos_lim = pos_lim - 1
      else
        pipeline_builder.create()
      end
    end
  end
end