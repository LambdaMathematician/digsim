module DiffEq where
import SimTypes

diffEq :: Damping -> Gravity -> Mass -> Spring -> Position -> Velocity -> Acceleration
diffEq damping gravity mass spring position velocity =
    -(spring * position + damping * velocity)/mass - gravity