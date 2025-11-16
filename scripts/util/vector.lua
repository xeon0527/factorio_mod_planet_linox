local __MODULE__ = {}

__MODULE__.create = function(x, y)
  return { x = x, y = y }
end

__MODULE__.add = function(vec_1, vec_2)
  return {
    x = vec_1.x + vec_2.x,
    y = vec_1.y + vec_2.y,
  }
end

__MODULE__.rotate = function(vec_origin, vec_target, degree)
  local theta = (degree / 180.0) * math.pi

  local dx = vec_target.x - vec_origin.x
  local dy = vec_target.y - vec_origin.y

  local rx = dx * math.cos(theta) - dy * math.sin(theta)
  local ry = dx * math.sin(theta) + dy * math.cos(theta)

  return {
    x = rx + vec_origin.x,
    y = ry + vec_origin.y,
  }
end

return __MODULE__