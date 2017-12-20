module SimEvents where

import System.IO
import Control.Monad
import SimTypes

simEvents :: DT -> State -> State
simEvents dt = id . (bounceCheck dt)-- composed with anything else you need

bounceCheck :: DT -> State -> State
bounceCheck dt (t, x, xd, xdd) 
    | x + xd * dt + 0.5 * xdd * dt * dt <= 0 = (t', x', -0.8 * xd', xdd)
    | otherwise = (t, x, xd, xdd)
    where
        t' = t + dt'
        -- dt' = max ((-xd - sqrt ( xd * xd - 2 * xdd * x))/(2* xdd)) ((-xd + sqrt ( xd * xd - 2 * xdd * x))/(2*xdd)) -- wrong
        dt' = max ((-xd - sqrt ( xd * xd - 2 * xdd * x))/xdd) ((-xd + sqrt ( xd * xd - 2 * xdd * x))/xdd)
        x' = 0
        xd' = xdd * dt' + xd

