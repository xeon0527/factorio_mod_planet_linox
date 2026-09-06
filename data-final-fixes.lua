
local function _generate_outlet_recipe()
  local tint = { 222, 232, 107 }

  for _, fluid in pairs(data.raw.fluid) do
    if string.sub(fluid.name, 1, 9) ~= "parameter" and fluid.name ~= "fluid-unknown" then
      data:extend {
        {
          type = "recipe",
          name = fluid.name.."-outlet",
          categories = {"linox-recipe-category_outlet"},
          enabled = true,
          hidden_in_factoriopedia = true,
          hide_from_player_crafting = true,
          hide_from_signal_gui = true,
          energy_required = 1,
          ingredients = {
            { type = "fluid", name = fluid.name, amount = 100 },
          },
          icons = {{
            icon = "__base__/graphics/icons/offshore-pump.png",
            tint = tint,
            icon_size = 64,
          }},
          results = {},
        }
      }
    end
  end
end

local function _add_science_pack()
  for _, lab in pairs(data.raw["lab"]) do
    if lab.inputs then
      local cry_pro = false
      local no_linox_pack = true
      for _, inputs in pairs(lab.inputs) do
        if inputs == "cryogenic-science-pack" or inputs == "promethium-science-pack" then
          cry_pro = true
        elseif inputs == "linox-item_linox-science-pack" then
          no_linox_pack = false
          break
        end
      end

      if cry_pro and no_linox_pack then
        table.insert(lab.inputs, "linox-item_linox-science-pack")
      end
    end
  end
end

local function _insert_linox_science_pack(tech)
  if tech.unit and tech.unit.ingredients then
    for _, ingredients in pairs(tech.unit.ingredients) do
      if ingredients[1] == "linox-item_linox-science-pack" then
        return
      end
    end
    table.insert(tech.unit.ingredients, {"linox-item_linox-science-pack", 1})
  end
end

local function _SETTINGS_enable_science_pack()
  local _enable_aquilo = settings.startup["linox-settings_hard-mode_enable-science-pack_aquilo"].value
  local _enable_promethium = settings.startup["linox-settings_hard-mode_enable-science-pack_promethium"].value
  local _enable_infinity = settings.startup["linox-settings_hard-mode_enable-science-pack_infinite"].value

  if _enable_aquilo or _enable_promethium then
    _add_science_pack()

    -- Addition of Linox Science Pack
    _insert_linox_science_pack(data.raw["technology"]["planet-discovery-aquilo"])
    if _enable_promethium then
      _insert_linox_science_pack(data.raw["technology"]["promethium-science-pack"])
    end

    for _, t in pairs(data.raw["technology"]) do
      if t.unit and t.unit.ingredients then
        local _cryogenic = false
        local _promethium = false

        for _, ingredients in pairs(t.unit.ingredients) do
          if ingredients[1] == "cryogenic-science-pack" then _cryogenic = true end
          if ingredients[1] == "promethium-science-pack" then _promethium = true end
        end

        -- 프로메튬이면 프로메튬 팩이 요구될 때 다 넣으면 됨
        -- 아퀼로는 프로메튬 팩이 없어야됨
        if (_enable_aquilo and _cryogenic and not _promethium) or (_enable_promethium and _promethium) then
          if t.max_level and t.max_level == "infinite" then 
            if _enable_infinity then
              _insert_linox_science_pack(t)
            end 
          else
            _insert_linox_science_pack(t)
          end
        end
      end
    end
  end
end


_generate_outlet_recipe()
_SETTINGS_enable_science_pack()