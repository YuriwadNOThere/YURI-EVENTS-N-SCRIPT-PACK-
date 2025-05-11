function onCreatePost()
    makeLuaText('lyrics', '', screenWidth, 0, 570)
    setTextFont('lyrics', 'vcr.ttf')
    setTextSize('lyrics', 24)
    setTextAlignment('lyrics', 'center') 
    setTextBorder('lyrics', 2, '000000')
    setObjectCamera('lyrics', 'hud')
    addLuaText('lyrics')
end

function onEvent(name, value1, value2)
    if name == 'Lyrics' then
        setTextString('lyrics', value1)
        if value2 ~= '' then
            setTextColor('lyrics', value2)
        end
    end
end