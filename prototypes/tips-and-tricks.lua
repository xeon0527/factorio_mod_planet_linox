local simulation = require("prototypes.tips-and-tricks-simulations")

data:extend({
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
    simulation = simulation.linox_briefing,
    trigger =
    {
      type = "research",
      technology = "linox-technology_planet-discovery-linox"
    },
    skip_trigger =
    {
      type = "or",
      triggers =
      {
        {
          type = "change-surface",
          surface = "linox-planet_linox"
        },
        {
          type = "sequence",
          triggers =
          {
            {
              type = "research",
              technology = "linox-technology_planet-discovery-linox"
            },
            {
              type = "time-elapsed",
              ticks = 15 * minute
            },
            {
              type = "time-since-last-tip-activation",
              ticks = 15 * minute
            }
          }
        }
      },
    },
  },
  {
    type = "tips-and-tricks-item",
    name = "linox-tips-and-tricks_exploration-log-1",
    tag = "[virtual-signal=signal-info]",
    category = "linox-tips-and-tricks_category",
    order = "zb",
    indent = 1,
    simulation = simulation.linox_exploration_log_1,
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
    order = "zc",
    indent = 1,
    simulation = simulation.linox_exploration_log_2,
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
    order = "zd",
    indent = 1,
    trigger =
    {
      type = "research",
      technology = "linox-technology_enhanced-space-engineering"
    },
  },
  {
    type = "tips-and-tricks-item",
    name = "linox-tips-and-tricks_placement_restriction",
    tag = "[item=foundation]",
    category = "linox-tips-and-tricks_category",
    order = "ze",
    indent = 1,
    simulation = simulation.linox_placement_restriction,
    trigger =
    {
      type = "research",
      technology = "linox-technology_exploring-linox-landing-site"
    },
  },
  {
    type = "tips-and-tricks-item",
    name = "linox-tips-and-tricks_planetary-power-network",
    tag = "[item=substation]",
    category = "linox-tips-and-tricks_category",
    order = "zf",
    indent = 1,
    simulation = simulation.linox_planetary_power_network,
    trigger =
    {
      type = "research",
      technology = "linox-technology_exploring-linox-landing-site"
    },
  },
  {
    type = "tips-and-tricks-item",
    name = "linox-tips-and-tricks_npc-system",
    tag = "[virtual-signal=signal-star]",
    category = "linox-tips-and-tricks_category",
    order = "zg",
    indent = 1,
    simulation = simulation.npc_system,
    trigger =
    {
      type = "research",
      technology = "linox-technology_exploring-linox-landing-site"
    },
  },


  --{
  --  type = "tips-and-tricks-item",
  --  name = "linox-tips-and-tricks_power-converter",
  --  tag = "[item=accumulator]",
  --  category = "linox-tips-and-tricks_category",
  --  order = "zd",
  --  indent = 1,
  --  trigger =
  --  {
  --    type = "research",
  --    technology = "linox-technology_planetary-power-network"
  --  },
  --},
})
