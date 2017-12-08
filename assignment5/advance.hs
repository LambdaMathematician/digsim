module Advance where
import SimTypes
import DiffEq

advance :: Restitution -> Gravity -> DT -> State -> State
advance restitution gravity dt (t, x, xd, xdd) = (t', x', xd', xdd')
    where
        t'   = t + dt
        x'   = x + xd * dt
        xd'  = xd + xdd' * dt
        xdd' = diffEq restitution gravity x xd