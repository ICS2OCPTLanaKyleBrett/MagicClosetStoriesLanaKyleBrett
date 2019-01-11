-----------------------------------------------------------------------------------------
--
-- main.lua
-- Created by: Your Name
-- Date: Month Day, Year
-- Description: This calls the splash screen of the app to load itself.
-----------------------------------------------------------------------------------------

-- Hiding Status Bar
-- HIDE THE STATUS BAR

-----------------------------------------------------------------------------------------

-- Use composer library
local composer = require( "composer" )

-----------------------------------------------------------------------------------------

--get time in seconds
local now = os.time()

--and milliseconds since app was opened
local millis = system.getTimer()

--concatenate to make a longer unique number
local newSeed = tostring(now)..tostring(millis)

--convert tonumber just to make sure randomseed accepts it
--this seems to round to an int which is fine as number should still be unique
newSeed = tonumber(newSeed)

-- code to make sure to get randomization on iPad
math.randomseed(os.time())

-- Go to the intro screen
composer.gotoScene( "splash_screen" )


