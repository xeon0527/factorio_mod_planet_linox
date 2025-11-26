local bootstrap = require("scripts.drv.bootstrap")

bootstrap.create_game_start_handler(function()
  local force = game.forces["player"]
  if force.technologies["linox-technology_recursive-blueprint"].researched then
    force.recipes["blueprint-deployer"].enabled = true
    force.recipes["blueprint-deployer2"].enabled = true
    force.recipes["recursive-blueprints-scanner"].enabled = true
  else
    force.recipes["blueprint-deployer"].enabled = false
    force.recipes["blueprint-deployer2"].enabled = false
    force.recipes["recursive-blueprints-scanner"].enabled = false
  end
end)