local tool_name = "badchest-area-viewer"
local item_sounds = require("__base__.prototypes.item_sounds")

data:extend {
  {
    type = "selection-tool",
    name = "linox-tool_"..tool_name,
    icon = "__rec-blue-plus__/graphics/blueprint-deployer-icon.png",
    icon_size = 64,

    flags = {"not-stackable", "spawnable", "mod-openable", "only-in-cursor"},
    auto_recycle = false,
    subgroup = "spawnables",
    inventory_move_sound = item_sounds.planner_inventory_move,
    pick_sound = item_sounds.planner_inventory_pickup,
    drop_sound = item_sounds.planner_inventory_move,
    stack_size = 1,
    select =
    {
      border_color = {128, 128, 255},
      mode = {"entity-with-health"},
      cursor_box_type = "entity",
      entity_filters = {
        "blueprint-deployer2",
      },
    },
    alt_select =
    {
      border_color = {128, 128, 255},
      mode = {"entity-with-health"},
      cursor_box_type = "entity",
      entity_filters = {
        "blueprint-deployer2",
      },
    },
  },
  {
    type = "custom-input",
    name = "linox-tool_"..tool_name,
    key_sequence = "",
    controller_key_sequence = "",
    block_modifiers = true,
    consuming = "game-only",
    item_to_spawn = "linox-tool_"..tool_name,
    action = "spawn-item"
  },
  {
    type = "shortcut",
    name = "linox-tool_"..tool_name,
    order = "e["..tool_name.."]",
    action = "spawn-item",
    associated_control_input = "linox-tool_"..tool_name,
    unavailable_until_unlocked = true,
    item_to_spawn = "linox-tool_"..tool_name,
    icon = "__rec-blue-plus__/graphics/blueprint-deployer-icon.png",
    icon_size = 64,
    small_icon = "__rec-blue-plus__/graphics/blueprint-deployer-icon.png",
    small_icon_size = 64,
  },
}