import Graphics.Gnuplot.Simple
import SimTypes
import Defaults
import Advance
import End

states :: [State]
states = takeWhile (stopCheck tStop) mew
    where
        mew = iterate advance (t0, xIC, xdIC, xddIC)

-------------- Stuff for the graph ---------------
getTX  (t, x, _, _)  = (t, x)
getTXd (t, _, xd, _) = (t, xd)

makeXData  = plotList [] $ map getTX states
makeXdData = plotList [] $ map getTXd states

main = do
    makeXData
    makeXdData