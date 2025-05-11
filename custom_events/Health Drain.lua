local drain = 0

function onEvent(name, value1, value2)
    if name == 'Health Drain' then
        drain = tonumber(value1) or 0.01
    end
end

function opponentNoteHit(id, noteData, noteType, isSustainNote)
    setProperty('health', getProperty('health') - drain)
end
