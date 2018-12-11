-----------------------------------------------------------------------------------------
--
-- level1_screen.lua
-- Created by: Your Name
-- Date: Month Day, Year
-- Description: This is the level 1 screen of the game.
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Libraries
local composer = require( "composer" )
local widget = require( "widget" )

-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "level1_screen"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL CONSTANTS
-----------------------------------------------------------------------------------------

-- the position of the top dress
local X1 = 150
local Y1 = 190

-- the position of the bottom dress
local X2 = 150
local Y2 = 490

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- The local variables for this scene
local bkg_image
local lives = 4
-- correct image and wrong image
local correctAnswer
local wrongAnswer

local righttextObject
local wrongtextObject
local question1textObject 
local character1
local heart1
local heart2
local heart3
local heart4
local randomNumber

----------------------------------------------------------------------------------------
--LOCAL FUNCTIONS
----------------------------------------------------------------------------------------

local function UpdateHearts()
    if (lives == 4) then
      heart1.isVisible = true
      heart2.isVisible = true
      heart3.isVisible = true
      heart4.isVisible = true

     elseif (lives == 3) then
      heart1.isVisible = true
      heart2.isVisible = true
      heart3.isVisible = true
      heart4.isVisible = false
  
     elseif (lives == 2) then
      heart1.isVisible = true
      heart2.isVisible = true
      heart3.isVisible = false
      heart4.isVisible = false

     elseif (lives == 1) then
      heart1.isVisible = true
      heart2.isVisible = false
      heart3.isVisible = false
      heart4.isVisible = false

     elseif (lives == 0) then
      heart1.isVisible = false
      heart2.isVisible = false
      heart3.isVisible = false
      heart4.isVisible = false
     
     end
end

local function HideRightTextObject()
    righttextObject.isVisible = false
end

local function correctAnswerListener(touch)

    if (touch.phase == "ended") then
      display.remove(correctAnswer)
      display.remove(wrongAnswer)
       --correctAnswer.isVisible = false
       --wrongAnswer.isVisible = false
       righttextObject.isVisible = true
       timer.performWithDelay(1000, HideRightTextObject)
     end
    
end


local function wrongAnswerListener(touch)

    if (touch.phase == "ended") then
      display.remove(correctAnswer)
      display.remove(wrongAnswer)
       --correctAnswer.isVisible = false
       --wrongAnswer.isVisible = false
       wrongtextObject.isVisible = false

       lives = lives - 1
       UpdateHearts() 
    end

end

local function AskQuestion()
    randomNumber = math.random(1, 3)

    

    if (randomNumber == 1) then
        question1textObject.text = "Which dress has horizontal lines?"
        correctAnswer = display.newImageRect("Images/Dress1.png", 150, 200)      
        wrongAnswer = display.newImageRect("Images/Dress2.png", 150, 240)   
       
    elseif (randomNumber == 2) then
        question1textObject.text = "Pick the curly hair."
        correctAnswer = display.newImageRect("Images/Hair2.png", 150, 200)      
        wrongAnswer = display.newImageRect("Images/Hair1.png", 150, 240)   
    elseif (randomNumber == 3) then
        question1textObject.text = "Which skirt has more colours?"
        correctAnswer = display.newImageRect("Images/Dress4.png", 150, 200)      
        wrongAnswer = display.newImageRect("Images/Dress3.png", 150, 240)   
    end 
end

local function PositionAnswers()
    randomNumber = math.random (1, 3)

    if (randomNumber == 1) then
        -- correct answer will be on top
        correctAnswer.x = X1
        correctAnswer.y = Y1
        -- wrong answer will be on bottom
        wrongAnswer.x = X2
        wrongAnswer.y = Y2
    else
        -- correct answer will be on bottom
        correctAnswer.x = X2
        correctAnswer.y = Y2
        -- wrong answer will be on top
        wrongAnswer.x = X1
        wrongAnswer.y = Y1
    end

end

local function AddTouchListeners()
  correctAnswer:addEventListener("touch", correctAnswerListener)
  wrongAnswer:addEventListener("touch", wrongAnswerListener)
end

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    -- Insert the background image
    bkg_image = display.newImageRect("Images/Level1ScreenLanaZE.png", display.contentWidth, display.contentHeight)
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight
  

    -- Insert background image into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( bkg_image )    

    --create the first character
    character1 = display.newImageRect("Images/character1.png", 190, 240)
    character1.x = display.contentWidth/2
    character1.y = 548
    sceneGroup:insert( character1 )   

    --create the lives to display on the screen
    heart1 = display.newImageRect("Images/heart.png", 100,100)
    heart1.x = display.contentWidth * 7 / 8
    heart1.y = 80
    sceneGroup:insert( heart1 )  

    heart2 = display.newImageRect("Images/heart.png", 100, 100)
    heart2.x = display.contentWidth * 6 / 8
    heart2.y = 80
    sceneGroup:insert( heart2 ) 

    heart3 = display.newImageRect("Images/heart.png", 100, 100)
    heart3.x = display.contentWidth * 5 / 8
    heart3.y = 80
    sceneGroup:insert( heart3 ) 

    heart4 = display.newImageRect("Images/heart.png", 100, 100)
    heart4.x = display.contentWidth * 4 / 8
    heart4.y = 80
    sceneGroup:insert( heart4 )  

    --create dresses
     --[[
    correctAnswer = display.newImageRect("Images/Dress1.png", 150, 200)
    correctAnswer.x = X1
    correctAnswer.y = Y1
    correctAnswer.isVisible = true
    sceneGroup:insert( correctAnswer )  

    wrongAnswer = display.newImageRect("Images/Dress2.png", 150, 240)
    wrongAnswer.x = X2
    wrongAnswer.y = Y2
    wrongAnswer.isVisible = true
    sceneGroup:insert( wrongAnswer )  
]]--


    --create text objects
    righttextObject = display.newText ("Hooray,you got it right!",0, 0, nil, 50)
    righttextObject.x = 700
    righttextObject.y = display.contentHeight/3
    righttextObject:setTextColor (245/255, 154/255, 216/255)
    righttextObject.isVisible = false
    sceneGroup:insert( righttextObject )  

    wrongtextObject = display.newText ("Oops,that's not right!",0, 0, nil, 50)
    wrongtextObject.x = 700
    wrongtextObject.y = display.contentHeight/3
    wrongtextObject:setTextColor (245/255, 154/255, 216/255)
    wrongtextObject.isVisible = false
    sceneGroup:insert( wrongtextObject )  

    question1textObject = display.newText ("",0, 0, nil, 50)
    question1textObject.x = display.contentWidth/2
    question1textObject.y = 710
    question1textObject:setTextColor (245/255, 154/255, 216/255)
    question1textObject.isVisible = true
    sceneGroup:insert( question1textObject )  

end --function scene:create( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then

        -- Called when the scene is still off screen (but is about to come on screen).
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then

        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
        AskQuestion()
        PositionAnswers()
        AddTouchListeners()

    end

end --function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
    end

end --function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.

end -- function scene:destroy( event )

-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------

-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene

