module Defaults where
import SimTypes

dampingCoefficient = 8.88 :: Damping
gravity = 9.88 :: Gravity
mass = 1.0 :: Mass
springCoefficient = 39.47 :: Spring

t0 = 0.0 :: SimTime
dt = 0.01 :: SimTime
tStop = 2.5 :: SimTime
xIC = 0.0 :: Position
xdIC = 0.0 :: Velocity
xddIC = undefined :: Acceleration
