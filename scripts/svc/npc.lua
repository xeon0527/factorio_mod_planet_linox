--__SVC_NPC_ENTITY__ = {};

local __MODULE__ = {}

__MODULE__.type = {
  lorax             = "linox-npc_lorax",
  network_terminal  = "linox-npc_network-terminal",
  power_converter   = "linox-npc_power-converter",
};

UTIL_create_event_handler("linox-custom-event_on-entity-click", function(event)
  if #event.player.gui.screen.children == 0 then
    local npc_type = nil;
    for _, type in ipairs(__MODULE__.type) do
      if type == event.entity.name then
        npc_type = type;
        break;
      end
    end

    if npc_type then
      script.raise_event("linox-custom-event_on-npc-talked", {
        player = event.player,
        npc_type = npc_type,
      });
    end
  end
end)


local function __create_lorax(surface, position)
  local entity_lorax = surface.create_entity{
    name = __MODULE__.type.lorax,
    position = position,
    force = "neutral",
    create_build_effect_smoke = false,
  };

  if entity_lorax then
    entity_lorax.destructible = false;
    entity_lorax.minable = false;
    entity_lorax.rotatable = false;
    entity_lorax.operable = false;
    rendering.draw_text{
      text = {"entity-name."..__MODULE__.type.lorax},
      surface = surface,
      target = {
          entity = entity_lorax,
          offset = { 0, 4.5 },
      },
      color = { 1, 1, 0, 1},
      alignment = "center",
      vertical_alignment = "middle"
    }
  end
  return entity_lorax;
end

local function __create_network_terminal(surface, position)
  local entity_network_terminal = surface.create_entity{
    name = __MODULE__.type.network_terminal,
    position = position,
    force = "player",
    create_build_effect_smoke = false,
  };

  if entity_network_terminal then
    entity_network_terminal.destructible = false;
    entity_network_terminal.minable = false;
    entity_network_terminal.rotatable = false;
    entity_network_terminal.operable = false;
    rendering.draw_text{
      text = {"entity-name."..__MODULE__.type.network_terminal},
      surface = surface,
      target = {
          entity = entity_network_terminal,
          offset = { 0, 2.5 },
      },
      color = { 1, 1, 0, 1},
      alignment = "center",
      vertical_alignment = "middle"
    }
  end
  return entity_network_terminal;
end

local function __create_power_converter(surface, position)
  local entity = surface.create_entity{
    name = __MODULE__.type.power_converter,
    position = position,
    force = "enemy",
    create_build_effect_smoke = false,
  };

  if entity then
    entity.destructible = false;
    entity.minable = false;
    entity.rotatable = false;
    entity.operable = false;
    entity.energy = 10 * 1000 * 1000 * 1000;
    rendering.draw_text{
      text = {"entity-name."..__MODULE__.type.power_converter},
      surface = surface,
      target = {
          entity = entity,
          offset = { 0, 1.5 },
      },
      color = { 1, 1, 0, 1},
      alignment = "center",
      vertical_alignment = "middle"
    }
  end
  return entity;
end

__MODULE__.create = function(npc_type, surface, position)
  local entity = surface.find_entity(npc_type, position);
  if entity == nil then
    if npc_type == __MODULE__.type.lorax then
      entity = __create_lorax(surface, position);
    elseif npc_type == __MODULE__.type.network_terminal then
      entity = __create_network_terminal(surface, position);
    elseif npc_type == __MODULE__.type.power_converter then
      entity = __create_power_converter(surface, position);
    end
  end
  return entity;
end

__MODULE__.get = function(npc_type, surface)
  return surface.find_entities_filtered({name = npc_type})[1];
end

return __MODULE__;