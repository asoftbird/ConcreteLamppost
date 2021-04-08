--[[ Original code by Klonan
Edited by asoftbird for v1.1 update
new graphics by asoftbird ]]--

-- wire offset util
function scalePix(offsetW, offsetH, x,y)
  return {((x -offsetW)/32)/2, ((y+offsetH)/32)/2}
end

-- offset for wires
oVt = 11

-- offset for wire shadows
oVt_s = 54


blank =
 {
      filename = "__Concrete_Lamppost_v11__/graphics/concrete_lamppost-sheet.png",
      priority = "extra-high",
      width = 1,
      height = 1
 }


data:extend({

{
    type = "item",
    name = "concrete-lamppost",
    icon = "__Concrete_Lamppost_v11__/graphics/concrete_lamp_icon.png",
    icon_size = 32,
    flags = {},
    subgroup = "energy-pipe-distribution",
    order = "a[energy]-d[concrete-lamp]",
    place_result = "concrete-lamppost",
    stack_size = 50
  },

  {
    type = "item",
    name = "concrete-lamp",
    icon = "__Concrete_Lamppost_v11__/graphics/concrete_lamp_icon.png",
    icon_size = 32,
    flags = {"hidden"},
    subgroup = "energy-pipe-distribution",
    order = "a[energy]-d[concrete-lamp]",
    place_result = "concrete-lamp",
    stack_size = 50
  },
  {
    type = "recipe",
    name = "concrete-lamppost",
    enabled = false,
    ingredients =
    {
      {"concrete", 6},
      {"iron-stick", 8},
      {"small-lamp", 1},
      {"copper-cable", 4}
    },
    result = "concrete-lamppost",
    result_count = 1
  },

{
    type = "electric-pole",
    name = "concrete-lamppost",
    icon = "__Concrete_Lamppost_v11__/graphics/concrete_lamp_icon.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    friendly_map_color = {r = 0.4, g = 0.4, b = 0.4, a = 1},
    minable = {hardness = 0.2, mining_time = 0.3, result = "concrete-lamppost"},
    max_health = 180,
    corpse = "small-remnants",
    resistances =
    {
      {
        type = "impact",
        percent = 90
      },
      {
        type = "fire",
        percent = 100
      },
    },
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.4, -0.4}, {0.4, 0.4}},
    drawing_box = {{-0.5, -4.0}, {1.5, 0.5}},
    maximum_wire_distance = 16,
    supply_area_distance = 0.5,
    mined_sound = {filename = "__base__/sound/deconstruct-bricks.ogg" },
    vehicle_impact_sound =  {filename = "__base__/sound/car-stone-impact.ogg", volume = 1.0 },
    pictures =
    {
      layers =
      {
        { -- lr texture (currently same as hr)
          filename = "__Concrete_Lamppost_v11__/graphics/concrete_lamppost-sheet.png",
          priority = "extra-high",
          width = 198,
          height = 281,
          direction_count = 4,
          shift = util.by_pixel(11, -64.9),
          scale = 0.5
        },
        { --shadow
          filename = "__Concrete_Lamppost_v11__/graphics/concrete_lamp_shadow-sheet.png",
          priority = "extra-high",
          width = 224,
          height = 107,
          direction_count = 4,
          shift = util.by_pixel(50.6, -0.1),
          draw_as_shadow = true,
          scale = 0.5
        }
      }
    },


    connection_points =
    { -- up is negative for some dumb reason

      { -- 1
        shadow =
        {
          copper = scalePix(0, oVt_s, 145, -64),
          red = scalePix(0, oVt_s, 100, -60),
          green = scalePix(0, oVt_s, 118, -49)
        },
        wire =
        {
          copper = scalePix(75, oVt, 94, -215),
          red = scalePix(75, oVt, 67, -184),
          green = scalePix(75, oVt, 87, -169)
        }
      },
      {-- 2
        shadow =
        {
          copper = scalePix(224, oVt_s, 366, -41),
          red = scalePix(224, oVt_s, 342, -61),
          green = scalePix(224, oVt_s, 322, -46)
        },
        wire =
        {
          copper = scalePix(273, oVt, 287, -194),
          red = scalePix(273, oVt, 282, -185),
          green = scalePix(273, oVt, 262, -170)
        }
      },
      {--3
        shadow =
        {
          copper = scalePix(448, oVt_s, 560, -44),
          red = scalePix(448, oVt_s, 566, -48),
          green = scalePix(448, oVt_s, 542, -62)
        },
        wire =
        {
          copper = scalePix(471, oVt, 455, -195),
          red = scalePix(471, oVt, 483, -168),
          green = scalePix(471, oVt, 462, -186)
        }
      },
      {--4
        shadow =
        {
          copper = scalePix(672, oVt_s, 785, -65),
          red = scalePix(672, oVt_s, 768, -47),
          green = scalePix(672, oVt_s, 787, -60)
        },
        wire =
        {
          copper = scalePix(669, oVt, 655, -217),
          red = scalePix(669, oVt, 661, -169),
          green = scalePix(669, oVt, 681, -185)
        }
      }
    },
    radius_visualisation_picture = blank,
    water_reflection =
    {
      pictures =
      {
        filename = "__Concrete_Lamppost_v11__/graphics/concrete_lamp_reflection.png",
        priority = "extra-high",
        width = 12,
        height = 28,
        shift = util.by_pixel(5, 40),
        variation_count = 4,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = true
    }
  },

  {
    type = "lamp",
    name = "concrete-lamp",
    icon = "__Concrete_Lamppost_v11__/graphics/concrete_lamp_icon.png",
    icon_size = 32,
    flags = {"placeable-off-grid", "not-on-map"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "stone-brick"},
    selectable_in_game = false,
    max_health = 55,
    corpse = "small-remnants",
    collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{-0.4, -0.4}, {0.4, 0.4}},
    vehicle_impact_sound =  {filename = "__base__/sound/car-stone-impact.ogg", volume = 1.0 },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    energy_usage_per_tick = "5KW",
    darkness_for_all_lamps_on = 0.5,
    darkness_for_all_lamps_off = 0.3,
    light = {intensity = 0.9, size = 35, color = {r=1.0, g=1.0, b=1.0}},
    glow_size = 6,
    glow_color_intensity = 0.135,
    picture_off = blank,
    picture_on = blank,

    circuit_wire_connection_point =
    {
      shadow =
      {
        red = {0.759375, -0.096875},
        green = {0.759375, -0.096875},
      },
      wire =
      {
        red = {0.30625, -0.39375},
        green = {0.30625, -0.39375},
      }
    },
    circuit_wire_max_distance = 0
  },

{
    type = "technology",
    name = "concrete-lamppost",
    icon = "__Concrete_Lamppost_v11__/graphics/concrete_lamp-tech.png",
    icon_size = 128,
    prerequisites = {"optics", "electric-energy-distribution-1", "concrete"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "concrete-lamppost"
      }
    },
    unit =
    {
      count = 100,
      ingredients = {{"automation-science-pack", 1},{"logistic-science-pack", 1}},
      time = 10
    },
    order = "a-h-b"
  },

  })
