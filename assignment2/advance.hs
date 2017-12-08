module Advance where
import SimTypes
import Defaults
import DiffEq

advance :: State -> State
advance (t, x, xd, xdd) = (t', x', xd', xdd')
    where
        t'   = t + dt
        x'   = x + xd * dt
        xd'  = xd + xdd' * dt
        xdd' = diffEq dampingCoefficient gravity mass springCoefficient x xd