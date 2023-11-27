local consuming = false 
local _TYPES = nil
local Type_Trans = {
    ['hunger'] = {
        dict = 'mp_player_inteat@burger',
        anim = 'mp_player_int_eat_burger',
        desc = Trans[Lang].eat
    },
    ['thirst'] = {
        dict = 'mp_player_intdrink',
        anim = 'loop_bottle',
        desc = Trans[Lang].drink
    },
}

RegisterNetEvent('goodeats:client:Use', function(types, item)
    if not consuming then 
        consuming = true 
        if types == 'hunger' then 
            _TYPES = FOOD[item]
        elseif types == 'thirst' then 
            _TYPES = DRINK[item]
        end
        if _TYPES.prop.enable then 
            lib.progressCircle({
                duration = _TYPES.dur,
                label = Type_Trans[types].desc .. " " .. Label(item) .. "...",
                position = 'bottom',
                useWhileDead = false,
                canCancel = false,
                disable = {
                    car = false,
                    movement = false,
                    combat = true
                },
                anim = {
                    dict = Type_Trans[types].dict,
                    clip = Type_Trans[types].anim
                },
                prop = {
                    model = _TYPES.prop.model,
                    pos = _TYPES.prop.pos,
                    rot = _TYPES.prop.rot
                },
            })
        else
            lib.progressCircle({
                duration = _TYPES.dur,
                label = Type_Trans[types].desc .. " " .. Label(item) .. "...",
                position = 'bottom',
                useWhileDead = false,
                canCancel = false,
                disable = {
                    car = false,
                    movement = false,
                    combat = true
                },
                anim = {
                    dict = Type_Trans[types].dict,
                    clip = Type_Trans[types].anim
                },
            })
        end
        TriggerServerEvent('goodeats:remove', item)
        Replenish(types, _TYPES.add)
        consuming = false
    else
        Notify(Trans[Lang].err, 'error')
    end
end)

function Notify(msg, types)
    lib.notify({
        title = 'Good Eats',
        description = msg,
        type = types
    })
end