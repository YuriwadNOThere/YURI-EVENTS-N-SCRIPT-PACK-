local maxCombo = 0
local sickCount = 0
local goodCount = 0
local badCount = 0
local shitCount = 0

function onCreate()
    makeLuaText("statsText", "", -200, 10, 340)
    setTextSize("statsText", 20)
    setTextAlignment("statsText", "left")
    addLuaText("statsText")
end

function onUpdate()
    local currentCombo = getProperty("combo")
    if currentCombo > maxCombo then
        maxCombo = currentCombo
    end
    
    local accuracy = getProperty("ratingPercent") * 100
    if accuracy ~= accuracy then accuracy = 0 end
    local misses = getProperty("songMisses") or 0
    
    setTextString("statsText",
        string.format("Accuracy: %.2f%%\nMax Combo: %d\nSick: %d\nGood: %d\nBad: %d\nShit: %d\nMisses: %d",
            accuracy, maxCombo, sickCount, goodCount, badCount, shitCount, misses
        )
    )
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    if not isSustainNote then
        local rating = getPropertyFromGroup("notes", id, "rating")
        if rating == "sick" then
            sickCount = sickCount + 1
        elseif rating == "good" then
            goodCount = goodCount + 1
        elseif rating == "bad" then
            badCount = badCount + 1
        elseif rating == "shit" then
            shitCount = shitCount + 1
        end
    end
end
