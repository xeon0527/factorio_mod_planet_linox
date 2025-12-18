local __SIM_PATH = "__linox__/modules/tips-and-tricks/simulations/"

data:extend {
  {
		type = "tips-and-tricks-item-category",
		name = "linox-tips-and-tricks_category",
		order = "z",
	},
  {
    type = "tips-and-tricks-item",
    name = "linox-tips-and-tricks_briefing",
    tag = "[planet=linox-planet_linox]",
    category = "linox-tips-and-tricks_category",
    is_title = true,
    order = "za",
    indent = 0,
    simulation = {
      init_update_count = 120,
      planet = "linox-planet_linox",
      init_file = __SIM_PATH.."linox_briefing.lua"
    },
    starting_status = "unlocked",
  },
    {
      type = "tips-and-tricks-item",
      name = "linox-tips-and-tricks_language-settings",
      tag = "[virtual-signal=signal-star]",
      category = "linox-tips-and-tricks_category",
      order = "za9",
      indent = 1,
      image = "__linox__/graphics/tips-and-tricks/language-setting.png",
      starting_status = "unlocked",
    },
    {
      type = "tips-and-tricks-item",
      name = "linox-tips-and-tricks_exploration-log-1",
      tag = "[virtual-signal=signal-info]",
      category = "linox-tips-and-tricks_category",
      order = "zaa",
      indent = 1,
      simulation = {
        init_update_count = 120,
        planet = "linox-planet_linox",
        init_file = __SIM_PATH.."exploration_log_1.lua",
      },
      trigger =
      {
        type = "research",
        technology = "linox-technology_planet-discovery-linox"
      },
    },
    {
      type = "tips-and-tricks-item",
      name = "linox-tips-and-tricks_exploration-log-2",
      tag = "[virtual-signal=signal-info]",
      category = "linox-tips-and-tricks_category",
      order = "zab",
      indent = 1,
      simulation = {
        init_update_count = 120,
        planet = "linox-planet_linox",
        init_file = __SIM_PATH.."exploration_log_2.lua",
      },
      trigger =
      {
        type = "research",
        technology = "linox-technology_exploring-linox-landing-site"
      },
    },
    {
      type = "tips-and-tricks-item",
      name = "linox-tips-and-tricks_cargo-loss",
      tag = "[virtual-signal=signal-alert]",
      category = "linox-tips-and-tricks_category",
      order = "zac",
      indent = 1,
      trigger =
      {
        type = "research",
        technology = "linox-technology_get-cargo-landing-pad"
      },
    },
    {
      type = "tips-and-tricks-item",
      name = "linox-tips-and-tricks_placement_restriction",
      tag = "[item=foundation]",
      category = "linox-tips-and-tricks_category",
      order = "zad",
      indent = 1,
      simulation = {
        init_update_count = 120,
        planet = "nauvis",
        init_file = __SIM_PATH.."placement_restriction.lua",
      },
      trigger =
      {
        type = "research",
        technology = "linox-technology_exploring-linox-landing-site"
      },
    },
      {
        type = "tips-and-tricks-item",
        name = "linox-tips-and-tricks_placement_restriction_2",
        tag = "[item=foundation]",
        category = "linox-tips-and-tricks_category",
        order = "zada",
        indent = 2,
        simulation = {
          init_update_count = 120,
          planet = "nauvis",
          init_file = __SIM_PATH.."placement_restriction_2.lua",
        },
        trigger =
        {
          type = "research",
          technology = "linox-technology_facility-factoryizing"
        },
      },
    {
      type = "tips-and-tricks-item",
      name = "linox-tips-and-tricks_planetary-power-network",
      tag = "[item=substation]",
      category = "linox-tips-and-tricks_category",
      order = "zae",
      indent = 1,
      simulation = {
        init_update_count = 120,
        planet = "linox-planet_linox",
        init_file = __SIM_PATH.."planetary-power-network.lua",
      },
      trigger =
      {
        type = "change-surface",
        surface = __LINOX_SURFACE__.facility,
      },
    },
    {
      type = "tips-and-tricks-item",
      name = "linox-tips-and-tricks_npc-system",
      tag = "[virtual-signal=signal-star]",
      category = "linox-tips-and-tricks_category",
      order = "zaf",
      indent = 1,
      simulation = {
        init_update_count = 120,
        planet = "nauvis",
        init_file = __SIM_PATH.."npc_system.lua",
      },
      trigger =
      {
        type = "change-surface",
        surface = __LINOX_SURFACE__.facility,
      },
    },
    {
      type = "tips-and-tricks-item",
      name = "linox-tips-and-tricks_recursive-blueprints",
      tag = "[item=blueprint-deployer2]",
      category = "linox-tips-and-tricks_category",
      order = "zag",
      indent = 1,
      simulation = {
        init_update_count = 10,
        planet = "nauvis",
        mods = {
          "linox",
          "rec-blue-plus",
        },
        init_file = __SIM_PATH.."recursive_blueprints.lua",
      },
      trigger =
      {
        type = "research",
        technology = "linox-technology_facility-factoryizing"
      },
    },
      {
        type = "tips-and-tricks-item",
        name = "linox-tips-and-tricks_example-turn-on",
        tag = "[item=power-switch]",
        category = "linox-tips-and-tricks_category",
        order = "zaga",
        indent = 2,
        image = "__linox__/graphics/tips-and-tricks/example-turn-on.png",
        dependencies = {"linox-tips-and-tricks_recursive-blueprints"},
      },
      {
        type = "tips-and-tricks-item",
        name = "linox-tips-and-tricks_bad-chest",
        tag = "[item=blueprint-deployer2]",
        category = "linox-tips-and-tricks_category",
        order = "zagb",
        indent = 2,
        image = "__linox__/graphics/tips-and-tricks/bad-chest.png",
        dependencies = {"linox-tips-and-tricks_recursive-blueprints"},
      },
      {
        type = "tips-and-tricks-item",
        name = "linox-tips-and-tricks_id-box",
        tag = "[item=constant-combinator]",
        category = "linox-tips-and-tricks_category",
        order = "zagc",
        indent = 2,
        image = "__linox__/graphics/tips-and-tricks/id-box.png",
        dependencies = {"linox-tips-and-tricks_recursive-blueprints"},
      },
      {
        type = "tips-and-tricks-item",
        name = "linox-tips-and-tricks_negative-signal",
        tag = "[item=stone]",
        category = "linox-tips-and-tricks_category",
        order = "zagd",
        indent = 2,
        image = "__linox__/graphics/tips-and-tricks/negative-signal.png",
        dependencies = {"linox-tips-and-tricks_recursive-blueprints"},
      },
      {
        type = "tips-and-tricks-item",
        name = "linox-tips-and-tricks_positive-signal",
        tag = "[item=iron-plate]",
        category = "linox-tips-and-tricks_category",
        order = "zage",
        indent = 2,
        image = "__linox__/graphics/tips-and-tricks/positive-signal.png",
        dependencies = {"linox-tips-and-tricks_recursive-blueprints"},
      },
      {
        type = "tips-and-tricks-item",
        name = "linox-tips-and-tricks_hover-tips",
        tag = "[virtual-signal=up-left-arrow]",
        category = "linox-tips-and-tricks_category",
        order = "zagf",
        indent = 2,
        image = "__linox__/graphics/tips-and-tricks/hover-tips.png",
        dependencies = {"linox-tips-and-tricks_recursive-blueprints"},
      },
  {
    type = "tips-and-tricks-item",
    name = "linox-tips-and-tricks_bad-chest-area-viewer",
    tag = "[item=blueprint-deployer]",
    category = "linox-tips-and-tricks_category",
    order = "zah",
    indent = 1,
    image = "__linox__/graphics/tips-and-tricks/bad-chest-area-viewer.png",
    dependencies = {"linox-tips-and-tricks_recursive-blueprints"},
  },
    {
      type = "tips-and-tricks-item",
      name = "linox-tips-and-tricks_adjust-blueprint-origin",
      tag = "[item=blueprint]",
      category = "linox-tips-and-tricks_category",
      order = "zaha",
      indent = 2,
      image = "__linox__/graphics/tips-and-tricks/adjust-blueprint-origin.png",
      dependencies = {"linox-tips-and-tricks_recursive-blueprints"},
    },
  {
    type = "tips-and-tricks-item",
    name = "linox-tips-and-tricks_power-converter",
    tag = "[item=accumulator]",
    category = "linox-tips-and-tricks_category",
    order = "zaj",
    indent = 1,
    image = "__linox__/graphics/tips-and-tricks/power-converter.png",
    trigger =
    {
      type = "research",
      technology = "linox-technology_power-converter"
    },
  },
    {
      type = "tips-and-tricks-item",
      name = "linox-tips-and-tricks_reactive-power",
      tag = "[entity=behemoth-worm-turret]",
      category = "linox-tips-and-tricks_category",
      order = "zaja",
      indent = 2,
      trigger =
      {
        type = "research",
        technology = "linox-technology_power-converter"
      },
    },
}
