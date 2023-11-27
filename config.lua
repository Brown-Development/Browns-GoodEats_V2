config = {}

config.framework = 'qb' -- esx or qb

config.food = {
    ['burger'] = { -- item name
        add = 30, -- amount of food to give player
        dur = 6000, -- the time it takes to eat the food
        prop = { -- prop settings
            enable = true, -- enable or disable food prop
            model = 'prop_cs_burger_01', -- prop model name
            pos = vec3(0.0, 0.0, -0.02), -- the props position relative to the players hand
            rot = vec3(30, 0.0, 0.0) -- the props rotation
        }
    },

    -- ADD AS MANY AS YOU WANT:

    -- ['itemname'] = { 
    --     add = 30, 
    --     dur = 6000,
    --     prop = { 
    --         enable = true, 
    --         model = 'propmodel', 
    --         pos = vec3(0.0, 0.0, -0.02),
    --         rot = vec3(30, 0.0, 0.0)
    --     }
    -- },

}

config.drink = {
    ['water'] = { -- item name
        add = 30, -- amount of drink to give player
        dur = 6000, -- the time it takes to drink the drink
        prop = { -- prop settings
            enable = true, -- enable or disable food prop
            model = 'vw_prop_casino_water_bottle_01a', -- prop model name
            pos = vec3(0.03, 0.03, 0.02), -- the props position relative to the players hand
            rot = vec3(0.0, 0.0, -1.5) -- the props rotation
        }
    },

    -- ADD AS MANY AS YOU WANT
    
    -- ['itemname'] = { 
    --     add = 30, 
    --     dur = 6000,
    --     prop = { 
    --         enable = true, 
    --         model = 'propmodel', 
    --         pos = vec3(0.03, 0.03, 0.02), 
    --         rot = vec3(0.0, 0.0, -1.5)
    --     }
    -- },
}

config.language = 'en'
--**ACCEPTED LANGUAGES**--
--en
--es
--ar
--de
--bs
--cn
--cs
--da
--ee
--el
--et
--fa
--fi
--fr
--ge
--he
--hu
--id
--it
--lv
--nl
--no
--pl
--pt
--pt-br
--ro
--rs
--ru
--sl
--sv
--th
--tr
--vn
