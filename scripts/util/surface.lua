local bbox = require("scripts.util.bounding-box")

local __MODULE__ = {}

__MODULE__.fill_tile = function(args)
  if not args.surface or not args.tile_name then return end

  local t = 0;
  local b = 0;
  local l = 0;
  local r = 0;

  if args.x1 and args.y1 and args.x2 and args.y2 and
    args.x2 >= args.x1 and args.y2 >= args.y1 then
    t = args.y1;
    b = args.y2;
    l = args.x1;
    r = args.x2;
  elseif args.x and args.y and args.radius then
    local radius_div = args.radius / 2.0;
    t = args.y - radius_div;
    b = args.y + radius_div - 1.0;
    l = args.x - radius_div;
    r = args.x + radius_div - 1.0;
  else
    return
  end

  local tiles = {};
  for x = l, r do
    for y = t, b do
      table.insert(tiles, {
        position = { x = x, y = y },
        name = args.tile_name,
      });
    end
  end
  args.surface.set_tiles(tiles);
end

__MODULE__.get_total_consume = function(surface)
  local consume = 0.0
  local stat = surface.global_electric_network_statistics;
  if stat then
    for name, _ in pairs(stat.input_counts) do
      consume = consume + stat.get_flow_count {
        precision_index = defines.flow_precision_index.five_seconds,
        category = "input",
        count = false,
        sample_index = 1,
        name  = name,
      }
    end
  end
  return consume
end

__MODULE__.teleport = function(player, area, surface)
  local character = player.character
  if not character or not character.valid then return end

  local pos = surface.find_non_colliding_position_in_box(character.name, area, 0.1)
  if not pos then
    pos = bbox.get_center(area)
  end
  player.teleport(pos, surface)
end


return __MODULE__