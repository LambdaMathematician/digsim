module DigSim where

import SimTypes
import Advance
import SimEvents
import End

digsim :: SimInputs -> [State]
digsim (restitution, gravity, dt, t0, tStop, xIC, xdIC) = takeWhile (stopCheck tStop) mew
    where
        mew = iterate ((advance restitution gravity dt) . (simEvents dt)) (t0, xIC, xdIC, 0)

