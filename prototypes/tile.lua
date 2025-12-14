local collision_masks = data.raw["utility-constants"].default["default_collision_masks"]["character/flying"]
collision_masks.layers["linox-collision-layer_flying"] = true

table.insert(out_of_map_tile_type_names, "linox-tile_out-of-map");



local transition = {
  mask_enabled = false,
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
  },
  --mask_layout =
  --{
  --  outer_corner =
  --  {
  --    spritesheet = "__linox__/graphics/terrain/tutorial-grid-outer-corner-mask.png",
  --    count = 4,
  --    tile_height = 2,
  --    scale = 0.5
  --  },
  --  inner_corner =
  --  {
  --    spritesheet = "__linox__/graphics/terrain/tutorial-grid-inner-corner-mask.png",
  --    count = 4,
  --    tile_height = 2,
  --    scale = 0.5
  --  },
  --  side =
  --  {
  --    spritesheet = "__linox__/graphics/terrain/tutorial-grid-side-mask.png",
  --    count = 16,
  --    tile_height = 2,
  --    scale = 0.5
  --  },
  --  o_transition =
  --  {
  --    spritesheet = "__linox__/graphics/terrain/tutorial-grid-o-mask.png",
  --    count = 2,
  --    scale = 0.5
  --  }
  --}
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


tile = table.deepcopy(data.raw.tile["tutorial-grid"]);
tile.name = "linox-tile_linox-foundation"
tile.walking_speed_modifier = 1.5;
tile.minable = nil;
tile.allows_being_covered = true;
tile.can_be_part_of_blueprint = false;
tile.is_foundation = true;
tile.hidden = true;
tile.variants.main = nil
tile.variants.transition = transition
tile.variants.material_background = {
  picture = "__linox__/graphics/terrain/patch-concrete.png",
  count = 8,
  scale = 0.5,
}
tile.map_color = {57, 39, 26}
tile.tint = { 0.66, 0.66, 0.66 }
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



tile = table.deepcopy(data.raw.tile["tutorial-grid"]);
tile.name = "linox-tile_linox-terminal-platform"
--tile.transition_overlay_layer_offset = 2
--tile.decorative_removal_probability = 0.25
tile.walking_speed_modifier = 1.5;
tile.minable = nil;
tile.allows_being_covered = false;
tile.can_be_part_of_blueprint = false;
tile.is_foundation = true;
tile.hidden = true;
tile.variants.main = nil
tile.variants.transition = transition
tile.variants.material_background = {
  picture = "__linox__/graphics/terrain/concrete.png",
  count = 8,
  scale = 0.5,
}
tile.collision_mask.layers["linox-collision-layer_terminal"] = true
tile.map_color = { 0.07, 0.07, 0.07 }
tile.tint = { 0.33, 0.33, 0.33 }
data:extend{tile}



tile = table.deepcopy(data.raw.tile["tutorial-grid"]);
tile.name = "linox-tile_linox-hazard-terminal-platform"
--tile.transition_overlay_layer_offset = 2
--tile.decorative_removal_probability = 0.25
tile.walking_speed_modifier = 1.5;
tile.minable = nil;
tile.allows_being_covered = false;
tile.can_be_part_of_blueprint = false;
tile.is_foundation = true;
tile.hidden = true;
tile.variants.main = nil
tile.variants.transition = transition
tile.variants.material_background = {
  picture = "__linox__/graphics/terrain/hazard-concrete-left.png",
  count = 8,
  scale = 0.5,
}
tile.collision_mask.layers["linox-collision-layer_terminal"] = true
tile.map_color = { 0.386, 0.153, 0.121 }
tile.tint = { 0.66, 0.25, 0.25 }
data:extend{tile}



tile = table.deepcopy(data.raw.tile["tutorial-grid"]);
tile.name = "linox-tile_linox-facility-platform"
tile.walking_speed_modifier = 1.5;
tile.minable = nil;
tile.allows_being_covered = false;
tile.can_be_part_of_blueprint = false;
tile.is_foundation = true;
tile.hidden = true;
tile.variants.main = nil
tile.variants.transition = transition
tile.variants.material_background = {
  picture = "__linox__/graphics/terrain/concrete.png",
  count = 8,
  scale = 0.5,
}
tile.map_color = { 0.75, 0.75, 1.0 }
tile.tint = { 0.75, 0.75, 1.0 }
data:extend{tile}

tile = table.deepcopy(data.raw.tile["tutorial-grid"]);
tile.name = "linox-tile_linox-hazard-facility-platform"
tile.walking_speed_modifier = 1.5;
tile.minable = nil;
tile.allows_being_covered = false;
tile.can_be_part_of_blueprint = false;
tile.is_foundation = true;
tile.hidden = true;
tile.variants.main = nil
tile.variants.transition = transition
tile.variants.material_background = {
  picture = "__linox__/graphics/terrain/hazard-concrete-left.png",
  count = 8,
  scale = 0.5,
}
tile.map_color = { 1.0, 1.0, 0.75 }
tile.tint = { 0.75, 0.75, 0}
data:extend{tile}



tile = table.deepcopy(data.raw.tile["tutorial-grid"]);
tile.name = "linox-tile_linox-corridor";
tile.walking_speed_modifier = 3;
tile.minable = nil;
tile.allows_being_covered = false;
tile.can_be_part_of_blueprint = false;
tile.is_foundation = true;
tile.hidden = true;
tile.variants.main = nil
tile.variants.transition = transition
tile.variants.material_background = {
  picture = "__linox__/graphics/terrain/concrete.png",
  count = 8,
  scale = 0.5,
}

data:extend{tile}



tile = table.deepcopy(data.raw.tile["tutorial-grid"]);
tile.name = "linox-tile_linox-corridor-edge"
tile.walking_speed_modifier = 3;
tile.minable = nil;
tile.allows_being_covered = false;
tile.can_be_part_of_blueprint = false;
tile.is_foundation = true;
tile.hidden = true;
tile.variants.main = nil
tile.variants.transition = transition
tile.variants.material_background = {
  picture = "__linox__/graphics/terrain/hazard-concrete-left.png",
  count = 8,
  scale = 0.5,
}
tile.map_color = {0.5, 0.5, 0.85}
tile.tint = { 0.5, 0.5, 1.0 }
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
}
data:extend{tile}



tile = table.deepcopy(data.raw.tile["tutorial-grid"]);
tile.name = "linox-tile_linox-datacenter"
tile.walking_speed_modifier = 1.5;
tile.minable = nil;
tile.allows_being_covered = false;
tile.can_be_part_of_blueprint = false;
tile.is_foundation = true;
tile.hidden = true;
tile.variants.main = nil
tile.variants.transition = transition
tile.variants.material_background = {
  picture = "__linox__/graphics/terrain/concrete.png",
  count = 8,
  scale = 0.5,
}
tile.map_color = { 0.5, 0.75, 0.5 }
tile.tint = { 0.8, 1.0, 0.8 }
data:extend{tile}