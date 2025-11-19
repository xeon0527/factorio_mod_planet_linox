local bootstrap = require("scripts.drv.bootstrap")

bootstrap.create_game_start_handler(function()
  if settings.global["recursive-blueprints-area"].value ~= "center" then
    game.print({"settings-warning"})
  end
end)