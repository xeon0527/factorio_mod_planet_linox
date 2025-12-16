---@diagnostic disable: param-type-mismatch
local rbp_code = require("global.rbp-example.rbp-new")
local rbp_string = require("global.rbp-example.string")
local rbp_tat = require("global.rbp-example.rbp-tat")


local function __is_combinator(name)
  return name == "arithmetic-combinator" or
    name == "decider-combinator" or
    name == "selector-combinator" or
    name == "constant-combinator"
end

local __MODULE__ = {}

__MODULE__.create_book = function(inventory, book_code)
  local _book_code = book_code
  if not _book_code then _book_code = rbp_code.book end

  local inv = game.create_inventory(1)
  inv.insert { name = "blueprint" }
  inv[1].import_stack(_book_code)
  inventory.insert(inv[1])
  inv.destroy()
end

__MODULE__.create_localization_blueprint_item = function(inventory, language)
  local lang = language
  if lang == nil then lang = "english" end

  local loc = rbp_string[language]
  if loc == nil then
    loc = rbp_string["english"]
  end

  local inv = game.create_inventory(1)
  inv.insert { name = "blueprint" }
  inv[1].import_stack(rbp_code.full)
  local bp = inv[1]

  bp.blueprint_description = "Made by SkunkMaster"

  local entities = bp.get_blueprint_entities()
  for _, e in pairs(entities) do
    if __is_combinator(e.name) then
      for id, txt in pairs(loc) do
        local idid = "{"..id.."}"
        if e.player_description == idid then
          e.player_description = txt
        end
      end
    elseif e.name == "display-panel" then
      for id, txt in pairs(loc) do
        local idid = "{"..id.."}"
        if e.text == idid then
          e.text = txt
        end
      end
    end
  end
  bp.set_blueprint_entities(entities)
  inventory.insert(bp)
  inv.destroy()
end


__MODULE__.build = function(surface, position)
  local inv = game.create_inventory(1)
  __MODULE__.create_localization_blueprint_item(inv, settings.global["linox-settings_rbp-example-global-language"].value)

  local bp_entities = inv[1].build_blueprint{
    surface = surface,
    force = "player",
    position= position,
    build_mode=defines.build_mode.forced,
  };

  for _, ghost in pairs(bp_entities) do
    if ghost.valid then
      _, ett = ghost.silent_revive{raise_revive = (ghost.ghost_name == "blueprint-deployer2")};
      if ett.name == "blueprint-deployer2" then
        __MODULE__.create_book(ett.get_inventory(defines.inventory.chest))
      end
    end
  end
end

__MODULE__.build_TAT = function(surface, position)
  local inv = game.create_inventory(1)
  inv.insert { name = "blueprint" }
  inv[1].import_stack(rbp_tat.full)

  local bp_entities = inv[1].build_blueprint{
    surface = surface,
    force = "player",
    position= position,
    build_mode=defines.build_mode.forced,
  };

  for _, ghost in pairs(bp_entities) do
    if ghost.valid then
      _, ett = ghost.silent_revive{raise_revive = (ghost.ghost_name == "blueprint-deployer2")};
      if ett.name == "blueprint-deployer2" then
        __MODULE__.create_book(ett.get_inventory(defines.inventory.chest), rbp_tat.book)
      end
    end
  end

  inv.destroy()
end

return __MODULE__