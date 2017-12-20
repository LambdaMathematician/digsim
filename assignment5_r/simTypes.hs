module SimTypes where

type Damping = Double
type DT = Double
type TStart = Double
type TStop = Double
type SimTime = Double
type Gravity = Double
type Mass = Double
type Spring = Double
type Position = Double
type Velocity = Double
type Acceleration = Double
type State = (SimTime, Position, Velocity, Acceleration)
type SimInputs = (Restitution, Gravity, DT, TStart, TStop, Position, Velocity)
type XData = (SimTime, Position)
type XdData = (SimTime, Velocity)
type Restitution = Double