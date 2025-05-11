function onEvent(name, value1, value2)
    if name == 'Character Disappear' then
        local charType = ''
        local speed = tonumber(value2) or 1

        if value1 == 'bf' then
            charType = 'boyfriend'
        elseif value1 == 'dad' then
            charType = 'dad'
        elseif value1 == 'gf' then
            charType = 'gf'
        else
            debugPrint('Invalid character type: ' .. tostring(value1))
            return
        end

        --the low taper fade
        doTweenAlpha('CharLowFade'..charType, charType, 0, speed, 'linear')
    end
end
