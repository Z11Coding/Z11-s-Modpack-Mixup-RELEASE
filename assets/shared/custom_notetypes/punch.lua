function onCreate()
    precacheImage('mechanics/matt/HUD/text')
 end
local textD = 0
function goodNoteHit(direction, noteData, typea, isSustainNote)
    if typea == 'pdNote' then
        dodgeAnimPlayR = getRandomInt(1,2)
        if dodgeAnimPlayR == 1 then
            triggerEvent('Play Animation', 'dodge', 'bf')
            playAnim('boyfriend', 'dodge', true)
        elseif dodgeAnimPlayR == 2 then
            triggerEvent('Play Animation', 'duck', 'bf')
            playAnim('boyfriend', 'duck', true)
        end 
        textD = textD + 1
        makeAnimatedLuaSprite('dodgeTEXT'..textD, 'mechanics/matt/HUD/text', 875, 180)
        addAnimationByPrefix('dodgeTEXT'..textD, 'text', 'Dodge', 24, false)
        setObjectCamera('dodgeTEXT'..textD, 'camHUD')
        scaleObject('dodgeTEXT'..textD, 0.8, 0.8)
        setProperty('dodgeTEXT'..textD..'.alpha', 1)   
        addLuaSprite('dodgeTEXT'..textD, true)
    end	  
end
textP = 0
function opponentNoteHit(id, direction, typea, isSustainNote)
    if typea == 'pdNote' then
        triggerEvent('Play Animation', 'parry', 'dad')  
        textP = textP + 1
        makeAnimatedLuaSprite('parryTEXT'..textP, 'mechanics/matt/HUD/text', 175, 180)
        addAnimationByPrefix('parryTEXT'..textP, 'text', 'Parry', 24, false)
        setObjectCamera('parryTEXT'..textP, 'camHUD')
        scaleObject('parryTEXT'..textP, 0.8, 0.8)
        setProperty('parryTEXT'..textP..'.alpha', 1)   
        addLuaSprite('parryTEXT'..textP, true) 	  
    end	  
end
function onUpdate()
    if getProperty('parryTEXT'..textP..'.animation.curAnim.finished') and getProperty('parryTEXT'..textP..'.animation.curAnim.name') == 'text' then
        removeLuaSprite('parryTEXT'..textP, true)
    end
    if getProperty('dodgeTEXT'..textD..'.animation.curAnim.finished') and getProperty('dodgeTEXT'..textD..'.animation.curAnim.name') == 'text' then
        removeLuaSprite('dodgeTEXT'..textD, true)
    end   
end