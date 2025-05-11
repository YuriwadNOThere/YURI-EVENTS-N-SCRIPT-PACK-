local squishMultiplier = 1
local squishFramesPerSecond = 36
local defy = 0.7
local dirs = {'left', 'down', 'up', 'right'}
local squishDuration = 0

function onCreate()
    squishDuration = squishFramesPerSecond * 0.001
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    resetSquishTimers(direction + 4)
    squishNote(direction + 4)
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    resetSquishTimers(direction)
    squishNote(direction)
end

function onKeyPress(key)
    if getPropertyFromGroup('strumLineNotes', key + 4, 'animation.curAnim.name') == 'pressed' then
        resetSquishTimers(key + 4)
        squishNote(key + 4)
    end
end

function squishNote(index)
    setPropertyFromGroup('strumLineNotes', index, 'scale.x', defy * 1.1)
    setPropertyFromGroup('strumLineNotes', index, 'scale.y', defy * 0.9)
    runTimer('resetNoteP1_' .. index, squishDuration)
end

function resetSquishTimers(index)
    for i = 1, 5 do
        cancelTimer('resetNoteP' .. i .. '_' .. index)
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    for i = 0, 7 do
        if tag == 'resetNoteP1_' .. i then
            setPropertyFromGroup('strumLineNotes', i, 'scale.x', (defy * 1.2) * squishMultiplier)
            setPropertyFromGroup('strumLineNotes', i, 'scale.y', (defy * 0.8) / squishMultiplier)
            runTimer('resetNoteP2_' .. i, squishDuration)
        elseif tag == 'resetNoteP2_' .. i then
            setPropertyFromGroup('strumLineNotes', i, 'scale.x', (defy * 1.05) * squishMultiplier)
            setPropertyFromGroup('strumLineNotes', i, 'scale.y', (defy * 0.95) / squishMultiplier)
            runTimer('resetNoteP3_' .. i, squishDuration)
        elseif tag == 'resetNoteP3_' .. i then
            setPropertyFromGroup('strumLineNotes', i, 'scale.x', defy)
            setPropertyFromGroup('strumLineNotes', i, 'scale.y', defy)
            runTimer('resetNoteP4_' .. i, squishDuration)
        elseif tag == 'resetNoteP4_' .. i then
            setPropertyFromGroup('strumLineNotes', i, 'scale.x', (defy * 0.95) / squishMultiplier)
            setPropertyFromGroup('strumLineNotes', i, 'scale.y', (defy * 1.05) * squishMultiplier)
            runTimer('resetNoteP5_' .. i, squishDuration)
        elseif tag == 'resetNoteP5_' .. i then
            setPropertyFromGroup('strumLineNotes', i, 'scale.x', defy)
            setPropertyFromGroup('strumLineNotes', i, 'scale.y', defy)
        end
    end
end

function onUpdatePost(elapsed)
    setProperty('camHUD.scale.x', 1.7)
end
--ANEMANIAC V3.5 NOTE BOUNCE
