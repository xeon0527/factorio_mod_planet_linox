local collision_masks = data.raw["utility-constants"].default["default_collision_masks"]["character/flying"]
collision_masks.layers["linox-collision-layer_flying"] = true

table.insert(out_of_map_tile_type_names, "linox-tile_out-of-map");



local transition = {
  overlay_layout =
  {
    inner_corner =
    {
      spritesheet = "__base__/graphics/terrain/tutorial-grid/tutorial-grid-inner-corner.png",
      count = 4,
      tile_height = 2,
      scale = 0.5
    },
    outer_corner =
    {
      spritesheet = "__base__/graphics/terrain/tutorial-grid/tutorial-grid-outer-corner.png",
      count = 4,
      tile_height = 2,
      scale = 0.5
    },
    side =
    {
      spritesheet = "__base__/graphics/terrain/tutorial-grid/tutorial-grid-side.png",
      count = 16,
      tile_height = 2,
      scale = 0.5
    },
    u_transition =
    {
      spritesheet = "__base__/graphics/terrain/tutorial-grid/tutorial-grid-u.png",
      count = 2,
      tile_height = 2,
      scale = 0.5
    },
    o_transition =
    {
      spritesheet = "__base__/graphics/terrain/tutorial-grid/tutorial-grid-o.png",
      count = 2,
      scale = 0.5
    }
  }
}



local tile



tile = table.deepcopy(data.raw.tile["out-of-map"]);
tile.name = "linox-tile_out-of-map";
tile.autoplace = {
  probability_expression =  "elevation == 0",
};
tile.collision_mask.layers["linox-collision-layer_flying"] = true
data:extend{tile}



-- tile = table.deepcopy(data.raw.tile["lab-dark-1"]);
-- tile.name = "linox-tile_lab-dark-1";
-- tile.autoplace = {
--   probability_expression =  "(elevation == 1) & ((abs(x) %% 2) == ((abs(y) %% 2) == 1))",
-- };
-- data:extend(tile)


-- tile = table.deepcopy(data.raw.tile["lab-dark-2"]);
-- tile.name = "linox-tile_lab-dark-2";
-- tile.autoplace = {
--   probability_expression = "(elevation == 1) & ((abs(x) %% 2) == ((abs(y) %% 2) == 0))",
-- };
-- data:extend(tile)



tile = table.deepcopy(data.raw.tile["foundation"]);
tile.name = "linox-tile_linox-foundation";
tile.autoplace = {
  probability_expression = "elevation == 2",
};
tile.walking_speed_modifier = 1.5;
tile.minable = nil;
tile.variants.transition = transition;
tile.transitions = nil
tile.transitions_between_transitions = nil
tile.transition_overlay_layer_offset = nil
tile.decorative_removal_probability = 1
tile.transition_merges_with_tile = nil
data:extend{tile}



tile = table.deepcopy(data.raw.tile["lava-hot"]);
tile.name = "linox-tile_superheated-lava";
tile.autoplace = {
  probability_expression = "elevation == 0",
};
tile.tint = { 1.0, 0.25, 0.25 };
tile.allows_being_covered = false;
tile.collision_mask = {
  layers = {
    ground_tile=true,
    water_tile=true,
    empty_space=true,
    resource=true,
    floor=true,
    item=true,
    player=true,
    doodad=true,
    rail=true,
  }
};
data:extend{tile}



tile = table.deepcopy(data.raw.tile["refined-concrete"]);
tile.name = "linox-tile_linox-terminal-platform";
tile.minable = nil;
tile.allows_being_covered = false;
tile.can_be_part_of_blueprint = false;
tile.is_foundation = true;
tile.hidden = true;
tile.map_color = { r = 0.07, g = 0.07, b = 0.07, a = 1.0 };
tile.tint = { 0.33, 0.33, 0.33 };
tile.collision_mask.layers["linox-collision-layer_terminal"] = true
tile.walking_speed_modifier = 1.5
tile.variants.transition = transition;
tile.transitions = nil
tile.transitions_between_transitions = nil
tile.transition_overlay_layer_offset = nil
tile.decorative_removal_probability = 1
tile.transition_merges_with_tile = nil
tile.layer = 19
data:extend{tile}



