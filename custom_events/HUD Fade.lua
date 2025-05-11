function onEvent(name, value1, value2)
    if name == 'HUD Fade' then
        local duration = tonumber(value1) or 1

        doTweenAlpha('hudFade', 'camHUD', 0, duration, 'linear')
    end
end
