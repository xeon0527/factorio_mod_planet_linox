local db = require("scripts.svc.database")

local __DB_CARGO_APPROVAL__ = "story_lorax_cargo_approval"

if db.get_force(game.forces["player"], __DB_CARGO_APPROVAL__) then
  game.forces["player"].technologies["linox-technology_get-cargo-landing-pad"].researched = true
end