tile = table.deepcopy(data.raw.tile["refined-hazard-concrete-left"]);
tile.name = "linox-tile_linox-hazard-terminal-platform";
tile.minable = nil;
tile.allows_being_covered = false;
tile.can_be_part_of_blueprint = false;
tile.is_foundation = true;
tile.hidden = true;
tile.map_color = { r = 0.386, g = 0.153, b = 0.121, a = 1.0 };
tile.tint = { 1.0, 0.5, 0.5 };
tile.collision_mask.layers["linox-collision-layer_terminal"] = true
tile.walking_speed_modifier = 1.5
tile.variants.transition = transition;
tile.transitions = nil
tile.transitions_between_transitions = nil
tile.transition_overlay_layer_offset = nil
tile.decorative_removal_probability = 1
tile.transition_merges_with_tile = nil
tile.layer = 19
data:extend{tile}



tile = table.deepcopy(data.raw.tile["refined-concrete"]);
tile.name = "linox-tile_linox-facility-platform";
tile.minable = nil;
tile.allows_being_covered = false;
tile.can_be_part_of_blueprint = false;
tile.is_foundation = true;
tile.hidden = true;
tile.map_color = { r = 0.07, g = 0.07, b = 0.07, a = 1.0 };
tile.tint = { 0.75, 0.75, 1.0 };
--tile.collision_mask.layers["linox-collision-layer_terminal"] = true
tile.walking_speed_modifier = 1.5
tile.layer = 9
tile.variants.transition = transition;
tile.transitions = nil
tile.transitions_between_transitions = nil
tile.transition_overlay_layer_offset = nil
tile.decorative_removal_probability = 1
tile.transition_merges_with_tile = nil
data:extend{tile}



tile = table.deepcopy(data.raw.tile["refined-hazard-concrete-left"]);
tile.name = "linox-tile_linox-hazard-facility-platform";
tile.minable = nil;
tile.allows_being_covered = false;
tile.can_be_part_of_blueprint = false;
tile.is_foundation = true;
tile.hidden = true;
tile.map_color = { r = 0.386, g = 0.153, b = 0.121, a = 1.0 };
--tile.tint = { 0.75, 0.75,  };
--tile.collision_mask.layers["linox-collision-layer_terminal"] = true
tile.walking_speed_modifier = 1.5
tile.layer = 9
tile.variants.transition = transition;
tile.transitions = nil
tile.transitions_between_transitions = nil
tile.transition_overlay_layer_offset = nil
tile.decorative_removal_probability = 1
tile.transition_merges_with_tile = "linox-tile_linox-facility-platform"
data:extend{tile}



tile = table.deepcopy(data.raw.tile["tutorial-grid"]);
tile.name = "linox-tile_linox-corridor";
tile.walking_speed_modifier = 3;
tile.minable = nil;
tile.allows_being_covered = false;
tile.can_be_part_of_blueprint = false;
tile.is_foundation = true;
tile.hidden = true;
data:extend{tile}

tile = table.deepcopy(data.raw.tile["refined-hazard-concrete-left"]);
tile.name = "linox-tile_linox-corridor-edge";
tile.walking_speed_modifier = 3;
tile.minable = nil;
tile.allows_being_covered = false;
tile.can_be_part_of_blueprint = false;
tile.is_foundation = true;
tile.hidden = true;
tile.tint = { 0.35, 0.35, 1.0 }
tile.map_color={122, 122, 122}
tile.layer = 5
tile.variants.transition = transition;
tile.transitions = nil
tile.transitions_between_transitions = nil
tile.transition_overlay_layer_offset = nil
tile.decorative_removal_probability = 1
tile.transition_merges_with_tile = nil
tile.collision_mask = {
  layers = {
    ground_tile=true,
    water_tile=true,
    empty_space=true,
    resource=true,
    floor=true,
    doodad=true,
    rail=true,
  }
};
data:extend{tile}



tile = table.deepcopy(data.raw.tile["refined-concrete"]);
tile.name = "linox-tile_linox-datacenter";
tile.minable = nil;
tile.allows_being_covered = false;
tile.can_be_part_of_blueprint = false;
tile.is_foundation = true;
tile.hidden = true;
tile.map_color = { 0.85, 0.85, 0.85 };
tile.tint = { 0.8, 1.0, 0.8 };
tile.variants.transition = transition;
tile.transitions = nil
tile.transitions_between_transitions = nil
tile.transition_overlay_layer_offset = nil
tile.decorative_removal_probability = 1
tile.transition_merges_with_tile = nil
data:extend{tile}