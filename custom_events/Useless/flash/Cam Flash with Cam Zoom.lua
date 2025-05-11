function onEvent(name, value1, value2)
    if name == 'Cam Flash with Cam Zoom' then
        if value1 == nil or value1 == '' then
            value1 = '#FFFFFF'
        end

        if value2 == nil or value2 == '' then
            value2 = 0.5
        else
            value2 = tonumber(value2)
        end

        -- Flash
        makeLuaSprite('flash', '', 0, 0)
        makeGraphic('flash', screenWidth, screenHeight, value1)
        setObjectCamera('flash', 'other')
        addLuaSprite('flash', true)
        doTweenAlpha('flashFade', 'flash', 0, 0.5, 'linear')

        -- Proper Camera Zoom
        triggerEvent('Add Camera Zoom', value2, value2)
    end
end

--endendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendendend