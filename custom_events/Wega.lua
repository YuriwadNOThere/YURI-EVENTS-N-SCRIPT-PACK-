function onEvent(name, value1, value2)
    if name == 'Wega' then
        if value1 == '' then
            value1 = 'luigi' --value1 default value
        end
        if value2 == '' then
            value2 = 'wega' --value2 default value
        end

        makeLuaSprite('wega', value1, 0, 0)
        setObjectCamera('wega', 'CamOther')
        screenCenter('wega', 'xy')
        addLuaSprite('wega', true)
        playSound(value2, 1)

        runTimer('dieWega', 1.0) --put more time here case your sound time is bigger
    end
end

function onTimerCompleted(tag)
    if tag == 'dieWega' then
        removeLuaSprite('wega', true)
    end
end
