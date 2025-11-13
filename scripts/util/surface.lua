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

return __MODULE__