module SimEvents where

import System.IO
import Control.Monad
import SimTypes

simEvents :: State -> State
simEvents = id -- . bounceCheck -- composed with anything else you need

bounceCheck :: State -> State
bounceCheck (t, x, xd, xdd) 
    | x <= 0 = (t, x, -xd, xdd)
    | otherwise = (t, x, xd, xdd)