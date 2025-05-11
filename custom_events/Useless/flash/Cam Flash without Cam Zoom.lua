function onEvent(name, value1)
    if name == 'Cam Flash without Cam Zoom' then
        if value1 == '' or value1 == nil then
            value1 = '#FFFFFF'
        end
        makeLuaSprite('flash', '', 0, 0)
        makeGraphic('flash', screenWidth, screenHeight, value1)
        setObjectCamera('flash', 'other')
        addLuaSprite('flash', true)
        doTweenAlpha('flashFade', 'flash', 0, 0.5, 'linear')
    end
end