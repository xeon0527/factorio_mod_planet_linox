
local ref_belt = data.raw["underground-belt"]["turbo-underground-belt"];

local entity = table.deepcopy(data.raw["linked-belt"]["linked-belt"]);
entity.name = "linox-building_cargo-elevator";
entity.hidden = false;
entity.minable.result = "linox-building_cargo-elevator";
entity.fast_replaceable_group = "transport-belt";
entity.next_upgrade = nil;
entity.belt_animation_set = ref_belt.belt_animation_set;
entity.speed = ref_belt.speed;
entity.tile_buildability_rules = {
  {
    area = {{-0.4, -0.4}, {0.4, 0.4}},
    required_tiles = {
      layers = {
        ["linox-collision-layer_terminal"] = true},
      }
  }
}

data:extend{ entity, }



local item = table.deepcopy(data.raw["item"]["linked-belt"])
item.name = "linox-building_cargo-elevator"
item.subgroup = "belt"
item.color_hint = { text = "5" }
item.order = "b[underground-belt]-e[cargo-elevator]"
item.place_result = "linox-building_cargo-elevator"
item.default_import_location = "linox-planet_linox"
item.weight = 10 * tons

data:extend { item, }



local recipe = {
  type = "recipe",
  name = "linox-building_cargo-elevator",
  energy_required = 10,
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
    }
  },
  results = {{type="item", name="linox-building_cargo-elevator", amount=1}}
}

data:extend { recipe, }