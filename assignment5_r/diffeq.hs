module DiffEq where
import SimTypes

diffEq :: Damping -> Gravity -> Position -> Velocity -> Acceleration
diffEq restitution gravity position velocity = gravity