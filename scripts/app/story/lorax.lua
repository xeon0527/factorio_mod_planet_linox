local db = require("scripts.svc.database");
local linox_ground = require("scripts.svc.surface.linox-ground")
local linox_facility = require("scripts.svc.surface.linox-facility")

--DRV_storage_create("story.flag.cargo_approval", false)
--DRV_storage_create("story.lorax", nil)

local dialog = require("scripts.svc.gui.dialog")
local techshop = require("scripts.svc.gui.techshop")
local npc = require("scripts.svc.npc")

local __MODULE__ = {}

local __DB_SCENE_ID__ = "story_lorax_scene_id"
local __DB_CARGO_APPROVAL__ = "story_lorax_cargo_approval"

-- lorax를 클릭하면 대화상자 켜기
UTIL_create_event_handler("linox-custom-event_on-entity-click", function(event)
  if event.entity == npc.get(npc.type.lorax, event.player.surface) then
    __MODULE__.show(event.player);
  end
end)

-- 창을 닫았을 때 
UTIL_create_event_handler("linox-custom-event_gui-dialog-on-close", function(event)
  local player = event.player

  if player and event.session_name == "lorax" then
    local scene_id = db.get_player(player, __DB_SCENE_ID__, 0);
    local techs = game.forces["player"].technologies

    if scene_id == 3 and
      techs["linox-technology_facility-upgrade"].researched and
      techs["linox-technology_facility-factoryizing"].researched and
      techs["linox-technology_laboratory-database"].researched and
      techs["linox-technology_planetary-mining-technology"].researched
    then
      db.set_player(player, __DB_SCENE_ID__, 4);
      player.print({"system.lorax-help"})
    end
  end
end)



local function __running_lorax()
  local surface = linox_ground.get()
  return surface and (#surface.find_entities_filtered{name="solar-panel"} >= 3)
end

__MODULE__.show = function(player)
  --dialog.create(player, "L.O.R.A.X", "lorax", "linox-sprite_lorax");
  if not dialog.create(player, {"npc-name.lorax"}, "lorax", "linox-sprite_lorax") then return end

  local scene_id = db.get_player(player, __DB_SCENE_ID__, 0);

  if scene_id == 0 then
    dialog.add_talk(player, dialog.talker.narration, {"npc-talk.lorax_s0-0_t0"})
    dialog.add_talk(player, dialog.talker.narration, {"npc-talk.lorax_s0-0_t1"})
    dialog.add_talk(player, dialog.talker.narration, {"npc-talk.lorax_s0-0_t2"})
    dialog.add_talk(player, dialog.talker.narration, {"npc-talk.lorax_s0-0_t3"})

    if __running_lorax() then
      dialog.add_select(player, "1-2", {"npc-talk.lorax_s0-0_s0"});
    else
      dialog.add_select(player, "1-1", {"npc-talk.lorax_s0-0_s0"});
    end

  elseif scene_id == 1 then
    dialog.add_talk(player, dialog.talker.narration, {"npc-talk.lorax_s1-0_t0"})
    dialog.add_talk(player, dialog.talker.narration, {"npc-talk.lorax_s1-0_t1"})

    dialog.add_select(player, "1", {"npc-talk.lorax_s1-0_s0"}, dialog.talker.player);

  elseif scene_id == 2 then
    local ntmn = npc.get(npc.type.network_terminal, player.surface);

    if ntmn.get_signal({ type = "virtual", name = "signal-unlock" }, defines.wire_connector_id.circuit_red) == 2570 or
        ntmn.get_signal({ type = "virtual", name = "signal-unlock" }, defines.wire_connector_id.circuit_green) == 2570 then
      db.set_player(player, __DB_SCENE_ID__, 3);
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s2-2_t0"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s2-2_t1"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s2-2_t2"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s2-2_t3"})

      linox_facility.set_lighting(true)
      linox_facility.create_radar()

      script.raise_event("linox-custom-event_gui-dialog-on-select", { player = player, select_id = "1" });

    else
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s2-0_t0"})
      dialog.add_select(player, "1", {"npc-talk.lorax_s2-0_s0"}, dialog.talker.player);
    end
  elseif scene_id == 3 then
    script.raise_event("linox-custom-event_gui-dialog-on-select", { player = player, select_id = "1" });

  elseif scene_id == 4 then
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s4-0_t0"})
      dialog.add_talk(player, dialog.talker.narration, {"npc-talk.lorax_s4-0_t1"})
      dialog.add_select(player, "1", {"npc-talk.lorax_s4-0_s0"}, dialog.talker.player);

  elseif scene_id == 5 then
    dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s5-0_t0"})
    dialog.add_select(player, "1", {"npc-talk.lorax_s5-0_s0"}, dialog.talker.player);
    dialog.add_select(player, "2", {"npc-talk.lorax_s5-0_s1"}, dialog.talker.player);
  end
