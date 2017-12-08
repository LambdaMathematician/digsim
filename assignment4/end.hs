module End where
import SimTypes

stopCheck :: TStop -> State -> Bool
stopCheck tStop (t,_,_,_) = t < tStop