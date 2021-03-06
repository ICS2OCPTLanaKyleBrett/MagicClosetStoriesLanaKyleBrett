
-----------------------------------------------------------------------------------------------------------------------
-- level2_screen.lua
-- Created by: Brett
-- level1_screen.lua
-- Created by: Your Name
-- Date: Month Day, Year
-- Description: This is the level 2 screen of the game.
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Libraries
local composer = require( "composer" )
local widget = require( "widget" )

-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "level2_screen"

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

----------------------------------------------------------------------------------------
-- SOUNDS
-----------------------------------------------------------------------------------------

local level2Sound = audio.loadStream("Sounds/level2bkg.mp3")
local level2SoundChannel

local YouWonLevel2Sound = audio.loadStream("Sounds/YouWonLevel2.mp3")
local YouWonLevel2SoundChannel

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- The local variables for this scene
local bkg_image
local lives = 3

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


local randomNumber
local numQuestionsRight = 0


-- Creating Transitioning Function back to main menu


----------------------------------------------------------------------------------------
--LOCAL FUNCTIONS
----------------------------------------------------------------------------------------
local correctSound = audio.loadStream("Sounds/Correct.mp3")
local correctSoundChannel

local incorrectSound = audio.loadStream("Sounds/Incorrect.mp3")
local incorrectSoundChannel

----------------------------------------------------------------------------------------
--LOCAL FUNCTIONS
----------------------------------------------------------------------------------------
local function AskQuestion()
    randomNumber = math.random(1, 12)    

    print ("***AskQuestion: randomNumber = " .. randomNumber)

    if (randomNumber == 1) then        
        question1textObject.text = "Which hair accessory has red dots?"
        correctAnswer = display.newImageRect("Images/Hairball2.png", 150, 200)      
        wrongAnswer = display.newImageRect("Images/Hairball1.png", 150, 240)   
       
   elseif (randomNumber == 2) then        
        question1textObject.text = "Which hair accessory has black dots?"
        correctAnswer = display.newImageRect("Images/Hairball1.png", 150, 200)      
        wrongAnswer = display.newImageRect("Images/Hairball2.png", 150, 240)   
       
    elseif (randomNumber == 3) then
        question1textObject.text = "Which shoe has green dots?"
        correctAnswer = display.newImageRect("Images/Shoes2.png", 150, 200)      
        wrongAnswer = display.newImageRect("Images/Shoes1.png", 150, 240)  


    elseif (randomNumber == 4) then
        question1textObject.text = "Which dress has a straight appearance?"
        correctAnswer = display.newImageRect("Images/dress24.png", 150, 200)      
        wrongAnswer = display.newImageRect("Images/dress23.png", 150, 240)  



    elseif (randomNumber == 5) then
        question1textObject.text = "Which dress has a curvy appearance?"
        correctAnswer = display.newImageRect("Images/dress23.png", 150, 200)      
        wrongAnswer = display.newImageRect("Images/dress24.png", 150, 240)

    elseif (randomNumber == 6) then        
        question1textObject.text = "Which shoe has yellow dots?"
        correctAnswer = display.newImageRect("Images/shoes1.png", 150, 200)      
        wrongAnswer = display.newImageRect("Images/shoes2.png", 150, 240)   
       
   elseif (randomNumber == 7) then        
        question1textObject.text = "Which bracelet is purple?"
        correctAnswer = display.newImageRect("Images/bracelet1.png", 150, 200)      
        wrongAnswer = display.newImageRect("Images/bracelet2.png", 150, 240) 

   elseif (randomNumber == 8) then        
        question1textObject.text = "Which bracelet is dark blue?"
        correctAnswer = display.newImageRect("Images/bracelet2.png", 150, 200)      
        wrongAnswer = display.newImageRect("Images/bracelet1.png", 150, 240)   
         
       
  elseif (randomNumber == 9) then        
        question1textObject.text = "Which bracelet does not have many colours?"
        correctAnswer = display.newImageRect("Images/bracelet4.png", 150, 200)      
        wrongAnswer = display.newImageRect("Images/bracelet3.png", 150, 240) 

   elseif (randomNumber == 10) then        
        question1textObject.text = "Which bracelet has a lot of colours?"
        correctAnswer = display.newImageRect("Images/bracelet3.png", 150, 200)      
        wrongAnswer = display.newImageRect("Images/bracelet4.png", 150, 240)   

        

   elseif (randomNumber == 11) then        
        question1textObject.text = "Which bracelet has a lot of colours?"
        correctAnswer = display.newImageRect("Images/bracelet3.png", 150, 200)      
        wrongAnswer = display.newImageRect("Images/bracelet4.png", 150, 240)

    elseif (randomNumber == 12) then        
        question1textObject.text = "Which lipstick is blue?"
        correctAnswer = display.newImageRect("Images/Lipstick1.png", 150, 200)      
        wrongAnswer = display.newImageRect("Images/Lipstick2.png", 150, 240)   
           
        
 
     end 

end

local function PositionAnswers()
    randomNumber = math.random (1, 12)
    print ("***PositionAnswers: randomNumber = " .. randomNumber)

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

local function YouLoseTransition()
    composer.gotoScene( "you_lose" )
end




local function YouWonLevel2Transition()
    composer.gotoScene( "You_won_level_2" )
    
end



local function UpdateHearts()
    
     if (lives == 2) then
      heart1.isVisible = false
      heart2.isVisible = true
      heart3.isVisible = true
      

     elseif (lives == 1) then
      heart1.isVisible = false
      heart2.isVisible = false
      heart3.isVisible = true
      
    elseif (lives == 0) then
      heart1.isVisible = false
      heart2.isVisible = false
      heart3.isVisible = false
      timer.performWithDelay(1000, YouLoseTransition)
     end
