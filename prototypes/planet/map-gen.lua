local map_gen = {};

function map_gen.linox_crust()
    return
    {
        default_enable_all_autoplace_controls = false,
        autoplace_settings =
        {
            ["tile"] = {
                settings =
                {
                    ["linox-tile_superheated-lava"] = {},
                }
            },
        }
    }
end

function map_gen.linox_installation()
    return
    {
        default_enable_all_autoplace_controls = false,
        planet = false,
        platform = false,
        autoplace_settings = {
            ["tile"] = {
                settings =
                {
                    ["linox-tile_out-of-map"] = {},
                }
            },
        }
    }
end

return map_gen
