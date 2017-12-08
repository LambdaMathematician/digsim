module Advance where
import SimTypes
import DiffEq

advance :: Damping -> Gravity -> Mass -> Spring -> DT -> State -> State
advance damping gravity mass spring dt (t, x, xd, xdd) = (t', x', xd', xdd')
    where
        t'   = t + dt
        x'   = x + xd * dt
        xd'  = xd + xdd' * dt
        xdd' = diffEq damping gravity mass spring x xd