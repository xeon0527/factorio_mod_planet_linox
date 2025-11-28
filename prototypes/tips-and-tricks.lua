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
    starting_status = "unlocked",
  },
  {
    type = "tips-and-tricks-item",
    name = "linox-tips-and-tricks_exploration-log-1",
    tag = "[virtual-signal=signal-info]",
    category = "linox-tips-and-tricks_category",
    order = "zaa",
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
    order = "zab",
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
    order = "zac",
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
    order = "zad",
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
    name = "linox-tips-and-tricks_placement_restriction2",
    tag = "[item=foundation]",
    category = "linox-tips-and-tricks_category",
    order = "zada",
    indent = 2,
    simulation = simulation.linox_placement_restriction2,
    starting_status = "dependencies-not-met",
    dependencies = {"linox-tips-and-tricks_placement_restriction"},
  },
  {
    type = "tips-and-tricks-item",
    name = "linox-tips-and-tricks_planetary-power-network",
    tag = "[item=substation]",
    category = "linox-tips-and-tricks_category",
    order = "zae",
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
    order = "zaf",
    indent = 1,
    simulation = simulation.npc_system,
    trigger =
    {
      type = "research",
      technology = "linox-technology_exploring-linox-landing-site"
    },
  },
  {
    type = "tips-and-tricks-item",
    name = "linox-tips-and-tricks_recursive-blurprints",
    tag = "[item=blueprint-deployer2]",
    category = "linox-tips-and-tricks_category",
    order = "zag",
    indent = 1,
    simulation = simulation.recursive_blueprints,
    trigger =
    {
      type = "research",
      technology = "linox-technology_facility-factoryizing"
    },
  },
  {
    type = "tips-and-tricks-item",
    name = "linox-tips-and-tricks_rs-latch",
    tag = "[item=decider-combinator]",
    category = "linox-tips-and-tricks_category",
    order = "zaga",
    indent = 2,
    image = "__linox__/graphics/tips-and-tricks/rs-latch.png",
    starting_status = "dependencies-not-met",
    dependencies = {"linox-tips-and-tricks_recursive-blurprints"},
  },
  {
    type = "tips-and-tricks-item",
    name = "linox-tips-and-tricks_signal-converter",
    tag = "[item=electronic-circuit]",
    category = "linox-tips-and-tricks_category",
    order = "zagb",
    indent = 2,
    image = "__linox__/graphics/tips-and-tricks/signal-converter.png",
    starting_status = "dependencies-not-met",
    dependencies = {"linox-tips-and-tricks_recursive-blurprints"},
  },
  {
    type = "tips-and-tricks-item",
    name = "linox-tips-and-tricks_bad-chest",
    tag = "[item=blueprint-deployer]",
    category = "linox-tips-and-tricks_category",
    order = "zagc",
    indent = 2,
    image = "__linox__/graphics/tips-and-tricks/bad-chest.png",
    starting_status = "dependencies-not-met",
    dependencies = {"linox-tips-and-tricks_recursive-blurprints"},
  },
  {
    type = "tips-and-tricks-item",
    name = "linox-tips-and-tricks_bad-chest-area-viewer",
    tag = "[item=blueprint-deployer]",
    category = "linox-tips-and-tricks_category",
    order = "zah",
    indent = 1,
    image = "__linox__/graphics/tips-and-tricks/bad-chest-area-viewer.png",
    starting_status = "dependencies-not-met",
    dependencies = {"linox-tips-and-tricks_recursive-blurprints"},
  },
  {
    type = "tips-and-tricks-item",
    name = "linox-tips-and-tricks_adjust-blueprint-origin",
    tag = "[item=blueprint]",
    category = "linox-tips-and-tricks_category",
    order = "zaha",
    indent = 2,
    image = "__linox__/graphics/tips-and-tricks/adjust-blueprint-origin.png",
    starting_status = "dependencies-not-met",
    dependencies = {"linox-tips-and-tricks_recursive-blurprints"},
  },
  {
    type = "tips-and-tricks-item",
    name = "linox-tips-and-tricks_power-converter",
    tag = "[item=accumulator]",
    category = "linox-tips-and-tricks_category",
    order = "zai",
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
    order = "zaia",
    indent = 2,
    trigger =
    {
      type = "research",
      technology = "linox-technology_power-converter"
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