end



local function HideRightTextObject()
    righttextObject.isVisible = false
    RestartLevel2()
end

local function HideWrongTextObject()
    wrongtextObject.isVisible = false
    RestartLevel2()
end



local function correctAnswerListener(touch)

    if (touch.phase == "ended") then         
        display.remove(correctAnswer)
        display.remove(wrongAnswer)
        --correctAnswer.isVisible = false
        --wrongAnswer.isVisible = false
        righttextObject.isVisible = true
        numQuestionsRight = numQuestionsRight + 1
        timer.performWithDelay(1000, HideRightTextObject)
        correctSoundChannel = audio.play(correctSound)





     end
    
end


local function wrongAnswerListener(touch)

    if (touch.phase == "ended") then
      display.remove(correctAnswer)
      display.remove(wrongAnswer)
       --correctAnswer.isVisible = false
       --wrongAnswer.isVisible = false
       wrongtextObject.isVisible = true

       

       numQuestionsRight = numQuestionsRight + 1 

       lives = lives - 1
       UpdateHearts() 
       timer.performWithDelay(1000, HideWrongTextObject)
       incorrectSoundChannel = audio.play(incorrectSound)
    end

end

local function YouLoseTransition()
    composer.gotoScene( "you_lose" )
end

local function YouWonLevel2Transition()
  composer.gotoScene( "You_won_level_2" )
  YouWonLevel2SoundChannel = audio.play(YouWonLevel2Sound)

end



local function AddTouchListeners()
  correctAnswer:addEventListener("touch", correctAnswerListener)
  wrongAnswer:addEventListener("touch", wrongAnswerListener)
end


local function RemoveTouchListeners()
  correctAnswer:removeEventListener("touch", correctAnswerListener)
  wrongAnswer:removeEventListener("touch", wrongAnswerListener)
end

------------------------------------------------------------------------------
-- GLOBAL FUNCTIONS
-----------------------------------------------------------------------------------------


function RestartLevel2()
    if (numQuestionsRight < 5) then
        -- ask another question
        AskQuestion()
        -- position answers
        PositionAnswers()
        -- add listeners back
        AddTouchListeners()
    else

        YouWonLevel2Transition()


    end
end

------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

local function BackTransition( )
    composer.gotoScene( "main_menu", {effect = "slideUp", time = 500})
end




-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    -- Insert the background image
    bkg_image = display.newImageRect("Images/Level2Screen.png", display.contentWidth, display.contentHeight)
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight

    

    -- Insert background image into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( bkg_image )  





    character2 = display.newImageRect("Images/character2.png", 190, 240)
    character2.x = display.contentWidth/2
    character2.y = 548
    sceneGroup:insert( character2)   

    --create the lives to display on the screen
    heart3 = display.newImageRect("Images/heart.png", 100,100)
    heart3.x = display.contentWidth * 7 / 8
    heart3.y = 80
    sceneGroup:insert( heart3 )  

    heart2 = display.newImageRect("Images/heart.png", 100, 100)
    heart2.x = display.contentWidth * 6 / 8
    heart2.y = 80
    sceneGroup:insert( heart2 ) 

    heart1 = display.newImageRect("Images/heart.png", 100, 100)
    heart1.x = display.contentWidth * 5 / 8
    heart1.y = 80
    sceneGroup:insert( heart1 ) 


    --create text objects
    righttextObject = display.newText ("Hooray,you got it right!",0, 0, nil, 50)
    righttextObject.x = 700
    righttextObject.y = 150
    righttextObject:setTextColor (245/255, 154/255, 216/255)
    righttextObject.isVisible = false
    sceneGroup:insert( righttextObject )  

    wrongtextObject = display.newText ("Oops,that's not right!",0, 0, nil, 50)
    wrongtextObject.x = 700
    wrongtextObject.y = 150
    wrongtextObject:setTextColor (245/255, 154/255, 216/255)
    wrongtextObject.isVisible = false
    sceneGroup:insert( wrongtextObject )  

    question1textObject = display.newText ("",0, 0, nil, 50)
    question1textObject.x = display.contentWidth/2
    question1textObject.y = 710
    question1textObject:setTextColor (245/255, 154/255, 216/255)
    question1textObject.isVisible = true
    sceneGroup:insert( question1textObject )

    -- Creating Back Button
    backButton = widget.newButton( 
    {
        -- Setting Position
        x = display.contentWidth*7/8,
        y = display.contentHeight*4/16,
        width = 160,
        height = 100,

        -- Setting Dimensions
        -- width = 1000,
        -- height = 106,

        -- Setting Visual Properties
        defaultFile = "Images/BackButton Unpressed.png",
        overFile = "Images/BackButton Pressed.png",

        -- Setting Functional Properties
        onRelease = BackTransition

    } )

    -----------------------------------------------------------------------------------------

    -- Associating Buttons with this scene
    sceneGroup:insert( backButton )
end  --function scene:create( event )
  




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
        numQuestionsRight = 0

        RestartLevel2()      

        
        level2SoundChannel = audio.play( level2Sound, { channnel=2, loops=2})
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
        audio.stop(level2SoundChannel)
        
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
        display.remove(correctAnswer)
        display.remove(wrongAnswer)
        
        Runtime:removeEventListener("enterFrame", MoveLogo)
        Runtime:removeEventListener("enterFrame", MoveText)
        -- stop the jungle sounds channel for this screen
        audio.stop(level2SoundChannel)
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

