------------------------------------------------------------------------------------------------------
-- you_won_level1.lua
-- Created by: Lana ZahrEddin
-- Date: Nov 2nd, 2001
-- Description: This is you won level 1 screen.
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Calling Composer Library
local composer = require( "composer" )

local widget = require( "widget" )

-----------------------------------------------------------------------------------------

-- Naming Scene




sceneName = "you_won_level_2"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- Sounds
-----------------------------------------------------------------------------------------
local YouWonLevel2Sound = audio.loadStream("Sounds/YouWonLevel2.mp3")
local YouWonLevel2SoundChannel

-----------------------------------------------------------------------------------------
-- FORWARD REFERENCES
-----------------------------------------------------------------------------------------

-- local variables for the scene
local bkg

-- Creating Transitioning Function back to main menu
local function BackTransition( )
    composer.gotoScene( "main_menu", {effect = "slideUp", time = 500})
end
----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
--------------------------------------------------------------------------------------
-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -- Display background
    youwin_bkg = display.newImage("Images/YWL2.jpg")
    youwin_bkg.x = display.contentCenterX
    youwin_bkg.y = display.contentCenterY
    youwin_bkg.width = display.contentWidth
    youwin_bkg.height = display.contentHeight
   
    -- Associating display objects with this scene 
    sceneGroup:insert( youwin_bkg )



    
    -- Creating Back Button
    backButton = widget.newButton( 
    {
        -- Setting Position
        x = display.contentWidth*1/8,
        y = display.contentHeight*15/16,
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
   sceneGroup:insert( backButton )
  
end    

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS                                                                    

local function level2Transition()
    composer.gotoScene( "You_Won_level_2" )
end

-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then

        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc    
        
        YouWonLevel2SoundChannel = audio.play( YouWonLevel2Sound, { channnel=1, loops=1})
    end

end

-- Creating Transitioning Function back to level select
local function BackTransition( )
    composer.gotoScene( "level_select", {effect = "slideUp", time = 500})
end
----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
--------------------------------------------------------------------------------------
-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -- Display background
    youwin_bkg = display.newImage("Images/YWL1.jpg")
    youwin_bkg.x = display.contentCenterX
    youwin_bkg.y = display.contentCenterY
    youwin_bkg.width = display.contentWidth
    youwin_bkg.height = display.contentHeight
   
    -- Associating display objects with this scene 
    sceneGroup:insert( youwin_bkg )



    
    -- Creating Back Button
    backButton = widget.newButton( 
    {
        -- Setting Position
        x = display.contentWidth*1/8,
        y = display.contentHeight*15/16,
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
   sceneGroup:insert( backButton )
  
end    
-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
        audio.stop(YouWonLevel2SoundChannel)

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
        -- stop the jungle sounds channel for this screen
        audio.stop(YouWonLevel2SoundChannel)
    end

end

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------


    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.
end

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

