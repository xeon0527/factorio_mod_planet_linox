local entity = table.deepcopy(data.raw["cargo-landing-pad"]["cargo-landing-pad"]);

entity.name = "linox-building_cargo-landing-pad";
entity.inventory_size = 40;
entity.trash_inventory_size = 10;
entity.radar_range = 5;

local tint = { 1.0, 0.66, 0.66 };
for _, v1 in pairs(entity.graphics_set.connections) do
  for _, v2 in pairs(v1) do
    for _, v3 in pairs(v2) do
      if v3.layers then
        v3.layers[1].tint = tint;
      else
        v3.tint = tint;
      end
    end
  end
end

data:extend{ entity, }