end


UTIL_create_event_handler("linox-custom-event_gui-dialog-on-select", function(event)
  local player = event.player;
  local sel_id = event.select_id;

  local scene_id = db.get_player(player, __DB_SCENE_ID__);

  dialog.clear_select(player);

  if sel_id == "0" then
    dialog.close(player);
  elseif scene_id == 0 then
    if sel_id == "1-1" then
      dialog.add_talk(player, dialog.talker.narration, {"npc-talk.lorax_s0-0-1_t0"})
      dialog.add_talk(player, dialog.talker.narration, {"npc-talk.lorax_s0-0-1_t1"})
      dialog.add_talk(player, dialog.talker.narration, {"npc-talk.lorax_s0-0-1_t2"})
      dialog.add_select(player, "0", {"npc-talk.lorax_end"});

    elseif sel_id == "1-2" then
      dialog.add_talk(player, dialog.talker.narration, {"npc-talk.lorax_s0-1_t0"})
      dialog.add_talk(player, dialog.talker.narration, {"npc-talk.lorax_s0-1_t1"})
      dialog.add_select(player, "2", {"npc-talk.lorax_s0-1_s0"}, dialog.talker.player);
    
    elseif sel_id == "2" then
      local lorax = npc.get(npc.type.lorax, linox_facility.get())
      lorax.insert { name = "linox-item_enable-entity", count = 1000 }

      dialog.add_talk(player, dialog.talker.partner_friendly, {"npc-talk.lorax_s0-2_t0"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s0-2_t1"})
      dialog.add_talk(player, dialog.talker.narration, {"npc-talk.lorax_s0-2_t2"})
      dialog.add_select(player, "3", {"npc-talk.lorax_s0-2_s0"}, dialog.talker.narration);

    elseif sel_id == "3" then
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s0-3_t0"})
      dialog.add_talk(player, dialog.talker.narration, {"npc-talk.lorax_s0-3_t1"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s0-3_t2"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s0-3_t3"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s0-3_t4"})
      dialog.add_select(player, "4", {"npc-talk.lorax_s0-3_s0"}, dialog.talker.player);

    elseif sel_id == "4" then
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s0-4_t0"})
      dialog.add_select(player, "5", {"npc-talk.lorax_s0-4_s0"}, dialog.talker.player);

    elseif sel_id == "5" then
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s0-5_t0"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s0-5_t1"})
      dialog.add_talk(player, dialog.talker.narration, {"npc-talk.lorax_s0-5_t2"})
      dialog.add_talk(player, dialog.talker.narration, {"npc-talk.lorax_s0-5_t3"})
      dialog.add_select(player, "6", {"npc-talk.lorax_s0-5_s0"}, dialog.talker.player);

    elseif sel_id == "6" then
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s0-6_t0"})
      dialog.add_select(player, "7", {"npc-talk.lorax_s0-6_s0"}, dialog.talker.player);

    elseif sel_id == "7" then
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s0-7_t0"})
      dialog.add_talk(player, dialog.talker.narration, {"npc-talk.lorax_s0-7_t1"})
      dialog.add_select(player, "8", {"npc-talk.lorax_s0-7_s0"}, dialog.talker.player);
    
    elseif sel_id == "8" then
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s0-8_t0"})
      dialog.add_select(player, "9", {"npc-talk.lorax_s0-8_s0"}, dialog.talker.player);

    elseif sel_id == "9" then
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s0-9_t0"})
      dialog.add_select(player, "10", {"npc-talk.lorax_s0-9_s0"}, dialog.talker.player);

    elseif sel_id == "10" then
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s0-10_t0"})
      dialog.add_select(player, "11", {"npc-talk.lorax_s0-10_s0"}, dialog.talker.player);

    elseif sel_id == "11" then
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s0-11_t0"})
      dialog.add_select(player, "12", {"npc-talk.lorax_s0-11_s0"}, dialog.talker.player);

    elseif sel_id == "12" then
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s0-12_t0"})
      dialog.add_select(player, "13", {"npc-talk.lorax_s0-12_s0"}, dialog.talker.player);

    elseif sel_id == "13" then
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s0-13_t0"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s0-13_t1"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s0-13_t2"})
      dialog.add_talk(player, dialog.talker.player, {"npc-talk.lorax_s0-13_t3"})
      dialog.add_select(player, "14", {"npc-talk.lorax_s0-13_s0"}, dialog.talker.player);

    elseif sel_id == "14" then
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s0-14_t0"})
      dialog.add_select(player, "15", {"npc-talk.lorax_s0-14_s0"}, dialog.talker.player);

    elseif sel_id == "15" then
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s0-15_t0"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s0-15_t1"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s0-15_t2"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s0-15_t3"})
      dialog.add_talk(player, dialog.talker.narration, {"npc-talk.lorax_s0-15_t4"})
      dialog.add_select(player, "0", {"npc-talk.lorax_end"});
      db.set_player(player, __DB_SCENE_ID__, 1);
    end

  elseif scene_id == 1 then
    if sel_id == "1" then
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s1-1_t0"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s1-1_t1"})
      dialog.add_select(player, "2", {"npc-talk.lorax_s1-1_s0"}, dialog.talker.player);

    elseif sel_id == "2" then
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s1-2_t0"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s1-2_t1"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s1-2_t2"})
      dialog.add_select(player, "3", {"npc-talk.lorax_s1-2_s0"}, dialog.talker.player);

    elseif sel_id == "3" then
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s1-3_t0"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s1-3_t1"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s1-3_t2"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s1-3_t3"})
      dialog.add_select(player, "4-1", {"npc-talk.lorax_s1-3_s0"}, dialog.talker.player);
      dialog.add_select(player, "4-2", {"npc-talk.lorax_s1-3_s1"}, dialog.talker.player);
      dialog.add_select(player, "4-3", {"npc-talk.lorax_s1-3_s2"}, dialog.talker.player);

      local net_terminal = npc.get(npc.type.network_terminal, linox_facility.get())
      net_terminal.insert { name = "linox-item_enable-entity", count = 1000 }

    elseif sel_id == "4-1" then
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s1-4-1_t0"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s1-4-1_t1"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s1-4-1_t2"})
      dialog.add_select(player, "0", {"npc-talk.lorax_end"}, dialog.talker.player);
      db.set_player(player, __DB_SCENE_ID__, 2);

    elseif sel_id == "4-2" then
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s1-4-2_t0"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s1-4-2_t1"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s1-4-2_t2"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s1-4-2_t3"})
      dialog.add_select(player, "0", {"npc-talk.lorax_end"}, dialog.talker.player);
      db.set_player(player, __DB_SCENE_ID__, 2);

    elseif sel_id == "4-3" then
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s1-4-3_t0"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s1-4-3_t1"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s1-4-3_t2"})
      dialog.add_select(player, "0", {"npc-talk.lorax_end"}, dialog.talker.player);
      db.set_player(player, __DB_SCENE_ID__, 2);
    end

  elseif scene_id == 2 then
    if sel_id == "1" then
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s2-1_t0"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s2-1_t1"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s2-1_t2"})
      dialog.add_select(player, "0", {"npc-talk.lorax_end"}, dialog.talker.player);
    end

  elseif scene_id == 3 or (scene_id == 5 and dialog.get_temp_data(player) == "5-3-1") then
    if sel_id == "1" then
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s3-1_t0"})
      dialog.add_select(player, "2", {"npc-talk.lorax_s3-1_s0"}, dialog.talker.player);
      dialog.add_select(player, "3", {"npc-talk.lorax_s3-1_s1"}, dialog.talker.player);
      dialog.add_select(player, "4", {"npc-talk.lorax_s3-1_s2"}, dialog.talker.player);
      dialog.add_select(player, "5", {"npc-talk.lorax_s3-1_s3"}, dialog.talker.player);
      dialog.add_select(player, "6", {"npc-talk.lorax_s3-1_s4"}, dialog.talker.player);

    elseif sel_id == "2" then
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s3-2_t0"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s3-2_t1"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s3-2_t2"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s3-2_t3"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s3-2_t4"})
      dialog.add_select(player, "2-1", {"npc-talk.lorax_s3-2_s0"}, dialog.talker.player);

    elseif sel_id == "2-1" then
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s3-2-1_t0"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s3-2-1_t1"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s3-2-1_t2"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s3-2-1_t3"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s3-2-1_t4"})
      dialog.add_select(player, "1", {"npc-talk.lorax_back"});

      player.force.script_trigger_research("linox-technology_facility-upgrade");


    elseif sel_id == "3" then
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s3-3_t0"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s3-3_t1"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s3-3_t2"})
      dialog.add_select(player, "3-1", {"npc-talk.lorax_s3-3_s0"}, dialog.talker.player);

    elseif sel_id == "3-1" then
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s3-3-1_t0"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s3-3-1_t1"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s3-3-1_t2"})
      dialog.add_select(player, "3-2", {"npc-talk.lorax_s3-3-1_s0"}, dialog.talker.player);

    elseif sel_id == "3-2" then
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s3-3-2_t0"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s3-3-2_t1"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s3-3-2_t2"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s3-3-2_t3"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s3-3-2_t4"})
      dialog.add_select(player, "1", {"npc-talk.lorax_back"});


    elseif sel_id == "4" then
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s3-4_t0"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s3-4_t1"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s3-4_t2"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s3-4_t3"})
      dialog.add_select(player, "4-1", {"npc-talk.lorax_s3-4_s0"}, dialog.talker.player);

    elseif sel_id == "4-1" then
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s3-4-1_t0"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s3-4-1_t1"})
      dialog.add_select(player, "1", {"npc-talk.lorax_back"});
      
      player.force.script_trigger_research("linox-technology_laboratory-database");

    elseif sel_id == "5" then
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s3-5_t0"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s3-5_t1"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s3-5_t2"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s3-5_t3"})
      dialog.add_select(player, "5-1", {"npc-talk.lorax_s3-5_s0"}, dialog.talker.player)

      if not db.get_force(player.force, __DB_CARGO_APPROVAL__) then
        db.set_force(player.force, __DB_CARGO_APPROVAL__, true);

        player.force.print({"system.cargo-allow"});
        player.force.print({"system.cargo-pad-allow"});
      end
      linox_ground.obtain_cargo_landing_pad()

    elseif sel_id == "5-1" then
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s3-5-1_t0"})
      dialog.add_select(player, "1", {"npc-talk.lorax_s3-5-1_s0"})


    elseif sel_id == "6" then
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s3-6_t0"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s3-6_t1"})
      dialog.add_select(player, "6-1", {"npc-talk.lorax_s3-6_s0"}, dialog.talker.player)

      player.force.script_trigger_research("linox-technology_planetary-mining-technology");

    elseif sel_id == "6-1" then
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s3-6-1_t0"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s3-6-1_t1"})
      dialog.add_select(player, "6-2", {"npc-talk.lorax_s3-6-1_s0"}, dialog.talker.player)

    elseif sel_id == "6-2" then
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s3-6-2_t0"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s3-6-2_t1"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s3-6-2_t2"})
      dialog.add_select(player, "1", {"npc-talk.lorax_back"});

      player.force.script_trigger_research("linox-technology_facility-factoryizing");
    end
  elseif scene_id == 4 then
    if sel_id == "1" then
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s4-1_t0"})
      dialog.add_select(player, "2", {"npc-talk.lorax_s4-1_s0"}, dialog.talker.player)

    elseif sel_id == "2" then
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s4-2_t0"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s4-2_t1"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s4-2_t2"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s4-2_t3"})
      dialog.add_select(player, "3", {"npc-talk.lorax_s4-2_s0"}, dialog.talker.player)

    elseif sel_id == "3" then
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s4-3_t0"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s4-3_t1"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s4-3_t2"})
      dialog.add_talk(player, dialog.talker.partner, {"npc-talk.lorax_s4-3_t3"})
      dialog.add_select(player, "0", {"npc-talk.lorax_end"});
      db.set_player(player, __DB_SCENE_ID__, 5);
    end
  elseif scene_id == 5 then
    if sel_id == "1" then
      dialog.set_temp_data(player, "5-3-1")
      script.raise_event("linox-custom-event_gui-dialog-on-select", { player = player, select_id = "1" });
    elseif sel_id == "2" then
      dialog.close(player);
      
      if not techshop.create(player, {"system.lorax-tech-shop"}) then return end

      techshop.add_tech(player,
        "linox-sprite_tungsten-extraction",
        "linox-technology_tungsten-extraction",
        "[item=iron-plate] 1000    [item=copper-plate] 1000")

      techshop.add_tech(player,
        "linox-sprite_tungsten-processing",
        "linox-technology_tungsten-processing",
        "[item=tungsten-ore] 1000    [item=tungsten-plate] 1000")

      techshop.add_tech(player,
        "linox-sprite_recursive-blueprint",
        "linox-technology_recursive-blueprint",
        "[item=electronic-circuit] 2000")

      techshop.add_tech(player,
        "linox-sprite_expanding-factory",
        "linox-technology_expanding-factory-1",
        "[item=linox-item_tungsten-gear-wheel] 1000    [item=linox-item_tungsten-stick] 1000")

      techshop.add_tech(player,
        "linox-sprite_linox-supercomputer",
        "linox-technology_linox-supercomputer",
        "[item=electronic-circuit] 500    [item=linox-item_tungsten-gear-wheel] 500    [item=linox-item_tungsten-stick] 500")

      techshop.refresh(player)
    end
  end
end)

return __MODULE__;