local cargo_landing_pad_copy = table.deepcopy(data.raw["cargo-landing-pad"]["cargo-landing-pad"]);

cargo_landing_pad_copy.name = "linox-entity_cargo-landing-pad";
cargo_landing_pad_copy.inventory_size = 40;
cargo_landing_pad_copy.trash_inventory_size = 10;
cargo_landing_pad_copy.radar_range = 5;

local tint = { 1.0, 0.66, 0.66 };
for _, v1 in pairs(cargo_landing_pad_copy.graphics_set.connections) do
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

data:extend(
{
  cargo_landing_pad_copy,
})