local linox_map_gen = require("prototypes.planet.map-gen")
local effects = require("prototypes.planet.effect")
local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")
local planet_catalogue_vulcanus = require("__space-age__.prototypes.planet.procession-catalogue-vulcanus")

PlanetsLib:extend {
  {
    type = "planet",
    name = "linox-planet_linox",
    icon = "__linox__/graphics/icons/planet-linox.png",--"__space-age__/graphics/icons/vulcanus.png",
    icon_size = 512,
    starmap_icon = "__linox__/graphics/icons/planet-linox.png",
    starmap_icon_size = 512,
    gravity_pull = 50,      -- 행성에 근접할 시 행성 중력에 의해 우주선에 가감되는 속도.

    orbit = {
      parent = { type = "space-location", name = "star" },
			distance = 5,
			orientation = 0.1,
    },

    --distance = 5,          -- 태양으로부터의 거리. 행성의 크기와는 무관.
    --orientation = 0.1,    -- 행성의 현재 위치. 0~1 사이의 값으로, 0은 태양에서 오른쪽, 0.25는 태양에서 위쪽, 0.5는 태양에서 왼쪽, 0.75는 태양에서 아래쪽.
    magnitude = 0.5,        -- 행성의 크기. 행성의 거리와는 무관.
    label_orientation = 0.0, -- 행성 이름의 위치. 0~1 사이의 값으로, 0은 태양에서 오른쪽, 0.25는 태양에서 위쪽, 0.5는 태양에서 왼쪽, 0.75는 태양에서 아래쪽.
    order = "d[vulcanus]",   -- 행성의 순서. starmap에서 행성의 위치에 영향을 줌.
    subgroup = "planets",
    map_gen_settings = linox_map_gen.ground(),
    pollutant_type = nil,
    solar_power_in_space = __LINOX_PLANET__.solar_power_in_space, -- 우주 공간에서 태양광 패널이 얻는 태양광 발전량. 행성의 태양광 발전량과는 무관.

    platform_procession_set =
    {
      arrival = {"planet-to-platform-b"},
      departure = {"platform-to-planet-a"}
    },
    planet_procession_set =
    {
      arrival = {"platform-to-planet-b"},
      departure = {"planet-to-platform-a"}
    },
    procession_graphic_catalogue = planet_catalogue_vulcanus,

    surface_properties =
    {
      ["day-night-cycle"] = 0.25 * minute,
      ["magnetic-field"] = __LINOX_PLANET__.magnetic_field,
      ["solar-power"] = __LINOX_PLANET__.solar_power,
      pressure = __LINOX_PLANET__.pressure,
      gravity = __LINOX_PLANET__.gravity
    },

    --lightning_properties =
    --{
    --    lightnings_per_chunk_per_tick = 2 / (60 * 10), -- 초당 청크당 번개 발생 횟수
    --    search_radius = 10.0,
    --    lightning_types = {"lightning"},
    --    priority_rules = nil,
    --    exemption_rules = nil,
    --    lightning_multiplier_at_day = 1.0,
    --    lightning_multiplier_at_night = 1.0,
    --},

    persistent_ambient_sounds =
    {
      base_ambience = {filename = "__space-age__/sound/wind/base-wind-vulcanus.ogg", volume = 0.8},
      wind = {filename = "__space-age__/sound/wind/wind-vulcanus.ogg", volume = 0.8},
      crossfade =
      {
        order = {"wind", "base_ambience"},
        curve_type = "cosine",
        from = {control = 0.35, volume_percentage = 0.0},
        to = {control = 2, volume_percentage = 100.0}
      },
      semi_persistent =
      {
        {
          sound = {variations = sound_variations("__space-age__/sound/world/semi-persistent/distant-rumble", 3, 0.5)},
          delay_mean_seconds = 10,
          delay_variance_seconds = 5
        },
        {
          sound = {variations = sound_variations("__space-age__/sound/world/semi-persistent/distant-flames", 5, 0.6)},
          delay_mean_seconds = 15,
          delay_variance_seconds = 7.0
        }
      }
    },

    surface_render_parameters =
    {
      fog = effects.fog_effect_properties(),
      clouds = effects.clouds_effect_properties(),

      -- Should be based on the default day/night times, ie
      -- sun starts to set at 0.25
      -- sun fully set at 0.45
      -- sun starts to rise at 0.55
      -- sun fully risen at 0.75
      day_night_cycle_color_lookup =
      {
        {0.0, "__space-age__/graphics/lut/vulcanus-1-day.png"},
        {0.20, "__space-age__/graphics/lut/vulcanus-1-day.png"},
        {0.45, "__space-age__/graphics/lut/vulcanus-2-night.png"},
        {0.55, "__space-age__/graphics/lut/vulcanus-2-night.png"},
        {0.80, "__space-age__/graphics/lut/vulcanus-1-day.png"},
      },

      terrain_tint_effect =
      {
        noise_texture =
        {
          filename = "__space-age__/graphics/terrain/vulcanus/tint-noise.png",
          size = 4096
        },

        offset = { 0.2, 0, 0.4, 0.8 },
        intensity = { 0.5, 0.2, 0.3, 1.0 },
        scale_u = { 10, 4, 4, 4 },
        scale_v = { 10, 4, 4, 4 },

        global_intensity = 0.3,
        global_scale = 0.1,
        zoom_factor = 3,
        zoom_intensity = 0.6
      }
    },


    asteroid_spawn_influence = 10,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus, 0.9)
  },
}

data:extend {
  {
    type = "space-connection",
    name = "linox-space-connection_vulcanus-linox",
    subgroup = "planet-connections",
    from = "vulcanus",
    to = "linox-planet_linox",
    order = "a",
    length = 15000,

    asteroid_spawn_influence = 10,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus)
  },
}