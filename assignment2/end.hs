module End where
import SimTypes

stopCheck :: SimTime -> State -> Bool
stopCheck tStop (t,_,_,_) = t < tStop