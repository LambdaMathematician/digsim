module Driver where

import Graphics.Gnuplot.Simple
import System.IO
import Control.Monad
import Data.List
import Data.List.Split
import DigSim
import SimTypes

driver = do
    contents <- readFile "siminputs.txt"
    let l = splitOn "\n" contents
    let simInputsList = map read l :: [SimInputs]
    let simRuns = map digsim simInputsList :: [[State]]
    let xData = map (map getTX) simRuns :: [[XData]]
    let xdData = map (map getTXd) simRuns :: [[XdData]]
    mapM (plotList []) xData
    mapM (plotList []) xdData
    -- print xData

-------------- Stuff for the graph ---------------
getTX :: State -> XData
getTX  (t, x, _, _)  = (t, x)
getTXd :: State -> XdData
getTXd (t, _, xd, _) = (t, xd)

