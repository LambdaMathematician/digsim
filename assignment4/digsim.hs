module DigSim where

import SimTypes
import Defaults
import Advance
import SimEvents
import End

digsim :: SimInputs -> [State]
digsim (damping, gravity, mass, spring, dt, t0, tStop, xIC, xdIC) = takeWhile (stopCheck tStop) mew
    where
        mew = iterate ((advance damping gravity mass spring dt) . simEvents) (t0, xIC, xdIC, xddIC)

