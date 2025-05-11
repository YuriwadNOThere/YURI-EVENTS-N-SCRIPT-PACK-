function onEvent(name, value1, value2)
    if name == 'Majin spin' then
        for i = 0, 7 do
            noteTweenAngle('spin'..i, i, 360, 0.2, 'quintOut')
        end

        runTimer('spindies', 0.7)
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'spindies' then
        for i = 0, 7 do
            noteTweenAngle('resetSpin'..i, i, 0, 0.01, 'linear')
        end
    end
end
