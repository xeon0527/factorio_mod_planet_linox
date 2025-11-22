data:extend{{type = "collision-layer", name = "linox-collision-layer_flying",}}

local collision_masks = data.raw["utility-constants"].default["default_collision_masks"]["character/flying"]
collision_masks.layers["linox-collision-layer_flying"] = true

table.insert(out_of_map_tile_type_names, "linox-tile_out-of-map");
local out_of_map_copy = table.deepcopy(data.raw.tile["out-of-map"]);
out_of_map_copy.name = "linox-tile_out-of-map";
out_of_map_copy.autoplace = {
  probability_expression =  "elevation == 0",
};
out_of_map_copy.collision_mask.layers["linox-collision-layer_flying"] = true

local lab_dark_1_copy = table.deepcopy(data.raw.tile["lab-dark-1"]);
lab_dark_1_copy.name = "linox-tile_lab-dark-1";
lab_dark_1_copy.autoplace = {
  probability_expression =  "(elevation == 1) & ((abs(x) %% 2) == ((abs(y) %% 2) == 1))",
};

local lab_dark_2_copy = table.deepcopy(data.raw.tile["lab-dark-2"]);
lab_dark_2_copy.name = "linox-tile_lab-dark-2";
lab_dark_2_copy.autoplace = {
  probability_expression = "(elevation == 1) & ((abs(x) %% 2) == ((abs(y) %% 2) == 0))",
};

local foundation_copy = table.deepcopy(data.raw.tile["foundation"]);
foundation_copy.name = "linox-tile_linox-foundation";
foundation_copy.autoplace = {
  probability_expression = "elevation == 2",
};
foundation_copy.walking_speed_modifier = 1;
foundation_copy.minable = nil;

local linox_lava = table.deepcopy(data.raw.tile["lava-hot"]);
linox_lava.name = "linox-tile_superheated-lava";
linox_lava.autoplace = {
  probability_expression = "elevation == 0",
};
linox_lava.tint = { 1.0, 1.0, 0.5 };
linox_lava.allows_being_covered = false;
linox_lava.collision_mask = {
  layers = {
    ground_tile=true,
    water_tile=true,
    empty_space=true,
    resource=true,
    floor=true,
    item=true,
    --object=true,
    player=true,
    doodad=true,
  }
};

local refined_concrete_copy = table.deepcopy(data.raw.tile["refined-concrete"]);
refined_concrete_copy.name = "linox-tile_linox-terminal-platform";
refined_concrete_copy.minable = nil;
refined_concrete_copy.allows_being_covered = false;
refined_concrete_copy.can_be_part_of_blueprint = false;
refined_concrete_copy.is_foundation = true;
refined_concrete_copy.hidden = true;
refined_concrete_copy.map_color = { r = 0.07, g = 0.07, b = 0.07, a = 1.0 };
refined_concrete_copy.tint = { 0.33, 0.33, 0.33 };

local refined_hazard_concrete_copy = table.deepcopy(data.raw.tile["refined-hazard-concrete-left"]);
refined_hazard_concrete_copy.name = "linox-tile_linox-hazard-terminal-platform";
refined_hazard_concrete_copy.minable = nil;
refined_hazard_concrete_copy.allows_being_covered = false;
refined_hazard_concrete_copy.can_be_part_of_blueprint = false;
refined_hazard_concrete_copy.is_foundation = true;
refined_hazard_concrete_copy.hidden = true;
refined_hazard_concrete_copy.map_color = { r = 0.386, g = 0.153, b = 0.121, a = 1.0 };
refined_hazard_concrete_copy.tint = { 1.0, 0.5, 0.5 };

local tutorial_grid_copy = table.deepcopy(data.raw.tile["tutorial-grid"]);
tutorial_grid_copy.name = "linox-tile_linox-corridor";
tutorial_grid_copy.walking_speed_modifier = 3;
tutorial_grid_copy.minable = nil;
tutorial_grid_copy.allows_being_covered = false;
tutorial_grid_copy.can_be_part_of_blueprint = false;
tutorial_grid_copy.is_foundation = true;
tutorial_grid_copy.hidden = true;

local tile = table.deepcopy(data.raw.tile["refined-concrete"]);
tile.name = "linox-tile_linox-datacenter";
tile.minable = nil;
tile.allows_being_covered = false;
tile.can_be_part_of_blueprint = false;
tile.is_foundation = true;
tile.hidden = true;
tile.map_color = { 0.85, 0.85, 0.85 };
tile.tint = { 0.8, 1.0, 0.8 };

data:extend { tile }

data:extend(
{
  out_of_map_copy,
  --lab_dark_1_copy,
  --lab_dark_2_copy,
  foundation_copy,
  linox_lava,
  refined_concrete_copy,
  refined_hazard_concrete_copy,
  tutorial_grid_copy,
})