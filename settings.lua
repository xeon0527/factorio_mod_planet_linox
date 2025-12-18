data:extend {
  {
    type = "bool-setting",
    name = "linox-settings_elevator-boarding-alert",
    setting_type = "runtime-per-user",
    default_value = true
  },

  {
    type = "bool-setting",
    name = "linox-settings_remove-logistic-system",
    setting_type = "startup",
    default_value = false
  },

  {
    type = "bool-setting",
    name = "linox-settings_remove-vanilla-circuit-collision",
    setting_type = "startup",
    default_value = false
  },

  {
    type = "bool-setting",
    name = "linox-settings_enable-moshine-neodymium-recipe",
    setting_type = "startup",
    default_value = true
  },

  {
    type = "bool-setting",
    name = "linox-settings_allow-hopper-launcher",
    setting_type = "startup",
    default_value = true
  },

  {
    type = "bool-setting",
    name = "linox-settings_disconnect-aai-signal-transmission",
    setting_type = "startup",
    default_value = false
  },

  {
    type = "bool-setting",
    name = "linox-settings_disable-aai-signal-transmission",
    setting_type = "startup",
    default_value = false
  },

  {
    type = "string-setting",
    name = "linox-settings_rbp-example-multiplay-language",
    setting_type = "runtime-global",
    default_value = "auto",
    allowed_values = {"auto", "en", "ko", "ru"},
  },

  {
    type = "string-setting",
    name = "linox-settings_rbp-example-local-language",
    setting_type = "runtime-per-user",
    default_value = "auto",
    allowed_values = {"auto", "en", "ko", "ru"},
  },
}

require("modules/compatibility/any-planet-start").settings()