function onEvent(name, value1, value2)
    if name == 'Play Video' then
        setProperty('inCutscene', true)
        startVideo(value1)
        setObjectOrder(value1, 'camHUD')
    end
    return Function_Continue;
end
