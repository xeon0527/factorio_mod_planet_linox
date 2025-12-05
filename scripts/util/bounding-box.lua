local __MODULE__ = {};

__MODULE__.get_center = function(box)
  return {
    x = (box.left_top.x + box.right_bottom.x) / 2.0,
    y = (box.left_top.y + box.right_bottom.y) / 2.0,
  }
end

__MODULE__.get_size = function(box)
  return {
    width = box.right_bottom.x - box.left_top.x,
    height = box.right_bottom.y - box.left_top.y,
  }
end

__MODULE__.normalize = function(box)
  local size = __MODULE__.get_size(box)
  return {
    left_top = {
      x = -(size.width / 2.0),
      y = -(size.height / 2.0),
    },
    right_bottom = {
      x = (size.width / 2.0),
      y = (size.height / 2.0),
    },
  }
end

__MODULE__.move = function(box, position)
  local nbox = __MODULE__.normalize(box)
  nbox.left_top.x = nbox.left_top.x + position.x
  nbox.right_bottom.x = nbox.right_bottom.x + position.x
  nbox.left_top.y = nbox.left_top.y + position.y
  nbox.right_bottom.y = nbox.right_bottom.y + position.y
  return nbox
end

return __MODULE__