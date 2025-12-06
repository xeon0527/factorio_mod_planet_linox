local __MODULE__ = {};

__MODULE__.get_center = function(box)
  return {
    x = (box[1][1] + box[2][1]) / 2.0,
    y = (box[1][2] + box[2][2]) / 2.0,
  }
end

__MODULE__.get_size = function(box)
  return {
    width = box[2][1] - box[1][1],
    height = box[2][2] - box[1][2],
  }
end

__MODULE__.normalize = function(box)
  local size = __MODULE__.get_size(box)
  return {
    left_top = {
      x = -(size[1] / 2.0),
      y = -(size[2] / 2.0),
    },
    right_bottom = {
      x = (size[1] / 2.0),
      y = (size[2] / 2.0),
    },
  }
end

__MODULE__.move = function(box, position)
  local nbox = __MODULE__.normalize(box)
  nbox[1][1] = nbox[1][1] + position.x
  nbox[2][1] = nbox[2][1] + position.x
  nbox[1][2] = nbox[1][2] + position.y
  nbox[2][2] = nbox[2][2] + position.y
  return nbox
end

return __MODULE__